import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';

class OnboardingViewThree extends StatelessWidget {
  OnboardingViewThree({
    Key? key,
    required this.onFinishPressed,
    required this.onSkipPressed,
  }) : super(key: key);

  Function() onSkipPressed;
  Function() onFinishPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 8),
      decoration: const BoxDecoration(color: Colors.white),
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
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Manage',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Create, revoke, and manage moderator accounts; automatically own a copy of weekly, monthly, quarterly or yearly transaction reports. ',
                  style: TextStyle(
                    color: Color(0xff555555),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                ProgressCircularButton(
                  progressValue: 1,
                  onPressed: onFinishPressed,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
