import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import 'onboarding_view_model.dart';

class OnboardView extends StatefulWidget {
  OnboardView({Key? key}) : super(key: key);

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      _animatePage();
    });
  }

  _animatePage() {
    setState(() {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });

    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
  }

  _onPageChanged(int value) {
    setState(() {
      _currentPage = value;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.nonReactive(
        viewModelBuilder: () => OnboardingViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: Container(
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
                      if (_currentPage >= 2)
                        GestureDetector(
                          onTap: () => model.navigateToAuth(),
                          child: Text(
                            AppString.skip,
                            style: getBoldStyle(
                                color: ColorManager.kDarkCharcoal,
                                fontSize: FontSize.s16),
                          ),
                        ),
                      if (_currentPage < 2)
                        Text(
                          "",
                          style: getBoldStyle(
                              color: ColorManager.kDarkCharcoal,
                              fontSize: FontSize.s16),
                        ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      children: [
                        OnboardingViewWidget(
                          imgUrl: 'assets/images/record.png',
                          title: AppString.record,
                          description: AppString.onBoardSub1,
                        ),
                        OnboardingViewWidget(
                          imgUrl: 'assets/images/track.png',
                          title: AppString.track,
                          description: AppString.onBoardSub2,
                        ),
                        OnboardingViewWidget(
                          imgUrl: 'assets/images/manage.png',
                          title: AppString.manage,
                          description: AppString.onBoardSub3,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(
                            begin: 0.33, end: 0.33333334 * (_currentPage + 1)),
                        duration: const Duration(milliseconds: 200),
                        builder: (context, value, _) => ProgressCircularButton(
                          progressValue: value,
                          onPressed: _currentPage >= 2
                              ? model.navigateToAuth
                              : _animatePage,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: AppSize.s65),
                ],
              ),
            ),
          );
        });
  }
}

              // child: Column(
              //   children: [
              //     PageView(
              //       children: [
              //         OnboardingViewOne(
              //           imgUrl: "assets/images/record.png",
              //           onNextPressed: () {
              //             _pageController.animateToPage(
              //               1,
              //               duration: const Duration(milliseconds: 350),
              //               curve: Curves.easeIn,
              //             );
              //           },
              //           onSkipPressed: () {
              //             print('hello skip');
              //             model.navigateToAuth();
              //           },
              //         ),
              //         OnboardingViewTwo(
              //           imgUrl: "assets/images/track.png",
              //           onNextPressed: () {
              //             _pageController.animateToPage(
              //               2,
              //               duration: const Duration(milliseconds: 350),
              //               curve: Curves.easeIn,
              //             );
              //           },
              //           onSkipPressed: () => model.navigateToAuth(),
              //         ),
              //         OnboardingViewThree(
              //           imgUrl: "assets/images/manage.png",
              //           onFinishPressed: () => model.navigateToAuth(),
              //           onSkipPressed: () => model.navigateToAuth(),
              //         )
              //       ],
              //       scrollDirection: Axis.horizontal,
              //       controller: _pageController,
              //     ),
              //     const SizedBox(height: AppSize.s65),
              //     const SizedBox(
              //       height: 40,
              //     ),
              //     ProgressCircularButton(
              //       progressValue: .34,
              //       onPressed: (){},
              //     ),
              //   ],
              // ),