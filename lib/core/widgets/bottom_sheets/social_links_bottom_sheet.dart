import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_dimens.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/core/widgets/buttons/primary_button.dart';
import 'package:almuhafiz_teachers/core/widgets/inputs/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SocialLinksBottomSheet extends StatelessWidget {
  final String label;
  final String hint;
  final RxList<String> initialValues;
  final ValueChanged<List<String>> onChanged;

  const SocialLinksBottomSheet({
    super.key,
    required this.label,
    required this.hint,
    required this.initialValues,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.style16W600Black),
        hSpace(8),
        GestureDetector(
          onTap: () async {
            final result = await showModalBottomSheet<List<String>>(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              builder: (_) {
                return _SocialLinksBottomSheetContent(
                  initialValues: List.from(initialValues),
                  hint: hint,
                  label: label,
                );
              },
            );

            if (result != null) {
              onChanged(result);
            }
          },
          child: Obx(() {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.w16, vertical: AppDimens.h16),
              decoration: BoxDecoration(
                color: AppColors.glassWhiteClr,
                borderRadius: BorderRadius.circular(AppDimens.r20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      initialValues.isEmpty
                          ? hint
                          : initialValues.join(' , '),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: initialValues.isEmpty
                          ? AppTextStyles.style16W600Black40
                          : AppTextStyles.style16W600Primary,
                    ),
                  ),
                  Icon(Icons.add, size: 22.sp,),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _SocialLinksBottomSheetContent extends StatefulWidget {
  final List<String> initialValues;
  final String hint;
  final String label;

  const _SocialLinksBottomSheetContent({
    required this.initialValues,
    required this.hint,
    required this.label
  });

  @override
  State<_SocialLinksBottomSheetContent> createState() =>
      _SocialLinksBottomSheetContentState();
}

class _SocialLinksBottomSheetContentState
    extends State<_SocialLinksBottomSheetContent> {
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    controllers = widget.initialValues
        .map((e) => TextEditingController(text: e))
        .toList();

    if (controllers.isEmpty) {
      controllers.add(TextEditingController());
    }
  }

  void _addField() {
    setState(() {
      controllers.add(TextEditingController());
    });
  }

  void _removeField(int index) {
    setState(() {
      controllers[index].dispose();
      controllers.removeAt(index);
    });
  }

  List<String> _collectValues() {
    return controllers
        .map((c) => c.text.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.7;

    return Container(
      height: height,
      padding: EdgeInsets.all(AppDimens.r20),
      decoration: BoxDecoration(
        color: AppColors.backgroundBlur,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppDimens.r24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: AppTextStyles.style16W700Primary,
          ),
          hSpace(16),

          Expanded(
            child: ListView.builder(
              itemCount: controllers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: controllers[index],
                          hintTxt: widget.hint,
                          fillColor: AppColors.black04,
                          textInputType: TextInputType.url,
                        ),
                      ),
                      wSpace(8),
                      if (controllers.length > 1)
                        IconButton(
                          icon: Icon(Icons.close_outlined, color: AppColors.redFlame),
                          onPressed: () => _removeField(index),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),

          hSpace(8),
          TextButton.icon(
            onPressed: _addField,
            icon: Icon(Icons.add, color: AppColors.primaryClr),
            label: Text(AppStrings.instance.addMore, style: AppTextStyles.style16W600Primary,),
          ),

          hSpace(12),
          PrimaryButton(
            txt: AppStrings.instance.done,
            height: 47.h,
            btnRadius: AppDimens.r24,
            onPressed: () async{
              Navigator.pop(context, _collectValues());
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    super.dispose();
  }
}

