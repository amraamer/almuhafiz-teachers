import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/core/widgets/buttons/primary_button.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRugPage extends StatelessWidget {
  final String icon;
  final String title;
  final String btnTitle;
  final Future<void> Function() onPressed;
  const CustomRugPage({
    super.key,
    required this.icon,
    required this.title,
    required this.btnTitle,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.pngs.rugImage.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(22.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(icon),
                    hSpace(20),
                    Text(title, style: AppTextStyles.style24W700White),
                  ],
                ),
              ),
            ),
            PrimaryButton(
              txt: btnTitle,
              bkColor: AppColors.offWhite,
              txtColor: AppColors.blackClr,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
              onPressed: onPressed,
            ),
            hSpace(30),
          ],
        )
      ),
    );
  }
}
