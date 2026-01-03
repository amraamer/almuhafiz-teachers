import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomAnimatedLoading extends StatelessWidget {
  final double spaceFromTop;
  final double size;
  final Color? color;

  const CustomAnimatedLoading({
    super.key,
    this.spaceFromTop = 0.12,
    this.size = 150,
    this.color = AppColors.primaryClr,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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