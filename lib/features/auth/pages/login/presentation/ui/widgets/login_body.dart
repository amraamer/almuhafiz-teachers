import 'dart:ui';
import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/navigation/app_routes.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/core/widgets/buttons/primary_button.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/presentation/controllers/login_controller.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/presentation/ui/widgets/login_form.dart';
import 'package:almuhafiz_teachers/features/auth/presentation/widgets/clickable_text_row.dart';
import 'package:almuhafiz_teachers/features/auth/presentation/widgets/social_cards_widget.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginBody extends GetView<LoginController> {
  const LoginBody({super.key});

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
                height: 700.h,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: AppColors.lightBeige50Clr,
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(32.r)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          AppStrings.instance.login,
                          style: AppTextStyles.style32W600BlackDeco
                      ),

                      hSpace(22),
                      LoginForm(),

                      hSpace(22),
                      PrimaryButton(
                          txt: AppStrings.instance.signIn,
                          bkColor: AppColors.offWhite,
                          txtColor: AppColors.blackClr,
                          fontSize: 20.sp,
                          height: 50.h,
                          fontWeight: FontWeight.w800,
                          onPressed: () async {
                              await controller.login();
                          }),
                      hSpace(16),

                      Text(AppStrings.instance.or,
                        style: AppTextStyles.style14W600Black,),

                      hSpace(16),
                      Row(
                        children: [
                          Expanded(child: SocialCardsWidget(icon: Assets.svgs.apple, onTap: () {})),
                          wSpace(12),
                          Expanded(child: SocialCardsWidget(icon: Assets.svgs.google, onTap: () {})),
                        ],
                      ),

                      hSpace(30),

                      ClickableTextRow(
                          text: AppStrings.instance.noAccount,
                          clickTxt: AppStrings.instance.createAccountNow,
                          onTap: () => Get.toNamed(AppRoutes.register),)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
