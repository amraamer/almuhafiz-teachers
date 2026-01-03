import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/presentation/controllers/register_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClickableTextSpan extends StatelessWidget {
  final RegisterController controller;
  const ClickableTextSpan({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "${AppStrings.instance.iAgree} ",
                  style: AppTextStyles.style14W500Black,
                ),
                TextSpan(
                  text: "${AppStrings.instance.termsOfUse} ",
                  style: AppTextStyles.style14W500BlackUnderline,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      debugPrint("View Terms of Use");
                    },
                ),
                TextSpan(
                  text: " ${AppStrings.instance.and} ",
                  style: AppTextStyles.style14W500Black,
                ),
                TextSpan(
                  text: AppStrings.instance.privacyPolicy,
                  style: AppTextStyles.style14W500BlackUnderline,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      debugPrint("View Privacy Policy");
                    },
                ),
              ],
            ),
          ),
        ),

        Obx(() => Checkbox(
          value: controller.agreeTerms.value,
          activeColor: AppColors.primaryClr,
          onChanged: controller.toggleTerms
        )),
      ],
    );
  }
}
