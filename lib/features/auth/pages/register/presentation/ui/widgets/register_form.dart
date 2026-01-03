import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/utils/validator_handler.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/presentation/controllers/register_controller.dart';
import 'package:almuhafiz_teachers/features/auth/presentation/widgets/text_field_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterForm extends GetView<RegisterController> {

  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        spacing: 22.h,
        children: [

          TextFieldWithTitle(
            fillColor: AppColors.glassWhiteClr,
            title: AppStrings.instance.enterPreferredName,
            controller: controller.nameCtrl,
            textInputType: TextInputType.text,
            hintTxt: AppStrings.instance.enterNameHere,
            validator: ValidatorHandler.requiredValidator,
          ),

          TextFieldWithTitle(
            fillColor: AppColors.glassWhiteClr,
            title: AppStrings.instance.phone,
            controller: controller.phoneCtrl,
            textInputType: TextInputType.phone,
            hintTxt: AppStrings.instance.phone,
            validator: ValidatorHandler.requiredValidator,
          ),


          TextFieldWithTitle(
            fillColor: AppColors.glassWhiteClr,
            controller: controller.emailCtrl,
            title: AppStrings.instance.email,
            hintTxt: AppStrings.instance.email,
            textInputType: TextInputType.text,
            validator: ValidatorHandler.emailValidator,
          ),

          TextFieldWithTitle(
            fillColor: AppColors.glassWhiteClr,
            controller: controller.passwordCtrl,
            title: AppStrings.instance.password,
            hintTxt: AppStrings.instance.password,
            textInputType: TextInputType.text,
            isPassword: true,
            validator: ValidatorHandler.strongPasswordValidator,
          ),

          TextFieldWithTitle(
            fillColor: AppColors.glassWhiteClr,
            controller: controller.confirmedPassCtrl,
            title: AppStrings.instance.confirmPassword,
            hintTxt: AppStrings.instance.confirmPassword,
            textInputType: TextInputType.text,
            isPassword: true,
            validator: (value) =>
                ValidatorHandler.confirmedPassword(controller.passwordCtrl.text)(value),
          ),
        ],
      ),
    );
  }
}