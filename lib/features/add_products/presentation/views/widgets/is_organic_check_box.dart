import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_hub_dashboard/core/utils/app_font_styles.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_checkbox.dart';

class IsOrganciCheckBox extends StatefulWidget {
  const IsOrganciCheckBox({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<IsOrganciCheckBox> createState() => _IsOrganciCheckBoxState();
}

class _IsOrganciCheckBoxState extends State<IsOrganciCheckBox> {
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'is Product Organic?',
                style: TextStyles.semiBold13.copyWith(
                  color: const Color(0xFF949D9E),
                ),
              ),
            ],
          ),
          textAlign: TextAlign.right,
        ),
        const Expanded(child: SizedBox(width: 16)),
        CustomCheckBox(
          onChanged: (value) {
            isOrganic = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isOrganic,
        ),
      ],
    );
  }
}
