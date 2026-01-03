import 'dart:ui';
import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_dimens.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics.dart';

class RatingCard extends StatelessWidget {
  final double rating;
  final Color? txtClr;
  const RatingCard({super.key, required this.rating, this.txtClr});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimens.r8),
      clipBehavior: Clip.antiAlias,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          height: 28.h,
          width: 49.w,
          padding: EdgeInsets.symmetric(
            vertical: 6.h,
            horizontal: 2.w,
          ),
          decoration: BoxDecoration(
            color: AppColors.black04,
            borderRadius: BorderRadius.circular(AppDimens.r8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$rating",
                style: AppTextStyles.style12W700.copyWith(color: txtClr ?? AppColors.whiteBlurClr),
              ),
              wSpace(6),
              VectorGraphic(
                loader: AssetBytesLoader(Assets.svgs.star),
                height: 14.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
