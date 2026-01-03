import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  final String hintText;
  final Function(T?) onChanged;
  final List<DropdownMenuItem<T>> items;
  final String? icon;
  final bool isIcon;
  final T? value;

  const CustomDropdownButton({
    super.key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.icon,
    required this.isIcon,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          // color: AppColors.getBackgroundColor(context),
          border: Border.all(
            // color: AppColors.getCardBorderColor(context),
            width: 1.w,
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            value: value,
            hint: Row(
              spacing: 10.w,
              children: [
                if (isIcon)
                  VectorGraphic(
                    loader: AssetBytesLoader(icon ?? ""),
                    width: 18.w,
                    height: 18.h,
                    // colorFilter: ColorFilter.mode(AppColors.dimGray, BlendMode.srcIn),
                  ),
                // Text(hintText, style: AppTextStyles.style14DimGrayW600),
              ],
            ),
            icon: Icon(Icons.filter_list, size: 20.sp),
            borderRadius: BorderRadius.circular(12.r),
            // dropdownColor: AppColors.getBackgroundColor(context),
            // style: AppTextStyles.style14DimGrayW600,
            items: items,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}

