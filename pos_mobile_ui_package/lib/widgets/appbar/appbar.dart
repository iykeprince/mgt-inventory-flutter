import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/font_styles.dart';
import 'package:pos_mobile_ui_package/utils/text_styles.dart';
import 'package:pos_mobile_ui_package/utils/values_manager.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String leadingText;
  final double fontsize;
  final void Function()? onTap;
  final Color? color;
  final double? elevation;
  final Color? textColor;
  final Color? iconThemeColor;
  final Color? iconColor;
  final Widget? trailing;
  final bool automaticallyImplyLeading;
  final double? leadingWidth;
  final Color? statusBarColor;
  final Brightness? statusBarBrightness;
  final Brightness? statusBarIconBrightness;

  const Navbar(
      {Key? key,
      this.title = '',
      this.onTap,
      this.color,
      this.fontsize = FontSize.s20,
      this.textColor,
      this.iconThemeColor,
      this.leadingText = '',
      this.trailing,
      this.automaticallyImplyLeading = true,
      this.leadingWidth,
      this.statusBarColor,
      this.statusBarBrightness,
      this.elevation,
      this.iconColor,
      this.statusBarIconBrightness})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // if (leadingText.isNotEmpty)
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            // if (leadingText.isNotEmpty)
            Text(
              leadingText,
              style: getMediumStyle(
                color: textColor ?? ColorManager.kDarkCharcoal,
                fontSize: fontsize,
              ),
            )
          ]),
          Text(
            title!,
            style: getMediumStyle(
              color: textColor ?? ColorManager.kDarkCharcoal,
              fontSize: fontsize,
            ),
            textAlign: TextAlign.start,
          ),
          // if (trailing != null)
          Container(
            child: trailing,
          ),
          if (title != '') Container()
        ],
      ),
      elevation: elevation ?? 0,
      backgroundColor: color ?? Colors.transparent,
      iconTheme: IconThemeData(
        color: iconColor ?? ColorManager.kWhiteColor,
      ),
      automaticallyImplyLeading: automaticallyImplyLeading,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: statusBarColor ?? ColorManager.kDarkCharcoal,
        statusBarBrightness: statusBarBrightness ?? Brightness.light,
        statusBarIconBrightness: statusBarIconBrightness ?? Brightness.light,
      ),
    );
  }
}
