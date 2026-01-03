import 'package:almuhafiz_teachers/core/common/common_snacbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final isLoading = false.obs;
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController confirmedPassCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RxBool isFormValid = false.obs;

  void validateForm() {
    isFormValid.value = formKey.currentState?.validate() ?? false;
  }


  void resetPassword() async {
    isLoading.value = true;
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: passwordCtrl.text);
      Get.back();
      CommonSnackBar.success("تم ارسال رابط لتعيين كلمة المرور الجديدة");
    } catch (e) {
      CommonSnackBar.error("البريد الالكتروني غير صحيح");
    }
    isLoading.value = false;
  }
}
