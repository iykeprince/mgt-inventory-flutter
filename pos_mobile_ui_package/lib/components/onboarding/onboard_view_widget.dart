import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/font_styles.dart';
import 'package:pos_mobile_ui_package/utils/string_manager.dart';

class OnboardingViewWidget extends StatelessWidget {
  OnboardingViewWidget({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  String imgUrl;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        SizedBox(
          height: 380,
          child: Image.asset(
            imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: AppSize.s40),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: getBoldStyle(
                    color: ColorManager.kPrimaryColor, fontSize: FontSize.s24),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: getSemiBoldStyle(
                    color: ColorManager.kGrey1, fontSize: FontSize.s16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    );
  }
}
