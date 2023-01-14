import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';

class BottomSheetContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? color;
  final BorderRadius? borderRadius;
  const BottomSheetContainer({
    Key? key,
    required this.child,
    this.color,
    this.margin,
    this.padding,
    this.borderRadius,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding ?? EdgeInsets.all(AppPadding.p24),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(15),
      ),
      height: height,
      child: child,
    );
  }
}
