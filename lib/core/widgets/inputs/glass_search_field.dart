import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_dimens.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics.dart';

class GlassSearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const GlassSearchField({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: AppDimens.w16),
      decoration: BoxDecoration(
        color: AppColors.whiteBlurClr,
        borderRadius: BorderRadius.circular(AppDimens.r55),
        boxShadow: [
          BoxShadow(
            color: AppColors.black04,
            blurRadius: AppDimens.r10,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                fillColor: AppColors.whiteBlurClr,
                hintStyle: AppTextStyles.style16W700Black40,
                border: InputBorder.none,
              ),
              style: AppTextStyles.style16W700Black40,
            ),
          ),

          VectorGraphic(
            loader: AssetBytesLoader( Assets.svgs.search),
            height: 26.h,
            width: 26.w,
            colorFilter: ColorFilter.mode(AppColors.blackOverlay40, BlendMode.srcIn),)
        ],
      ),
    );
  }
}
