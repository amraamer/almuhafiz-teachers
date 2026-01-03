import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/core/utils/validator_handler.dart';
import 'package:almuhafiz_teachers/features/auth/pages/resetPassword/presentation/controllers/reset_password_controller.dart';
import 'package:almuhafiz_teachers/features/auth/presentation/widgets/text_field_with_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordForm extends GetView<ResetPasswordController> {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          TextFieldWithTitle(
            controller: controller.passwordCtrl,
            title: AppStrings.instance.password,
            hintTxt: AppStrings.instance.password,
            textInputType: TextInputType.visiblePassword,
            validator: ValidatorHandler.strongPasswordValidator,
            onChanged: (value) => controller.validateForm(),
          ),

          hSpace(22),

          TextFieldWithTitle(
            controller: controller.confirmedPassCtrl,
            title: AppStrings.instance.confirmPassword,
            hintTxt: AppStrings.instance.confirmPassword,
            textInputType: TextInputType.visiblePassword,
            validator: (value) =>
                ValidatorHandler.confirmedPassword(controller.passwordCtrl.text)(value),
            onChanged: (value) => controller.validateForm(),
          ),
        ],
      ),
    );
  }
}
