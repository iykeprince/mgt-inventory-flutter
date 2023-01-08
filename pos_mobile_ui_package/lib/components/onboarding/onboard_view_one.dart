import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/font_styles.dart';
import 'package:pos_mobile_ui_package/utils/string_manager.dart';

class OnboardingViewOne extends StatelessWidget {
  OnboardingViewOne({
    Key? key,
    required this.imgUrl,
    required this.onSkipPressed,
    required this.onNextPressed,
  }) : super(key: key);

  String imgUrl;
  Function() onSkipPressed;
  Function() onNextPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(
        vertical: AppSize.s40,
        horizontal: AppPadding.p8,
      ),
      decoration: const BoxDecoration(color: ColorManager.kWhiteColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: onSkipPressed,
                child: Text(
                  AppString.skip,
                  style: getBoldStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s16),
                ),
              )
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Image.asset(
              imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppString.record,
                  style: getBoldStyle(
                      color: ColorManager.kPrimaryColor,
                      fontSize: FontSize.s24),
                ),
                const SizedBox(height: 10),
                Text(
                  AppString.onBoardSub1,
                  style: getMediumStyle(
                      color: ColorManager.kGrey1, fontSize: FontSize.s16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                ProgressCircularButton(
                  progressValue: .3,
                  onPressed: onNextPressed,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
