import 'package:flutter/material.dart';
import 'package:pos_mobile_app/ui/splash/splash_view_model.dart';
import 'package:pos_mobile_app/utils/colors.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:pos_mobile_ui_package/utils/font_styles.dart';
import 'package:stacked/stacked.dart';

import '../../../utils/helpers.dart';
import 'verify_admin_success_view.dart';

class VerifyAdminSuccessView extends StatelessWidget {
  const VerifyAdminSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyAdminSuccessViewModel>.reactive(
      viewModelBuilder: () => VerifyAdminSuccessViewModel(),
      // onModelReady: ,
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [linearFrom, linearTo],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/auth/cone.png',
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Text(AppString.successEmailVerficationText,
                    style: getBoldStyle(
                        color: ColorManager.kWhiteColor,
                        fontSize: FontSize.s28)),
                const SizedBox(
                  height: AppSize.s12,
                ),
                Text(
                  AppString.successEmailVerficationCaption,
                  style: getMediumStyle(
                      color: ColorManager.kWhiteColor, fontSize: FontSize.s16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                PosButton(
                  onPressed: () {},
                  title: AppString.continueText,
                  buttonBgColor: ColorManager.kLightGreen,
                  buttonTextColor: ColorManager.kDarkBlue,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
