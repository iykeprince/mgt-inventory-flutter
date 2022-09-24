import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/font_styles.dart';
import 'package:pos_mobile_ui_package/utils/text_styles.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double fontsize;
  final void Function()? onTap;
  final Color? color;
  final Color? textColor;
  final Color? iconThemeColor;
  final bool automaticallyImplyLeading;

  const Navbar({
    Key? key,
    required this.title,
    this.onTap,
    this.color,
    this.fontsize = FontSize.s20,
    this.textColor,
    this.iconThemeColor,
    this.automaticallyImplyLeading = true,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(40);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: getMediumStyle(
            color: textColor ?? ColorManager.kDarkCharcoal,
            fontSize: fontsize,
          )),
      centerTitle: true,
      leading: automaticallyImplyLeading
          ? GestureDetector(
              onTap: onTap,
              child: Icon(
                Icons.arrow_back_ios,
                color: iconThemeColor ?? ColorManager.kDarkCharcoal,
              ),
            )
          : null,
      elevation: 0,
      backgroundColor: color ?? Colors.transparent,
      iconTheme: const IconThemeData(
        color: ColorManager.kDarkCharcoal,
      ),
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }
}
