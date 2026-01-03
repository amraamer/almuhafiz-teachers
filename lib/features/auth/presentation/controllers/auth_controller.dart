
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/mini_models/drop_down_item_model.dart';
import 'package:almuhafiz_teachers/features/auth/presentation/controllers/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements AuthManager {

  late final TextEditingController emailCtrl;
  late final TextEditingController passwordCtrl;
  late final TextEditingController confirmedPassCtrl;
  late final TextEditingController nameCtrl;
  late final TextEditingController ageCtrl;
  RxBool agreeTerms = false.obs;
  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  RxBool isFormValid = false.obs;
  RxBool isOtpFormValid = false.obs;
  RxInt gender = 0.obs;
  RxInt age = 0.obs;
  List<DropDownItemModel<int>> ageList = List.generate(
      95,
        (index) => DropDownItemModel(
      title: "${6 + index} ${AppStrings.instance.year}",
      value: 6 + index,
    ),
  );

  @override
  void validateForm() {
    isFormValid.value = changePasswordFormKey.currentState?.validate() ?? false;
  }

  @override
  void validateOtpForm() {
    isOtpFormValid.value = otpFormKey.currentState?.validate() ?? false;
  }

  @override
  void onInit() {
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    confirmedPassCtrl = TextEditingController();
    nameCtrl = TextEditingController();
    ageCtrl = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    confirmedPassCtrl.dispose();
    nameCtrl.dispose();
    ageCtrl.dispose();
    super.onClose();
  }
}