import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:flutter/material.dart';

class ClickableTextRow extends StatelessWidget {
  final String text;
  final String clickTxt;
  final void Function() onTap;
  const ClickableTextRow({super.key, required this.text,required this.clickTxt, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,
          style: AppTextStyles.style16W600Black,),
        wSpace(6),
        GestureDetector(
            onTap: onTap,
            child: Text(clickTxt,
              style: AppTextStyles.style16W800Primary,)),
        hSpace(30)
      ],
    );
  }
}
