import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/auth/auth_view_model.dart';
import 'package:pos_mobile_app/ui/auth/login/login_view_model.dart';
import 'package:pos_mobile_app/utils/colors.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.nonReactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Container(
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
                Positioned(
                    top: AppSize.s8,
                    left: AppSize.s8,
                    right: AppSize.s8,
                    child: Navbar(
                      title: AppString.login,
                      onTap: model.navigateBack,
                      iconThemeColor: ColorManager.kWhiteColor,
                      textColor: ColorManager.kWhiteColor,
                    )),
                Container(
                  margin: const EdgeInsets.only(top: AppMargin.m120),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/auth/lock.png',
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    // height: 300,
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                    decoration: const BoxDecoration(
                        color: ColorManager.kWhiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSize.s16),
                            topRight: Radius.circular(AppSize.s16))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: AppSize.s40),
                          Text(
                            AppString.enterYourLoginDetails,
                            style: getMediumStyle(
                                color: ColorManager.kDarkCharcoal,
                                fontSize: FontSize.s20),
                          ),
                          const SizedBox(height: AppSize.s40),
                          const InputField(
                            label: AppString.usernameOrEmailAddress,
                            hintText: AppString.emailAddressPlaceholder,
                            border: InputBorder.none,
                          ),
                          const SizedBox(height: AppSize.s12),
                          InputField(
                              label: AppString.password,
                              hintText: AppString.password,
                              border: InputBorder.none,
                              obscureText: true,
                              labelRightItem: TextButton(
                                onPressed: () {},
                                child: Text(AppString.forgotPassword,
                                    style: getRegularStyle(
                                        color: ColorManager.kSecondaryColor,
                                        fontSize: FontSize.s14)),
                              )),
                          const SizedBox(height: AppSize.s20),
                          PosButton(
                            onPressed: () {
                              print('TODO: LOGIN');
                            },
                            title: AppString.login,
                            // buttonBgColor: ColorManager.kLightGreen1,
                            // buttonTextColor: ColorManager.kDarkCharcoal,
                            fontSize: FontSize.s16,
                            fontWeight: FontWeightManager.bold,
                            border: Border.all(
                                color: ColorManager.kBorderLightGreen,
                                width: 1),
                            borderRadius: AppSize.s8,
                          ),
                          const SizedBox(height: AppSize.s20),
                          PosButton(
                            onPressed: model.navigateToRegisterNow,
                            title: AppString.dontHaveAnAccountRegisterNow,
                            buttonType: ButtonType.text,
                            buttonTextColor: ColorManager.kButtonTextNavyBlue,
                          ),
                          const SizedBox(height: AppSize.s20),
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
