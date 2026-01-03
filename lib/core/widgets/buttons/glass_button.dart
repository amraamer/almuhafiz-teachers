import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_dimens.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/core/widgets/loading/custom_default_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics.dart';

class GlassButton extends StatefulWidget {
  final String txt;
  final Future<void> Function()? onPressed;
  final double? width;
  final double? height;
  final String? icon;
  final double? iconHeight;
  final double? iconWidth;
  final double? fontSize;
  final double? btnRadius;
  final Color? bkColor;
  final FontWeight? fontWeight;

  const GlassButton({
    super.key,
    required this.txt,
    required this.onPressed,
    this.height,
    this.width,
    this.icon,
    this.iconHeight,
    this.iconWidth,
    this.fontSize,
    this.btnRadius,
    this.bkColor = AppColors.black04,
    this.fontWeight,
  });

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton> {
  bool isLoading = false;

  Future<void> _handlePress() async {
    if (isLoading || widget.onPressed == null) return;

    setState(() => isLoading = true);

    try {
      await widget.onPressed!();
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : _handlePress,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: widget.height ?? 56.h,
        width: widget.width ?? double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        decoration: BoxDecoration(
          color: widget.bkColor,
          borderRadius: BorderRadius.circular(widget.btnRadius ?? AppDimens.r16),
          border: Border.all(
            color: AppColors.black04,
            width: 1.2.w,
          ),
        ),
        child: Center(
          child: isLoading
              ? CustomDefaultLoading(
            size: 25.sp,
            color: AppColors.primaryClr,
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null)
                VectorGraphic(
                  loader: AssetBytesLoader(widget.icon!,),
                  height: widget.iconHeight ?? 14.h,
                  width: widget.iconWidth ?? 14.w,
                  colorFilter: const ColorFilter.mode(
                    AppColors.black60,
                    BlendMode.srcIn,
                  ),
                ),
              if (widget.icon != null) wSpace(6),
              Text(
                widget.txt,
                style: AppTextStyles.style16W700Black40.copyWith(
                  fontSize: widget.fontSize,
                  fontWeight: widget.fontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}