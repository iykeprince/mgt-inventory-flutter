import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/font_styles.dart';
import 'package:pos_mobile_ui_package/utils/text_styles.dart';
import 'package:pos_mobile_ui_package/utils/values_manager.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final bool? showBottomBorder;
  final EdgeInsetsGeometry? margin;
  final Function()? onTap;
  final bool enabled;
  final Color? textColor;

  ProfileItem({
    required this.title,
    this.onTap,
    this.margin,
    this.showBottomBorder = true,
    this.enabled = true,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p24,
      ),
      child: Container(
        margin: margin ?? const EdgeInsets.only(top: AppMargin.m12),
        decoration: showBottomBorder!
            ? const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromRGBO(20, 92, 83, 0.3), width: 1)))
            : null,
        child: ListTile(
          onTap: onTap,
          enabled: enabled,
          title: Text(
            title,
            style: getMediumStyle(
                color: textColor ?? ColorManager.kDarkCharcoal,
                fontSize: FontSize.s16),
          ),
          contentPadding: EdgeInsets.zero,
          trailing: const Icon(
            Icons.chevron_right,
            size: AppSize.s28,
            color: ColorManager.kGreyOpacity,
          ),
        ),
      ),
    );
  }
}
