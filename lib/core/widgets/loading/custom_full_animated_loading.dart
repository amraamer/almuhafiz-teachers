import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_dimens.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomFullAnimatedLoading extends StatelessWidget {
  final double spaceFromTop;
  final double size;
  final Color? color;
  final double imageHeight;

  const CustomFullAnimatedLoading({
    super.key,
    this.spaceFromTop = 0.12,
    this.size = 250,
    this.color = AppColors.primaryClr,
    this.imageHeight = 0,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
        padding: EdgeInsets.only(
          left: 18.w,
          right: 18.w,
          top: imageHeight / 1.6,
          bottom: 0.h,
        ),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.backgroundClr,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppDimens.r55),
            topRight: Radius.circular(AppDimens.r55),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black04,
              blurRadius: 15.r,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: Lottie.asset(
          Assets.animations.loading.path,
          width: size.w,
          height: size.h,
          fit: BoxFit.cover,
          repeat: true,
        )
    );
  }
}
