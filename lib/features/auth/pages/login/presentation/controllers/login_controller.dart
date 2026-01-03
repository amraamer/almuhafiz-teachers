import 'package:almuhafiz_teachers/core/common/common_snacbar.dart';
import 'package:almuhafiz_teachers/core/navigation/app_routes.dart';
import 'package:almuhafiz_teachers/core/networking/firebase_constants.dart';
import 'package:almuhafiz_teachers/core/services/Auth/auth_service.dart';
import 'package:almuhafiz_teachers/features/auth/pages/completeProfile/data/models/complete_profile_args.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/data/models/login_email_password_request.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/domain/usecases/login_use_case.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/domain/usecases/login_with_apple_use_case.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/domain/usecases/login_with_google_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase;
  final AuthService _authService;
  final LoginWithGoogleUseCase _loginWithGoogleUseCase;
  final LoginWithAppleUseCase _loginWithAppleUseCase;

  LoginController(
    this._loginUseCase,
    this._authService,
    this._loginWithGoogleUseCase,
    this._loginWithAppleUseCase,
  );

  final isLoading = false.obs;
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    isLoading.value = true;
    final signInEmailPasswordRequestModel = LoginEmailPasswordRequest(
        email: emailCtrl.text, password: passwordCtrl.text);
    final signInOrFailure =
        await _loginUseCase(signInEmailPasswordRequestModel);
    isLoading.value = false;
    signInOrFailure.fold(
      (l) {
        CommonSnackBar.error(
            firebaseArabicMessages[l.message] ?? l.message);
      },
      (r) {
        _authService.signIn(r);
      },
    );
  }

  void logInWithGoogle() async {
    isLoading.value = true;

    final signInOrFailure =
    await _loginWithGoogleUseCase.call(null);
    isLoading.value = false;
    signInOrFailure.fold(
          (l) {
            CommonSnackBar.error(firebaseArabicMessages[l.message] ?? l.message);
      },
          (r) {
        if(r.newTeacher){
          final CompleteProfileArgs completeProfileArgs = CompleteProfileArgs(
            email: r.teacherEmail ?? "",
            userId: r.teacherId,
          );
            Get.toNamed(AppRoutes.completeProfile,arguments: completeProfileArgs);
        }else if(!r.newTeacher && r.teacher != null){
          _authService.signIn(r.teacher!);
        }else{
          CommonSnackBar.error(firebaseArabicMessages['unknownError'] ?? 'unknownError'.tr);
        }
      },
    );
  }

  void logInWithApple() async {
    isLoading.value = true;
    final signInOrFailure =
    await _loginWithAppleUseCase.call(null);
    isLoading.value = false;
    signInOrFailure.fold(
          (l) {
            CommonSnackBar.error(firebaseArabicMessages[l.message] ?? l.message);
          },
          (r) {
            if(r.newTeacher){
              final CompleteProfileArgs completeProfileArgs = CompleteProfileArgs(
                email: r.teacherEmail ?? "",
                userId: r.teacherId,
                name: r.teacherName,
              );
              Get.toNamed(AppRoutes.completeProfile,arguments: completeProfileArgs);
            }else if(!r.newTeacher && r.teacher != null){
              _authService.signIn(r.teacher!);
            }else{
              CommonSnackBar.error(firebaseArabicMessages['unknownError'] ?? 'unknownError'.tr);
            }
      },
    );
  }

  Future<void> loginAsGuest()async{
    isLoading.value = true;
    await _authService.signInAsGuest();
    isLoading.value = false;

  }
}
