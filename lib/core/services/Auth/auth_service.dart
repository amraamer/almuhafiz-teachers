  import 'package:almuhafiz_teachers/core/common/common_snacbar.dart';
import 'package:almuhafiz_teachers/core/data/models/user_model.dart';
import 'package:almuhafiz_teachers/core/navigation/app_routes.dart';
import 'package:almuhafiz_teachers/networking/firebase_constants.dart';
import 'package:almuhafiz_teachers/networking/firebase_keys.dart';
  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:firebase_messaging/firebase_messaging.dart';
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:get_storage/get_storage.dart';

  enum AuthType {
    none,
    authenticated,
    guest,
  }

  class AuthService extends GetxController {

    final Rx<AuthType> authType = AuthType.none.obs;

    final Rx<UserModel?> currentUser = Rx<UserModel?>(null);


    // void signIn(UserModel userModel) {
    //   authType.value = AuthType.authenticated;
    //   currentUser.value = userModel;
    //   navigateUser();
    //   try{
    //     Get.find<FavoriteService>().getFavoritesFromFireStore();
    //   }catch(e){
    //     debugPrint("error while Get.find<Favorite>().getFavoritesFromFireStore(); $e");
    //   }
    // }

    Future<void> checkAuth() async {
      try {
        final savedUser = FirebaseAuth.instance.currentUser;

        if (savedUser != null) {
          if(savedUser.isAnonymous){
            authType.value = AuthType.guest;
          }else{
            try{
              await FirebaseFirestore.instance
                  .collection(FirebaseConstants.usersCollection)
                  .doc(savedUser.uid)
                  .get()
                  .then((value) {
                currentUser.value = UserModel.fromJson(value.data()!);
                authType.value = AuthType.authenticated;
              });
            }catch(e){
              debugPrint("error while getUserFromFireStore checkAuth $e");
            }
          }
        } else {
          authType.value = AuthType.none;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    Future<void> signOut() async {
      await FirebaseAuth.instance.signOut();
      authType.value = AuthType.none;
      Get.offAllNamed(AppRoutes.login);
    }

    void navigateUser() {
      _updateDeviceTokenIfNeeded();
      if (FirebaseAuth.instance.currentUser != null) {
        if(currentUser.value != null){
          if (currentUser.value?.accountStatus ?? true) {
            Get.offAllNamed(AppRoutes.bottomNav);
          } else {
            Get.offAllNamed(AppRoutes.block);
          }
        }else if (FirebaseAuth.instance.currentUser!.isAnonymous) {
          Get.offAllNamed(AppRoutes.bottomNav);
        }else {
          Get.offAllNamed(AppRoutes.login);
        }
      }else {
        bool sawOnboardingBefore = true;
        final GetStorage storage = GetStorage();
        sawOnboardingBefore = storage.read("seen_on_boarding") ?? false;
        debugPrint("navigateUser: sawOnboardingBefore $sawOnboardingBefore");
        if(sawOnboardingBefore){
          Get.offAllNamed(AppRoutes.login);
        }else{
          Get.offAllNamed(AppRoutes.onBoarding);
        }
      }
    }

    Future<void> signInAsGuest() async {
      await FirebaseAuth.instance.signInAnonymously();
      authType.value = AuthType.guest;
      Get.offAllNamed(AppRoutes.bottomNav);

    }

    void deviceTokenListener() async {
      if(currentUser.value != null && authType.value == AuthType.authenticated) {
        FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
          FirebaseFirestore.instance
              .collection(FirebaseConstants.usersCollection)
              .doc(currentUser.value?.id)
              .update({FireKeys.fcmToken: fcmToken});
          currentUser.value = currentUser.value?.copyWith(fcmToken: fcmToken);
        });
      }
    }

    Future<void> _updateDeviceTokenIfNeeded() async {
      if(currentUser.value == null || authType.value != AuthType.authenticated) return;
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken == null) return;

      final userDocRef = FirebaseFirestore.instance
          .collection(FirebaseConstants.usersCollection)
          .doc(currentUser.value?.id);

      final docSnapshot = await userDocRef.get();
      String? storedToken = docSnapshot.data()?[FireKeys.fcmToken];

      // Update only if the token is different
      if (storedToken != fcmToken) {
        await userDocRef.update({FireKeys.fcmToken: fcmToken});
        currentUser.value = currentUser.value?.copyWith(fcmToken: fcmToken);
      }
    }

    Future<void> changePasswordWithReAuth({
      required String oldPassword,
      required String newPassword,
    }) async {
      try {
        final user = FirebaseAuth.instance.currentUser;

        if (user == null || user.email == null) {
          throw Exception("User not found");
        }
        final credential = EmailAuthProvider.credential(
          email: user.email!,
          password: oldPassword,
        );
        await user.reauthenticateWithCredential(credential);
        await user.updatePassword(newPassword);
        CommonSnackBar.success("passwordChangedSuccessfully".tr);
      } on FirebaseAuthException catch (e) {
        CommonSnackBar.error(_mapFirebaseError(e.code));
      } catch (e) {
        CommonSnackBar.error("unexpectedError".tr);
      }
    }

    Future<void> deleteAccount({String? password}) async {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        CommonSnackBar.error("userNotLoggedIn".tr);
        return;
      }

      try {
        if (!user.isAnonymous) {
          if (user.email == null || password == null) {
            CommonSnackBar.error("pleaseLoginAgain".tr);
            return;
          }
          final credential = EmailAuthProvider.credential(
            email: user.email!,
            password: password,
          );
          await user.reauthenticateWithCredential(credential);
        }
        if (currentUser.value?.id != null) {
          await FirebaseFirestore.instance
              .collection(FirebaseConstants.usersCollection)
              .doc(currentUser.value!.id)
              .delete();
        }
        await user.delete();

        authType.value = AuthType.none;
        currentUser.value = null;
        Get.offAllNamed(AppRoutes.login);

        CommonSnackBar.success('accountDeleted'.tr);

      } on FirebaseAuthException catch (e) {
        if (e.code == 'requires-recent-login') {
          CommonSnackBar.error("accountDeletedAlert".tr);
        } else {
          CommonSnackBar.error(_mapFirebaseError(e.code));
        }
      } catch (e) {
        CommonSnackBar.error("unexpectedError".tr);
        debugPrint("deleteAccount error: $e");
      }
    }



    @override
    void onInit() {
      super.onInit();
      deviceTokenListener();
    }

    String _mapFirebaseError(String code) {
      switch (code) {
        case 'wrong-password':
          return 'oldPasswordIncorrect'.tr;
        case 'weak-password':
          return 'weakNewPassword'.tr;
        case 'requires-recent-login':
          return 'pleaseLoginAgain'.tr;
        default:
          return 'unexpectedError'.tr;
      }
    }

  }
