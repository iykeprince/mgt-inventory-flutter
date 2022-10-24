import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';

class BottomSheetContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  final Color? color;
  final BorderRadius? borderRadius;
  const BottomSheetContainer({
    Key? key,
    required this.child,
    this.color,
    this.margin,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.all(AppPadding.p24),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
