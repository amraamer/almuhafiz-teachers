import 'dart:ui';
import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/navigation/app_routes.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/core/widgets/buttons/primary_button.dart';
import 'package:almuhafiz_teachers/core/widgets/dropdown/custom_drop_down_widget.dart';
import 'package:almuhafiz_teachers/features/auth/presentation/controllers/auth_controller.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LearningAndRiwayahBody extends GetView<AuthController> {
  const LearningAndRiwayahBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

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
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            hSpace(20),
                            Text(
                              AppStrings.instance.selectRecitationAndPath,
                              style: AppTextStyles.style32W600BlackDeco,
                            ),

                            hSpace(30),

                            SimpleExpandableDropdown(
                              hint: AppStrings.instance.recitation,
                              label: AppStrings.instance.recitation,
                              initValue: null,
                              items: controller.ageList,
                              onChanged: (value) {
                                controller.age.value = value.value;
                              },
                            ),

                            hSpace(30),
                            SimpleExpandableDropdown(
                              hint: AppStrings.instance.path,
                              label: AppStrings.instance.path,
                              initValue: null,
                              items: controller.ageList,
                              onChanged: (value) {
                                controller.age.value = value.value;
                              },
                            ),

                            hSpace(30),
                          ],
                        ),
                      ),
                    ),

                    PrimaryButton(
                      txt: AppStrings.instance.continueTxt,
                      bkColor: AppColors.offWhite,
                      txtColor: AppColors.blackClr,
                      fontSize: 20.sp,
                      height: 50.h,
                      fontWeight: FontWeight.w800,
                      onPressed: () async {
                        Get.toNamed(AppRoutes.bottomNav);
                      },
                    ),

                    hSpace(20),
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
