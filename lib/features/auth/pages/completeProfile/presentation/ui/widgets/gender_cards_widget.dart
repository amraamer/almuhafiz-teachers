import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/features/auth/pages/completeProfile/presentation/controllers/complete_profile_controller.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vector_graphics/vector_graphics.dart';

class GenderCardsWidget extends GetView<CompleteProfileController> {
  const GenderCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.instance.yourGender,
          style: AppTextStyles.style16W600Black,
        ),
        hSpace(10),
        Obx(() => Row(
          children: [
            Flexible(
              child: _genderCardItem(
                isMale: true,
                isSelected: controller.selectedGender.value == 0,
                onTap: () => controller.selectedGender.value = 0,
              ),
            ),
            wSpace(12),
            Flexible(
              child: _genderCardItem(
                isMale: false,
                isSelected: controller.selectedGender.value == 1,
                onTap: () => controller.selectedGender.value = 1,
              ),
            ),
          ],
        )),
      ],
    );
  }

  Widget _genderCardItem({
    required bool isMale,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.whiteBlurClr : AppColors.glassWhiteClr,
          border: Border.all(
              color: isSelected ? AppColors.whiteBlurClr : Colors.transparent),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isMale
                ? VectorGraphic(
              loader: AssetBytesLoader(Assets.svgs.man),
              width: 20.w,
              height: 20.h,
            )
                : VectorGraphic(
              loader: AssetBytesLoader(Assets.svgs.woman),
              width: 20.w,
              height: 20.h,
            ),
            wSpace(4),
            Text(
              isMale ? AppStrings.instance.male : AppStrings.instance.female,
              style: AppTextStyles.style16W600Black,
            ),
          ],
        ),
      ),
    );
  }
}
