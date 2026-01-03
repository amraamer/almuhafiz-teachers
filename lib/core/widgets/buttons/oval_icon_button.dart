import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics.dart';

class OvalIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color? bkColor;
  final String icon;
  const OvalIconButton({
    super.key,
    required this.onTap,
    this.bkColor = AppColors.primaryShadeClr,
    required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        height: 60.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: bkColor,
          borderRadius: BorderRadius.circular(AppDimens.r47),
        ),
        child: VectorGraphic(loader: AssetBytesLoader(icon), width: 30.w, height: 30.h,),
      ),
    );
  }
}
