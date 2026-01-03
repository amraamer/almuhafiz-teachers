import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_dimens.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/core/widgets/loading/custom_default_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics.dart';

class PrimaryButton extends StatefulWidget {
  final String txt;
  final Future<void> Function()? onPressed;
  final double? width;
  final double? height;
  final Color? bkColor;
  final Color? txtColor;
  final String? icon;
  final double? iconHeight;
  final double? iconWidth;
  final Color? borderColor;
  final Color? loadingColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? btnRadius;
  final bool? isEnable;

  const PrimaryButton({
    super.key,
    required this.txt,
    required this.onPressed,
    this.height,
    this.width,
    this.bkColor = AppColors.primaryIconClr,
    this.txtColor,
    this.icon,
    this.iconHeight,
    this.iconWidth,
    this.borderColor,
    this.loadingColor,
    this.fontSize,
    this.fontWeight,
    this.btnRadius,
    this.isEnable = true,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool isLoading = false;

  Future<void> _handleClick() async {
    if (isLoading || widget.onPressed == null) return;

    setState(() {
      isLoading = true;
    });

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
    final bool isDisabled = widget.isEnable == false;

    final Color backgroundColor = isDisabled
        ? AppColors.primaryIconClr
        : (isLoading ? AppColors.secondaryClr : widget.bkColor!);

    final Color contentColor = isDisabled
        ? AppColors.whiteClr
        : (widget.txtColor ?? AppColors.whiteClr);

    return GestureDetector(
      onTap: (isDisabled || isLoading || widget.onPressed == null)
          ? null
          : _handleClick,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: widget.height ?? 56.h,
        width: widget.width ?? double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: isDisabled
                ? AppColors.primaryIconClr
                : (widget.borderColor ?? Colors.transparent),
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(
            widget.btnRadius ?? AppDimens.r16,
          ),
        ),
        child: Center(
          child: isLoading && !isDisabled
              ? CustomDefaultLoading(
            size: 25.sp,
            color: widget.loadingColor ?? AppColors.backgroundClr,
          )
              : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null)
                VectorGraphic(
                  loader: AssetBytesLoader(widget.icon!),
                  height: widget.iconHeight ?? 12.h,
                  width: widget.iconWidth ?? 16.w,
                  colorFilter: ColorFilter.mode(
                    contentColor,
                    BlendMode.srcIn,
                  ),
                ),
              if (widget.icon != null) wSpace(5),
              Text(
                widget.txt,
                style: AppTextStyles.style14W600.copyWith(
                  color: contentColor,
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
