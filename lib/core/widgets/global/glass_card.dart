import 'dart:ui';
import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlassCard extends StatelessWidget {
  final String txt;
  final Widget? icon;
  final double? hPadding;
  final double? vPadding;
  final bool? iconFirst;
  final TextStyle? textStyle;
  const GlassCard({
    super.key,
    required this.txt,
    this.icon,
    this.hPadding,
    this.vPadding,
    this.textStyle,
    this.iconFirst = false});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(32.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: vPadding ?? 8.h, horizontal: hPadding ?? 12.w),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryClr.withValues(alpha: 0.1),
                blurRadius: 15.r,
                offset: Offset(0, 8),
              ),
            ],
            color: AppColors.glassWhiteClr,
            borderRadius: BorderRadius.circular(32.r),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (iconFirst ?? true && icon != null)...[
                icon!,
                wSpace(7),
              ],
              Text(
                txt,
                style: textStyle ?? AppTextStyles.style14W700White,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (icon != null && iconFirst == false)...[
                wSpace(7),
                icon!,
              ]
            ],
          ),
        ),
      ),
    );
  }
}
