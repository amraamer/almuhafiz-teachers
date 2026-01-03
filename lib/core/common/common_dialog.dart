import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_dimens.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/navigation/app_routes.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/core/utils/validator_handler.dart';
import 'package:almuhafiz_teachers/core/widgets/buttons/glass_button.dart';
import 'package:almuhafiz_teachers/core/widgets/buttons/primary_button.dart';
import 'package:almuhafiz_teachers/core/widgets/inputs/custom_text_field.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonDialog {

  static Future<void> showLoadingDialog({
    required String title,
    required String bodyText,
    required String firstButtonText,
    required String secondButtonText,
    String? warningText,
    Future<void> Function()? firstButtonAction,
    Future<void> Function()? secondButtonAction,
  }) async {
    await Get.dialog(
      Dialog(
        backgroundColor: AppColors.whiteClr,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.w,
            vertical: 20.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.style14W600Primary,
              ),
              hSpace(16),
              Image.asset(
                Assets.images.loadingImage.path,
                height: 150.h,
                width: 211.w,
              ),
              hSpace(16),
              Text(
                bodyText,
                textAlign: TextAlign.center,
                style: AppTextStyles.style16W600Black,
              ),
              hSpace(16),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      txt: firstButtonText,
                      height: 50.h,
                      btnRadius: AppDimens.r32,
                      onPressed: () async {
                        await firstButtonAction?.call();
                        Get.back();
                      },
                    ),
                  ),
                  wSpace(10),
                  Expanded(
                    child: GlassButton(
                      txt: secondButtonText,
                      btnRadius: AppDimens.r32,
                      height: 50.h,
                      onPressed: () async {
                        await secondButtonAction?.call();
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );}


  static Future<void> showAlertDialog({
    required String title,
    required String bodyText,
    required String icon,
    required String firstButtonText,
    required String secondButtonText,
    Color? firstBtnColor,
    Color? secondBtnColor,
    String? warningText,
    Future<void> Function()? firstBtnAction,
    Future<void> Function()? secondBtnAction,
  }) async {
    await Get.dialog(
      Dialog(
        backgroundColor: AppColors.whiteClr,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.r12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.w16,
            vertical: AppDimens.h16,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.style20W700primaryShade,
                ),
                hSpace(16),
                Image.asset(
                  icon,
                  height: 150.h,
                  width: 211.w,
                ),
                hSpace(16),
                Text(
                  bodyText,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.style16W600Black,
                ),
                hSpace(16),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        txt: firstButtonText,
                        height: 50.h,
                        btnRadius: AppDimens.r32,
                        bkColor: firstBtnColor,
                        onPressed: () async {
                          await firstBtnAction?.call();
                          Get.back();
                        },
                      ),
                    ),
                    wSpace(6),
                    Expanded(
                      child: GlassButton(
                        txt: secondButtonText,
                        btnRadius: AppDimens.r32,
                        height: 50.h,
                        bkColor: secondBtnColor,
                        onPressed: () async {
                          await secondBtnAction?.call();
                          Get.back();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static Future<void> showSuccessDialog({
    required String title,
    required String bodyText,
    required String icon,
    required String firstButtonText,
    required String secondButtonText,
    Color? firstBtnColor,
    Color? secondBtnColor,
    String? warningText,
    Future<void> Function()? firstBtnAction,
    Future<void> Function()? secondBtnAction,
  }) async {
    await Get.dialog(
      Dialog(
        backgroundColor: AppColors.whiteClr,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.r12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.w16,
            vertical: AppDimens.h16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.style20W700primaryShade,
              ),
              hSpace(16),
              Image.asset(
                icon,
                height: 150.h,
                width: 211.w,
              ),
              hSpace(16),
              Text(
                bodyText,
                textAlign: TextAlign.center,
                style: AppTextStyles.style16W600Black,
              ),
              hSpace(16),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      txt: firstButtonText,
                      height: 50.h,
                      btnRadius: AppDimens.r32,
                      bkColor: firstBtnColor,
                      onPressed: () async {
                        await firstBtnAction?.call();
                        Get.back();
                      },
                    ),
                  ),
                  wSpace(6),
                  Expanded(
                    child: GlassButton(
                      txt: secondButtonText,
                      btnRadius: AppDimens.r32,
                      height: 50.h,
                      bkColor: secondBtnColor,
                      onPressed: () async {
                        await secondBtnAction?.call();
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

    static Future<void> textInputDialog({
      required String title,
      required TextEditingController controller,
      required String firstButtonText,
      required String secondButtonText,
      Color? firstBtnColor,
      Color? secondBtnColor,
      String? warningText,
      Future<void> Function()? firstBtnAction,
      Future<void> Function()? secondBtnAction,
      required GlobalKey<FormState> formKey,
    }) async {
      await Get.dialog(
        Dialog(
          backgroundColor: AppColors.whiteClr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.r12),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.w16,
              vertical: AppDimens.h16,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.style20W700primaryShade,
                  ),
                  hSpace(16),
                  Text(
                    AppStrings.instance.deleteAccountWarning,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.style16W600Black,
                  ),
                  hSpace(16),
                  Image.asset(
                    Assets.images.delete.path,
                    height: 120.h,
                    width: 180.w,
                  ),
                  hSpace(16),
                  CustomTextFormField(
                      controller: controller,
                      validator: ValidatorHandler.requiredValidator,
                      hintTxt: AppStrings.instance.password,
                      isPassword: true,
                      ),
                  hSpace(16),

                  hSpace(16),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          txt: firstButtonText,
                          height: 50.h,
                          btnRadius: AppDimens.r32,
                          bkColor: firstBtnColor,
                          onPressed: () async {
                            await firstBtnAction?.call();
                          },
                        ),
                      ),
                      wSpace(6),
                      Expanded(
                        child: GlassButton(
                          txt: secondButtonText,
                          btnRadius: AppDimens.r32,
                          height: 50.h,
                          bkColor: secondBtnColor,
                          onPressed: () async {
                            await secondBtnAction?.call();
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );
  }


  static void loginFirst (){
    showAlertDialog(
        title: AppStrings.instance.loginFirst,
        bodyText: AppStrings.instance.loginFirstBody,
        icon: Assets.images.errorCircle.path,
        firstButtonText: AppStrings.instance.loginNow,
        firstBtnAction: () async => Get.offAllNamed(AppRoutes.login),
        secondBtnAction: () async => Get.back(),
        secondButtonText: AppStrings.instance.cancel);
  }

  static void deleteAccount ({
    required Future<void> Function() action,
    required TextEditingController controller,
    required GlobalKey<FormState> formKey}){
    CommonDialog.textInputDialog(
      title: AppStrings.instance.deleteAccount,
      controller: controller,
      firstButtonText: AppStrings.instance.deleteYes,
      secondButtonText: AppStrings.instance.deleteNo,
      firstBtnColor: AppColors.redFlame,
      formKey: formKey,
    );
  }

  static void showLogOutDialog ({required Future<void> Function() action}){
    showAlertDialog(
        title: AppStrings.instance.logout,
        bodyText: AppStrings.instance.logoutBody,
        icon: Assets.images.delete.path,
        firstBtnColor: AppColors.primaryShadeClr,
        firstBtnAction: action,
        secondBtnAction: () async => Get.back(),
        firstButtonText: AppStrings.instance.logout,
        secondButtonText: AppStrings.instance.cancel);
  }

}
