import 'package:almuhafiz_teachers/features/auth/pages/forgetPassword/presentation/controllers/forget_password_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<ForgetPasswordController>(ForgetPasswordController());
  }
}