import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/navigation/app_routes.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/core/utils/validator_handler.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/presentation/controllers/login_controller.dart';
import 'package:almuhafiz_teachers/features/auth/presentation/widgets/text_field_with_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends GetView<LoginController> {

 const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hSpace(16),
          TextFieldWithTitle(
            controller: controller.emailCtrl,
            fillColor: AppColors.glassWhiteClr,
            title: AppStrings.instance.email,
            hintTxt: AppStrings.instance.email,
            textInputType: TextInputType.emailAddress,
            validator: ValidatorHandler.emailValidator,
          ),

          hSpace(16),
          TextFieldWithTitle(
            controller: controller.passwordCtrl,
            fillColor: AppColors.glassWhiteClr,
            title: AppStrings.instance.password,
            hintTxt: AppStrings.instance.confirmPassword,
            textInputType: TextInputType.visiblePassword,
            // validator: ValidatorHandler.strongPasswordValidator,
          ),

          hSpace(10),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.forgotPassword),
            child: Text(AppStrings.instance.forgotPassword,
              style: AppTextStyles.style14W600Black,),
          )
        ],
      ),
    );
  }
}