import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/font_styles.dart';
import 'package:pos_mobile_ui_package/utils/text_styles.dart';
import 'package:pos_mobile_ui_package/utils/values_manager.dart';

class TabHeader extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const TabHeader({Key? key, required this.title, this.margin, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      color: ColorManager.kWhiteColor,
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: ScreenHorizontalSize,
            vertical: AppPadding.p8 + 1,
          ),
      child: Text(
        title,
        style: getBoldStyle(
          color: ColorManager.kDarkColor,
          fontSize: FontSize.s20,
        ),
      ),
    );
  }
}
