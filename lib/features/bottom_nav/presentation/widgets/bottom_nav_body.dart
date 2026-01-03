import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_dimens.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/features/bottom_nav/presentation/controllers/bottom_nav_controller.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vector_graphics/vector_graphics.dart';

class BottomNavBody extends GetView<BottomNavController> {
  const BottomNavBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final currentIndex = controller.currentIndex.value;

      return Scaffold(
        extendBody: true,
        body: controller.pages[currentIndex],
        bottomNavigationBar: Container(
          height: 109.h,
          decoration: BoxDecoration(
            color: AppColors.whiteClr,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppDimens.r55),
              topRight: Radius.circular(AppDimens.r55),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(controller.pages.length, (index) {
              final iconData = [
                Assets.svgs.homeNav,
                // Assets.svgs.bookNav,
                // Assets.svgs.crownLine,
                // Assets.svgs.videoCircleNav,
                Assets.svgs.userNav,
              ];

              final labels = [
                AppStrings.instance.home,
                // AppStrings.instance.teachers,
                // AppStrings.instance.subscription,
                // AppStrings.instance.sessions,
                AppStrings.instance.profile,
              ];

              final isSelected = currentIndex == index;

              return GestureDetector(
                onTap: () => controller.changeIndex(index),
                behavior: HitTestBehavior.opaque,
                child: Container(
                  height: 65.h,
                  width: 65.w,
                  // padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? AppColors.secondaryClr
                        : Colors.transparent,
                    boxShadow: isSelected
                        ? [
                      BoxShadow(
                        color: AppColors.secondaryClr,
                        blurRadius: AppDimens.r10,
                        spreadRadius: 2.r,
                      ),
                    ] : null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      VectorGraphic(
                        loader: AssetBytesLoader(iconData[index]),
                        colorFilter: ColorFilter.mode(
                          isSelected
                              ? AppColors.whiteClr
                              : AppColors.grayClr,
                          BlendMode.srcIn,
                        ),
                        width: 22.w,
                        height: 22.h,
                      ),
                      hSpace(4),
                      Text(
                        labels[index],
                        style: AppTextStyles.style10W700.copyWith(
                          color: isSelected
                              ? AppColors.whiteClr
                              : AppColors.grayClr,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      );
    }
    );
  }
}