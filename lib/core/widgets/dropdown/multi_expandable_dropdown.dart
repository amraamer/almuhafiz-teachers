import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_dimens.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/mini_models/drop_down_item_model.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics.dart';

class MultiExpandableDropdown extends StatefulWidget {
  final String hint;
  final String label;
  final List<DropDownItemModel> items;
  final List<DropDownItemModel>? initValues;
  final ValueChanged<List<DropDownItemModel>> onChanged;
  final double maxListHeight;
  final Color? bkgColor;

  const MultiExpandableDropdown({
    super.key,
    required this.hint,
    required this.label,
    required this.items,
    required this.onChanged,
    this.initValues,
    this.maxListHeight = 220,
    this.bkgColor,
  });

  @override
  State<MultiExpandableDropdown> createState() =>
      _MultiExpandableDropdownState();
}

class _MultiExpandableDropdownState extends State<MultiExpandableDropdown> {
  bool _expanded = false;
  late List<DropDownItemModel> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = widget.initValues ?? [];
  }

  void _toggle() => setState(() => _expanded = !_expanded);

  void _toggleItem(DropDownItemModel item) {
    setState(() {
      if (_selectedItems.contains(item)) {
        _selectedItems.remove(item);
      } else {
        _selectedItems.add(item);
      }
    });
    widget.onChanged(_selectedItems);
  }

  void _selectAll() {
    setState(() {
      if (_selectedItems.length == widget.items.length) {
        _selectedItems.clear();
      } else {
        _selectedItems = List.from(widget.items);
      }
    });
    widget.onChanged(_selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    // final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: AppTextStyles.style16W600Black),
        hSpace(8),

        GestureDetector(
          onTap: _toggle,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: widget.bkgColor ?? AppColors.black04,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedItems.isEmpty
                        ? widget.hint
                        : _selectedItems.map((e) => e.title).join('، '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: _selectedItems.isEmpty
                        ? AppTextStyles.style16W600Black40
                        : AppTextStyles.style16W600Primary,
                  ),
                ),
                VectorGraphic(
                  loader: AssetBytesLoader(
                    _expanded
                        ? Assets.svgs.roundArrowUp
                        : Assets.svgs.roundArrowDown,
                  ),
                ),
              ],
            ),
          ),
        ),

        AnimatedSize(
          duration: const Duration(milliseconds: 250),
          child: !_expanded
              ? const SizedBox.shrink()
              : Container(
            margin: EdgeInsets.only(top: 4.h),
            constraints: BoxConstraints(maxHeight: widget.maxListHeight),
            decoration: BoxDecoration(
              color: widget.bkgColor ?? AppColors.black04,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: ListView(
              children: [
                /// 🔘 Select All
                InkWell(
                  onTap: _selectAll,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppDimens.w12, vertical: AppDimens.h8),
                    child: Row(
                      children: [
                        Icon(
                          _selectedItems.length == widget.items.length
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: AppColors.primaryClr,
                          size: 20.sp,
                        ),
                        wSpace(8),
                        Text(AppStrings.instance.selectAll,
                            style: AppTextStyles.style16W600Gray),
                      ],
                    ),
                  ),
                ),
                const Divider(),

                ...widget.items.map((item) {
                  final isSelected = _selectedItems.contains(item);
                  return InkWell(
                    onTap: () => _toggleItem(item),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      child: Row(
                        children: [
                          Icon(
                            isSelected
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            size: 20.sp,
                            color: AppColors.primaryClr,
                          ),
                          wSpace(8),
                          Expanded(
                            child: Text(
                              item.title,
                              style: AppTextStyles.style16W600Gray,
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
        ),
      ],
    );
  }
}
