import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics.dart';

class SocialCardsWidget extends StatelessWidget {
  final String icon;
  final Function() onTap;

  const SocialCardsWidget({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.glassWhiteClr,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: VectorGraphic(loader: AssetBytesLoader(icon),),
      ),
    );
  }
}
