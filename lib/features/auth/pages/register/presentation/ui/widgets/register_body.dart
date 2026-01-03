import 'dart:ui';
import 'package:almuhafiz_teachers/core/common/common_snacbar.dart';
import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_dimens.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/navigation/app_routes.dart';
import 'package:almuhafiz_teachers/core/utils/form/form_auto_scroll.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/core/widgets/buttons/primary_button.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/presentation/controllers/register_controller.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/presentation/ui/widgets/clickable_text_span.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/presentation/ui/widgets/register_form.dart';
import 'package:almuhafiz_teachers/features/auth/presentation/widgets/clickable_text_row.dart';
import 'package:almuhafiz_teachers/features/auth/presentation/widgets/social_cards_widget.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterBody extends GetView<RegisterController> {
  const RegisterBody({super.key});

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
          // bottom: 0,
          child: ClipRRect(

            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 33, sigmaY: 33),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: AppDimens.h50, horizontal: AppDimens.w18),
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.lightBeige50Clr,
                ),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          AppStrings.instance.createNewAccount,
                          style: AppTextStyles.style32W600BlackDeco
                      ),
                      hSpace(20),

                      RegisterForm(),

                      ClickableTextSpan(controller: controller),

                      hSpace(16),
                      PrimaryButton(
                          txt: AppStrings.instance.createAccount,
                          bkColor: AppColors.offWhite,
                          txtColor: AppColors.blackClr,
                          fontSize: 20.sp,
                          height: 56.h,
                          btnRadius: AppDimens.r55,
                          fontWeight: FontWeight.w800,
                          onPressed: () async {
                            if (controller.agreeTerms.value) {
                              if (controller.formKey.validateAndScroll()) {
                               await controller.register();
                              }
                            } else {
                              CommonSnackBar.error(AppStrings.instance.mustAcceptTerms,);
                            }
                          }),
                      hSpace(16),

                      Text(AppStrings.instance.or,
                        style: AppTextStyles.style16W600Black,),

                      hSpace(16),
                      Row(
                        children: [
                          Expanded(child: SocialCardsWidget(icon: Assets.svgs.apple, onTap: () {})),
                          wSpace(12),
                          Expanded(child: SocialCardsWidget(icon: Assets.svgs.google, onTap: () {})),
                        ],
                      ),

                      hSpace(40),

                      ClickableTextRow(
                          text: AppStrings.instance.alreadyHaveAccount,
                          clickTxt: AppStrings.instance.loginNow,
                        onTap: () => Get.toNamed(AppRoutes.login),)
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
