import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:pos_mobile_ui_package/utils/font_styles.dart';
import 'package:pos_mobile_ui_package/utils/string_manager.dart';

class OnboardingViewThree extends StatelessWidget {
  OnboardingViewThree({
    Key? key,
    required this.imgUrl,
    required this.onFinishPressed,
    required this.onSkipPressed,
  }) : super(key: key);

  String imgUrl;
  Function() onSkipPressed;
  Function() onFinishPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(
        vertical: AppSize.s65,
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
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 400,
            child: Image.asset(
              imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //     vertical: AppPadding.p8,
          //     horizontal: AppPadding.p8,
          //   ),
          //   child: Image.asset(
          //     imgUrl,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          const SizedBox(height: AppSize.s65),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(AppString.manage,
                      style: getBoldStyle(
                          color: ColorManager.kPrimaryColor,
                          fontSize: FontSize.s24)),
                  const SizedBox(height: 10),
                  Text(
                    AppString.onBoardSub3,
                    style: getSemiBoldStyle(
                        color: ColorManager.kGrey1, fontSize: FontSize.s16),
                    textAlign: TextAlign.center,
                  ),
                  // const SizedBox(
                  //   height: 40,
                  // ),
                  // ProgressCircularButton(
                  //   progressValue: 1,
                  //   onPressed: onFinishPressed,
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
