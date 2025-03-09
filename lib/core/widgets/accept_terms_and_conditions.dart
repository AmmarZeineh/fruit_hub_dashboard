import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/utils/app_font_styles.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_checkbox.dart';

class IsFeaturedItem extends StatefulWidget {
  const IsFeaturedItem({super.key, required this.onChanged});

  @override
  State<IsFeaturedItem> createState() => _IsFeaturedItemState();

  final ValueChanged<bool> onChanged;
}

class _IsFeaturedItemState extends State<IsFeaturedItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isChecked,
          onChanged: (value) {
            isChecked = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: ' ',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xff949D9E),
                  ),
                ),
                TextSpan(
                  text: 'is featured?',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
