import 'package:almuhafiz_teachers/core/constants/app_colors.dart';
import 'package:almuhafiz_teachers/core/constants/app_text_styles.dart';
import 'package:almuhafiz_teachers/core/mini_models/drop_down_item_model.dart';
import 'package:almuhafiz_teachers/core/utils/spacer.dart';
import 'package:almuhafiz_teachers/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_graphics/vector_graphics.dart';

class SimpleExpandableDropdown extends StatefulWidget {
  final String hint;
  final String label;
  final DropDownItemModel? initValue;
  final List<DropDownItemModel> items;
  final ValueChanged<DropDownItemModel> onChanged;
  final bool hasLabel;
  final Widget? leadingIcon;
  final double maxListHeight;
  final Color? bkgColor;

  const SimpleExpandableDropdown({
    super.key,
    required this.hint,
    required this.label,
    required this.items,
    required this.onChanged,
    this.initValue,
    this.hasLabel = true,
    this.leadingIcon,
    this.maxListHeight = 200,
    this.bkgColor
  });

  @override
  State<SimpleExpandableDropdown> createState() =>
      _SimpleExpandableDropdownState();
}

class _SimpleExpandableDropdownState
    extends State<SimpleExpandableDropdown>
    with TickerProviderStateMixin {
  bool _expanded = false;
  DropDownItemModel? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initValue;
  }

  void _toggle() => setState(() => _expanded = !_expanded);

  void _select(DropDownItemModel item) {
    setState(() {
      _selected = item;
      _expanded = false;
    });
    widget.onChanged(item);
  }

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.hasLabel) ...[
          Text(widget.label, style: AppTextStyles.style16W600Black),
            hSpace(8),
        ],

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
                if (widget.leadingIcon != null) ...[
                  widget.leadingIcon!,
                  wSpace(8),
                ],
                Expanded(
                  child: Align(
                    alignment:
                    isRtl ? Alignment.centerRight : Alignment.centerLeft,
                    child: Text(
                      _selected?.title ?? widget.hint,
                      style: _selected == null
                          ? AppTextStyles.style16W600Black40
                          : AppTextStyles.style16W600Primary,
                    ),
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
          curve: Curves.easeInOut,
          child: !_expanded
              ? const SizedBox.shrink()
              : Container(
            margin: EdgeInsets.only(top: 8.h),
            constraints: BoxConstraints(
              maxHeight: widget.maxListHeight,
            ),
            decoration: BoxDecoration(
              color: widget.bkgColor ?? AppColors.black04,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                return InkWell(
                  onTap: () => _select(item),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.w, vertical: 12.h),
                    child: Align(
                      alignment: isRtl
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Text(
                        item.title,
                        style: AppTextStyles.style16W600Gray,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}


