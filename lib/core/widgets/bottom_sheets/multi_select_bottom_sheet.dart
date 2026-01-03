import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_dimens.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/core/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MultiSelectBottomSheet<T> extends StatelessWidget {
  final String hint;
  final String label;
  final List<T> items;
  final RxList<T> selectedItems;
  final String Function(T item) itemLabel;
  final ValueChanged<List<T>> onSelectionChanged;

  const MultiSelectBottomSheet({
    super.key,
    required this.hint,
    required this.label,
    required this.items,
    required this.selectedItems,
    required this.itemLabel,
    required this.onSelectionChanged,
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
            final result = await showModalBottomSheet<List<T>>(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              builder: (_) => _BottomSheetContent<T>(
                items: items,
                initialSelected: List<T>.from(selectedItems),
                itemLabel: itemLabel,
              ),
            );

            if (result != null) {
              onSelectionChanged(result);
            }
          },
          child: Obx(() {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: AppColors.glassWhiteClr,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedItems.isEmpty
                          ? hint
                          : selectedItems.map(itemLabel).join('، '),
                      style: selectedItems.isEmpty
                          ? AppTextStyles.style16W600Black40
                          : AppTextStyles.style16W600Primary,
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _BottomSheetContent<T> extends StatefulWidget {
  final List<T> items;
  final List<T> initialSelected;
  final String Function(T item) itemLabel;

  const _BottomSheetContent({
    required this.items,
    required this.initialSelected,
    required this.itemLabel,
  });

  @override
  State<_BottomSheetContent<T>> createState() => _BottomSheetContentState<T>();
}

class _BottomSheetContentState<T> extends State<_BottomSheetContent<T>> {
  late List<T> _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialSelected;
  }

  void _toggle(T item) {
    setState(() {
      _selected.contains(item)
          ? _selected.remove(item)
          : _selected.add(item);
    });
  }

  void _selectAll() {
    setState(() {
      _selected.length == widget.items.length
          ? _selected.clear()
          : _selected = List.from(widget.items);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.6;

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
            AppStrings.instance.selectAll,
            style: AppTextStyles.style16W700Primary,
          ),
          hSpace(12),
          Expanded(
            child: ListView(
              children: [
                InkWell(
                  onTap: _selectAll,
                  child: Row(
                    children: [
                      Icon(
                        _selected.length == widget.items.length
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: AppColors.primaryClr,
                      ),
                      wSpace(8),
                      Text(AppStrings.instance.selectAll),
                    ],
                  ),
                ),
                const Divider(),
                ...widget.items.map((item) {
                  final isSelected = _selected.contains(item);
                  return InkWell(
                    onTap: () => _toggle(item),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Row(
                        children: [
                          Icon(
                            isSelected
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: AppColors.primaryClr,
                          ),
                          wSpace(8),
                          Expanded(
                            child: Text(
                              widget.itemLabel(item),
                              style: AppTextStyles.style16W500Black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          PrimaryButton(
            txt: AppStrings.instance.done,
            onPressed: () async => Navigator.pop(context, _selected),
          ),
        ],
      ),
    );
  }
}

