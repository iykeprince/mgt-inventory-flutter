import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';

class PosButton extends StatelessWidget {
  PosButton({
    Key? key,
    this.borderRadius = 8.0,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w500,
    required this.onPressed,
    this.buttonBgColor = kPrimaryColor,
    this.buttonTextColor = kWhiteColor,
    required this.title,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingIconColor = kPrimaryColor,
    this.trailingIconColor = kPrimaryColor,
    this.busy = false,
  }) : super(key: key);

  final double borderRadius;
  final double fontSize;

  final String title;
  final bool? busy;
  // final bool fullwidth;
  Function() onPressed;

  final Color buttonBgColor;
  final Color buttonTextColor;
  final Color? leadingIconColor;
  final Color? trailingIconColor;
  final FontWeight fontWeight;

  final IconData? leadingIcon;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 23.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: buttonBgColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leadingIcon != null)
              Icon(
                leadingIcon,
                color: leadingIconColor,
              ),
            Text(
              title,
              style: TextStyle(
                  color: buttonTextColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight),
            ),
            if (trailingIcon != null)
              Icon(
                trailingIcon,
                color: trailingIconColor,
              ),
          ],
        ),
      ),
    );
  }
}
