import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class CommonToast {

  static Future<void> _show({
    required String message,
    required Color backgroundColor,
    required Color textColor,
    ToastGravity gravity = ToastGravity.BOTTOM,
  }) async {
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 14.sp,
    );
  }

  /// ✅ Success
  static Future<void> success(String message) async {
    await _show(
      message: message,
      backgroundColor: AppColors.primaryShadeClr,
      textColor: AppColors.whiteClr,
    );
  }

  /// ❌ Error
  static Future<void> error(String message) async {
    await _show(
      message: message,
      backgroundColor: AppColors.whiteBlurClr,
      textColor: AppColors.redFlame,
    );
  }

  /// ⚠️ Warning
  static Future<void> warning(String message) async {
    await _show(
      message: message,
      backgroundColor: AppColors.yellowClr,
      textColor: AppColors.black60
    );
  }
}
