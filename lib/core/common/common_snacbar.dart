import 'dart:ui';
import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_dimens.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CommonSnackBar {

  static void success(String message, {String? title}) {
    _showSnackBar(
      title: title ?? AppStrings.instance.success,
      message: message,
      backgroundColor: AppColors.backgroundClr,
      textColor: AppColors.primaryShadeClr,
      icon: Icons.check_circle,
    );
  }

  static void error(String message, {String? title}) {
    _showSnackBar(
      title: title ?? AppStrings.instance.error,
      message: message,
      backgroundColor: AppColors.backgroundClr,
      textColor: AppColors.redFlame,
      icon: Icons.error,
    );
  }

  static void warning( String message, {String? title}) {
    _showSnackBar(
      title: title ?? AppStrings.instance.error,
      message: message,
      backgroundColor: AppColors.backgroundClr,
      textColor: AppColors.yellowClr,
      icon: Icons.warning,
    );
  }


  static void _showSnackBar({
    required String title,
    required String message,
    required Color backgroundColor,
    required Color textColor,
    required IconData icon,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.symmetric(horizontal: AppDimens.r8),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        barBlur: 0,
        messageText: ClipRRect(
          borderRadius: BorderRadius.circular(AppDimens.r24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              padding: EdgeInsets.all(AppDimens.r12),
              decoration: BoxDecoration(
                color: AppColors.glassWhiteClr,
                borderRadius: BorderRadius.circular(AppDimens.r24),
                border: Border.all(
                  color: AppColors.glassWhiteClr,
                ),
              ),
              child: Row(
                children: [
                  Icon(icon, color: textColor),
                  wSpace(AppDimens.w12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.style16W700.copyWith(color: textColor)
                        ),
                        hSpace(AppDimens.h5),
                        Text(
                          message,
                          style: TextStyle(color: textColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
