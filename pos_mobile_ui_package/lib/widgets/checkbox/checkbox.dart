import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/utils/values_manager.dart';

class PosCheckBox extends StatelessWidget {
  const PosCheckBox({
    Key? key,
    required this.value,
    this.onChanged,
    required this.richText,
  }) : super(key: key);

  final Function(bool?)? onChanged;
  final bool value;
  final Widget richText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
            value: false,
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: AppSize.s8),
        richText,
      ],
    );
  }
}
