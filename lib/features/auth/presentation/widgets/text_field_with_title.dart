import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/core/widgets/inputs/custom_text_field.dart';
import 'package:flutter/material.dart';

class TextFieldWithTitle extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String hintTxt;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Color? fillColor;
  final int? maxLines;
  final bool isPassword;

  const TextFieldWithTitle({
    super.key,
    required this.title,
    required this.controller,
    required this.textInputType,
    required this.hintTxt,
    this.validator,
    this.onChanged,
    this.fillColor,
    this.maxLines,
    this.isPassword = false
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.style16W600Black,),
        hSpace(10),
        CustomTextFormField(
          controller: controller,
          textInputType: textInputType,
          hintTxt: hintTxt,
          validator: validator,
          onChange: onChanged,
          fillColor: fillColor,
          maxLines: maxLines,
          isPassword: isPassword,
        ),
      ],
    );
  }
}
