import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_dimens.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintTxt;
  final int? maxLength;
  final void Function(String)? onChange;
  final Widget? preIcon;
  final Widget? sufIcon;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final VoidCallback? onAddImage;
  final Color? fillColor;
  final bool? enabled;

  /// 👇 الجديد
  final bool isPassword;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintTxt,
    this.maxLength,
    this.onChange,
    this.preIcon,
    this.sufIcon,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.textInputType,
    this.maxLines = 1,
    this.onAddImage,
    this.fillColor = AppColors.glassWhiteClr,
    this.enabled = true,
    this.isPassword = false, // 👈 افتراضي مش باسورد
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode _focusNode = FocusNode();

  /// 👇 الجديد
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      focusNode: _focusNode,
      controller: widget.controller,
      enabled: widget.enabled,
      style: AppTextStyles.style16W600Primary,
      onChanged: widget.onChange,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: AppDimens.h8, horizontal: AppDimens.w8),
        hintText: widget.hintTxt,
        hintStyle: AppTextStyles.style16W600Black40,
        fillColor: widget.fillColor,
        filled: true,

        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscureText
                ? Icons.visibility_off
                : Icons.visibility,
            color: AppColors.grayClr,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : widget.sufIcon != null
            ? InkWell(
          onTap: widget.onAddImage,
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: widget.sufIcon!,
          ),
        )
            : null,

        prefixIcon: widget.preIcon != null
            ? Padding(
          padding: EdgeInsets.all(20.r),
          child: widget.preIcon!,
        )
            : null,

        border: _normalBorder(),
        enabledBorder: _normalBorder(),
        focusedBorder: _focusedBorder(),
        errorBorder: _errorBorder(),
      ),
    );
  }

  OutlineInputBorder _normalBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: BorderSide.none,
    );
  }

  OutlineInputBorder _focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide:
      BorderSide(color: AppColors.glassWhiteClr, width: 1.5.h),
    );
  }

  OutlineInputBorder _errorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: BorderSide(color: AppColors.glassWhiteClr),
    );
  }
}

