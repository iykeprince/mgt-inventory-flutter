import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
// : super(key: key) this.buttonBgColor??= ColorManager.kPrimaryColor, this.buttonTextColor ??= ColorManager.kWhiteColor this.leadingIconColor ??= ColorManager.kPrimaryColor  this.trailingIconColor??=ColorManager.kPrimaryColor ;

enum ButtonType { fill, outline, text }

class PosButton extends StatelessWidget {
  final double borderRadius;
  final double fontSize;
  final String title;
  final bool? busy;
  final Border? border;
  // final bool fullwidth;
  Function() onPressed;
  final Color buttonBgColor;
  final Color? buttonTextColor;
  final Color? leadingIconColor;
  final Color? trailingIconColor;
  final FontWeight fontWeight;
  final ButtonType? buttonType;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final double trailingIconSpace;
  PosButton({
    Key? key,
    this.borderRadius = 8.0,
    this.border,
    this.fontSize = 16.0,
    this.trailingIconSpace = 4.0,
    this.fontWeight = FontWeight.w500,
    required this.onPressed,
    this.buttonBgColor = ColorManager.kPrimaryColor,
    this.buttonTextColor = ColorManager.kWhiteColor,
    required this.title,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingIconColor = ColorManager.kPrimaryColor,
    this.trailingIconColor = ColorManager.kPrimaryColor,
    this.busy = false,
    this.buttonType = ButtonType.fill,
  });

  Color getBackgroundColor() {
    if (buttonType == ButtonType.outline) {
      return buttonTextColor != null
          ? buttonTextColor!
          : ColorManager.kWhiteColor;
    } else if (buttonType == ButtonType.fill) {
      return buttonBgColor;
    } else {
      return Colors.transparent;
    }
  }

  Color getColor() {
    if (buttonType == ButtonType.fill) {
      return buttonTextColor != null
          ? buttonTextColor!
          : ColorManager.kWhiteColor;
    } else if (buttonType == ButtonType.outline) {
      return buttonBgColor;
    } else {
      return buttonTextColor != null ? buttonTextColor! : buttonBgColor;
    }
  }

  Border constructBorder() {
    if (border != null) {
      return border!;
    }
    if (buttonType == ButtonType.outline) {
      return Border.all(
        color: getColor(),
        width: 1,
      );
    } else {
      return Border.all(
        color: Colors.transparent,
        width: 0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _color = getColor();
    final _bgColor = getBackgroundColor();
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 23.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: _bgColor,
          border: constructBorder(),
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
                  color: _color, fontSize: fontSize, fontWeight: fontWeight),
            ),
            if (trailingIcon != null) SizedBox(width: trailingIconSpace),
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
