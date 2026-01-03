import 'package:almuhafiz_teachers/features/auth/pages/resetPassword/presentation/controllers/reset_password_controller.dart';
import 'package:get/get.dart';

class ResetPasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ResetPasswordController());
  }
}