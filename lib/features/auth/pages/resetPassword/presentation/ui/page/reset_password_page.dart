import 'dart:ui';
import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/navigation/app_routes.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/core/widgets/buttons/primary_button.dart';
import 'package:almuhafiz_teachers/features/auth/pages/resetPassword/presentation/controllers/reset_password_controller.dart';
import 'package:almuhafiz_teachers/features/auth/pages/resetPassword/presentation/ui/widgets/reset_password_form.dart';
import 'package:almuhafiz_teachers/features/auth/presentation/widgets/clickable_text_row.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPasswordPage extends GetView<ResetPasswordController> {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: Stack(
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
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32.r)),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                          padding: EdgeInsets.all(16.r),
                          width: size.width,
                          height: 671.h,
                          decoration: BoxDecoration(
                            color: AppColors.lightBeige50Clr,
                            borderRadius:
                            BorderRadius.vertical(top: Radius.circular(32.r)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              Text(
                                  AppStrings.instance.changePassword,
                                  style: AppTextStyles.style32W600BlackDeco
                              ),

                              hSpace(40),
                              ResetPasswordForm(),

                              Spacer(),
                              Obx(() {
                                final isActive = controller.isFormValid.value;

                                return PrimaryButton(
                                  txt: AppStrings.instance.confirm,
                                  bkColor: isActive ? AppColors.offWhite : AppColors.lightBeige50Clr,
                                  txtColor: isActive ? AppColors.blackClr : AppColors.grayClr,
                                  height: 56.h,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w800,
                                  onPressed: isActive
                                      ? () async {
                                    Get.toNamed(AppRoutes.passwordChanged);
                                  } : null,
                                );
                              }),


                              hSpace(40),
                              ClickableTextRow(
                                  text: AppStrings.instance.codeNotSent,
                                  clickTxt: AppStrings.instance.resendCode,
                                onTap: () {}
                              )
                            ],
                          )
                      )
                  )
              )
          ),
        ],
      ),
    );
  }
}
