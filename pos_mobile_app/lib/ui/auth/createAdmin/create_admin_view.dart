import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/auth/auth_view_model.dart';
import 'package:pos_mobile_app/ui/auth/login/login_view_model.dart';
import 'package:pos_mobile_app/utils/colors.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import 'create_admin_view_model.dart';

class CreateAdminView extends StatelessWidget {
  const CreateAdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAdminViewModel>.nonReactive(
      viewModelBuilder: () => CreateAdminViewModel(),
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
                      title: AppString.createAdmin,
                      onTap: model.navigateBack,
                      iconThemeColor: ColorManager.kWhiteColor,
                      textColor: ColorManager.kWhiteColor,
                    )),
                Container(
                  margin: const EdgeInsets.only(top: AppMargin.m120),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/auth/envelope.png',
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
                            AppString.enterYourEmailAddress,
                            style: getMediumStyle(
                                color: ColorManager.kDarkCharcoal,
                                fontSize: FontSize.s20),
                          ),
                          const SizedBox(height: AppSize.s40),
                          const InputField(
                            label: AppString.emailAddress,
                            hintText: AppString.emailAddressPlaceholder,
                            border: InputBorder.none,
                          ),
                          const SizedBox(height: AppSize.s6),
                          PosCheckBox(
                              value: false,
                              richText: Expanded(
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                      text: AppString.iAgreeText,
                                      style: getRegularStyle(
                                        color: ColorManager.kTurquoiseDarkColor,
                                        fontSize: FontSize.s14,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: AppString.termsAndUseText,
                                          style: getRegularStyle(
                                            color: ColorManager
                                                .kButtonTextNavyBlue,
                                            fontSize: FontSize.s14,
                                          ),
                                        ),
                                        TextSpan(
                                            text: AppString.haveReadText,
                                            style: getRegularStyle(
                                              color: ColorManager
                                                  .kTurquoiseDarkColor,
                                              fontSize: FontSize.s14,
                                            )),
                                        TextSpan(
                                            text: AppString.privacyPolicyText,
                                            style: getMediumStyle(
                                              color: ColorManager
                                                  .kButtonTextNavyBlue,
                                              fontSize: FontSize.s14,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = (() {
                                                print('Hello barrest dev in');
                                              })),
                                      ]),
                                ),
                              )),
                          const SizedBox(height: AppSize.s12),
                          PosButton(
                            onPressed: () {},
                            title: AppString.continueText,
                            trailingIcon: Icons.arrow_forward,
                            trailingIconColor: ColorManager.kWhiteColor,
                            trailingIconSpace: AppSize.s28,
                            // buttonBgColor: ColorManager.kLightGreen1,
                            // buttonTextColor: ColorManager.kDarkCharcoal,
                            fontSize: FontSize.s16,
                            fontWeight: FontWeightManager.bold,
                            borderRadius: AppSize.s8,
                          ),
                          const SizedBox(height: AppSize.s28),
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
