import 'dart:ui';
import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/navigation/app_routes.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/core/widgets/buttons/primary_button.dart';
import 'package:almuhafiz_teachers/features/auth/presentation/widgets/clickable_text_row.dart';
import 'package:almuhafiz_teachers/features/auth/presentation/widgets/otp_form.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.pngs.authImage.path),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                width: size.width,
                height: 671.h,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: AppColors.lightBeige50Clr,
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(32.r)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    hSpace(20),
                    Text(
                        AppStrings.instance.forgotPassword,
                        style: AppTextStyles.style32W600BlackDeco
                    ),

                    hSpace(30),
                    Text(
                        AppStrings.instance.sentCodeToEmail,
                        style: AppTextStyles.style16W600Black,
                      textAlign: TextAlign.center,
                    ),
                    hSpace(30),
                    OtpForm(),
                    Spacer(),
                    PrimaryButton(
                        txt: AppStrings.instance.continueTxt,
                        bkColor: AppColors.offWhite,
                        txtColor: AppColors.blackClr,
                        fontSize: 20.sp,
                        height: 50.h,
                        fontWeight: FontWeight.w800,
                        onPressed: () async {
                          Get.toNamed(AppRoutes.resetPassword);
                        }),

                    hSpace(40),
                    ClickableTextRow(
                        text: AppStrings.instance.codeNotSent,
                        clickTxt: AppStrings.instance.resendCode,
                      onTap: () {})
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
