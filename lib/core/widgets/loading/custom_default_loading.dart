import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomDefaultLoading extends StatelessWidget {
  final double spaceFromTop;
  final double size;
  final Color color;

  const CustomDefaultLoading({
    super.key,
    this.spaceFromTop = 0.12,
    this.size = 80,
    this.color = AppColors.primaryClr,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child:SpinKitCubeGrid(
      size: size.sp,
      color: color,
    ),
    );
  }
}
