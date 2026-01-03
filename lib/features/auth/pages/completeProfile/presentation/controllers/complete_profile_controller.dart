import 'dart:io';
import 'package:almuhafiz_teachers/core/common/common_snacbar.dart';
import 'package:almuhafiz_teachers/core/constants/app_constants.dart';
import 'package:almuhafiz_teachers/core/data/enums/riwayah.dart';
import 'package:almuhafiz_teachers/core/data/models/teacher_model.dart';
import 'package:almuhafiz_teachers/core/mini_models/drop_down_item_model.dart';
import 'package:almuhafiz_teachers/core/networking/firebase_service.dart';
import 'package:almuhafiz_teachers/core/services/Auth/auth_service.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/domain/usecases/complete_profile_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfileController extends GetxController {
  final CompleteProfileUseCase _completeProfileUseCase;
  final AuthService _authService;
  final FirebaseService _firebaseService;

  CompleteProfileController(
      this._completeProfileUseCase,
      this._authService,
      this._firebaseService,);

  final isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  final TextEditingController jobCtrl = TextEditingController();
  final TextEditingController ageCtrl = TextEditingController();
  final TextEditingController bioCtrl = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final Rx<File?> selectedImage = Rx<File?>(null);
  final RxString imageUrl = ''.obs;
  final socialLinks = <String>[].obs;
  final worksInAnotherApps = <String>[].obs;
  final List<DropDownItemModel> genders = AppConstantsData.genders;
  RxInt selectedGender = 0.obs;
  late TeacherModel currentUser;
  final RxList<Riwayah> riwayat = <Riwayah>[].obs;


  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as TeacherModel;
    currentUser = args;
  }

  Future<void> completeProfile() async {
    isLoading.value = true;

    // final uploadedImageUrl = await uploadProfileImage();

    final updatedUser = currentUser.copyWith(
      riwayat: riwayat,   //TODO فيه هنا مشكله بسبب النوع
      job: jobCtrl.text,
      age: int.parse(ageCtrl.text),

      // imageProfile: uploadedImageUrl ?? currentUser.imageProfile,
      socialLinks: socialLinks,
      worksInAnotherApps: worksInAnotherApps,
      updatedAt: DateTime.now(),
    );

    final result = await _completeProfileUseCase.call(updatedUser);

    isLoading.value = false;

    result.fold(
          (failure) {
        CommonSnackBar.error(failure.message);
      },
          (user) {
        _authService.signIn(user);
        // Get.offAllNamed(AppRoutes.learningAndRiwayah, arguments: user);
      },
    );
  }

  Future<String?> uploadProfileImage() async {
    if (selectedImage.value == null) return null;

    try {
      final file = selectedImage.value!;

      final imageUrl = await _firebaseService.uploadFileToFireStorage(
        file,
        'teachers/profile_images',
        '.jpg',
      );

      return imageUrl;
    } catch (e) {
      CommonSnackBar.error('imageUploadError'.tr);
      return null;
    }
  }

  Future<void> pickImageFromGallery() async {
    try {
      final XFile? pickedImage =
      await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (pickedImage != null) {
        selectedImage.value = File(pickedImage.path);
      }
    } catch (e) {
      CommonSnackBar.error('imagePickError'.tr);
    }
  }



  @override
  void onClose() {
    // nameCtrl.dispose();
    jobCtrl.dispose();
    super.onClose();
  }
}