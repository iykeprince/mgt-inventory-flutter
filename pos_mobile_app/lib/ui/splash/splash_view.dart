import 'package:flutter/material.dart';
import 'package:pos_mobile_app/ui/splash/splash_view_model.dart';
import 'package:pos_mobile_app/utils/colors.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewViewModel>.reactive(
      viewModelBuilder: () => SplashViewViewModel(),
      onModelReady: (model) => model.runStartupLogic(),
      builder: (context, viewModel, child) {
        print('SPLASH [isBusy]: ${viewModel.isBusy}');
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [linearFrom, linearTo],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              children: [
                const Positioned(
                  top: AppSize.s28,
                  left: 0,
                  right: 0,
                  child: LinearProgressIndicator(),
                ),
                Center(
                  child: Image.asset(
                    'assets/images/POS.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
