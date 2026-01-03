import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics.dart';

class CircleIcon extends StatelessWidget {
  final String icon;
  final void Function()? onTap;
  final double? radius;
  final double? iconSize;
  final Color? bkgClr;
  final Color iconClr;

  const CircleIcon({
    super.key,
    required this.icon,
    this.onTap,
    this.radius,
    this.iconSize,
    this.bkgClr = AppColors.black04,
    this.iconClr = AppColors.blackClr,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius ?? 20.r,
        backgroundColor: bkgClr,
        child: Padding(
          padding: EdgeInsets.all(4.r),
          child: VectorGraphic(
            loader: AssetBytesLoader(icon),
            width: iconSize ?? 24.w,
            height: iconSize ?? 24.h,
            colorFilter: ColorFilter.mode(iconClr, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
