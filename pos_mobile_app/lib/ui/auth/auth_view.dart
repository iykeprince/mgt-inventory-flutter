import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/auth/auth_view_model.dart';
import 'package:pos_mobile_app/utils/colors.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.nonReactive(
      viewModelBuilder: () => AuthViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [linearFrom, linearTo],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: AppMargin.m80),
                child: Column(
                  children: [
                    Text(
                      AppString.welcomeTo,
                      style: getRegularStyle(
                          color: ColorManager.kWhiteColor,
                          fontSize: FontSize.s24),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      AppString.pos,
                      style: getThickStyle(
                          color: ColorManager.kWhiteColor,
                          fontSize: FontSize.s24),
                    ),
                    // SvgPicture.asset(
                    //   'assets/images/auth/phone_dash.svg',
                    // ),
                    Image.asset(
                      'assets/images/auth/phone_dash.png',
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                  decoration: const BoxDecoration(
                      color: ColorManager.kWhiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppSize.s16),
                          topRight: Radius.circular(AppSize.s16))),
                  child: Column(children: [
                    const SizedBox(height: AppSize.s32),
                    Text(
                      AppString.registerQuestion,
                      style: getMediumStyle(
                          color: ColorManager.kDarkBlue,
                          fontSize: FontSize.s20),
                    ),
                    const SizedBox(height: AppSize.s32),
                    PosButton(
                      onPressed: model.navigateToRegisterMerchant,
                      title: AppString.registerMerchant,
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.medium,
                      buttonBgColor: ColorManager.kLightGreen1,
                      buttonTextColor: ColorManager.kDarkCharcoal,
                      border: Border.all(
                          color: ColorManager.kBorderLightGreen, width: 1),
                      borderRadius: AppSize.s8,
                    ),
                    const SizedBox(height: AppSize.s12),
                    PosButton(
                      onPressed: model.navigateToCreateAdmin,
                      title: AppString.createAdminAccountText,
                      // buttonBgColor: ColorManager.kLightGreen1,
                      // buttonTextColor: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.bold,
                      border: Border.all(
                          color: ColorManager.kBorderLightGreen, width: 1),
                      borderRadius: AppSize.s8,
                    ),
                    const SizedBox(height: AppSize.s20),
                    PosButton(
                      onPressed: model.navigateToLogin,
                      title: AppString.loginToExisting,
                      buttonType: ButtonType.text,
                      buttonTextColor: ColorManager.kButtonTextNavyBlue,
                    ),
                    const SizedBox(height: AppSize.s40),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
