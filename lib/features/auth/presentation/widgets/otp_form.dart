import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/utils/validator_handler.dart';
import 'package:almuhafiz_teachers/features/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpForm extends GetView<AuthController> {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child:Pinput(
        validator: ValidatorHandler.otpValidator,
        onChanged: (_) => controller.validateOtpForm(),
        length: 6,
        onCompleted: (value) {
          controller.validateOtpForm();
          debugPrint("الكود هو: $value");
        },
        keyboardType: TextInputType.number,
        preFilledWidget: Center(
          child: Container(
            width: 12.w,
            height: 2.h,
            color: AppColors.whiteBlurClr
          ),
        ),
        defaultPinTheme: PinTheme(
          height: 64.h,
          width: 51.w,
          textStyle: AppTextStyles.style24W600Black,
          decoration: BoxDecoration(
            color: AppColors.glassWhiteClr,
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      )

    );

  }
}
