import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';

class Tabs {
  late BottomNavigationBarItem tab;
  final Widget screen;
  // final TabName name;

  Tabs({
    required String svgAsset,
    required this.screen,
  }) {
    tab = BottomNavigationBarItem(
      icon: SvgPicture.asset(
        svgAsset,
        color: ColorManager.kNavNonActiveColor,
      ),
      label: '',
      activeIcon: SvgPicture.asset(svgAsset, color: ColorManager.kWhiteColor),
    );
  }
}
