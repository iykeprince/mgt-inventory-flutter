import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/auth/auth_view_model.dart';
import 'package:pos_mobile_app/ui/auth/login/login_view_model.dart';
import 'package:pos_mobile_app/utils/colors.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import 'verify_admin_view_model.dart';

class VerifyAdminView extends StatelessWidget {
  const VerifyAdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyAdminViewModel>.nonReactive(
      viewModelBuilder: () => VerifyAdminViewModel(),
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
                      onTap: () {},
                      iconThemeColor: ColorManager.kWhiteColor,
                      textColor: ColorManager.kWhiteColor,
                    )),
                Container(
                  margin: const EdgeInsets.only(top: AppMargin.m120),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/auth/key.png',
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
                          AppString.verifyEmailText,
                          style: getMediumStyle(
                            color: ColorManager.kDarkCharcoal,
                            fontSize: FontSize.s20,
                          ),
                        ),
                        const SizedBox(height: AppSize.s4),
                        Text(
                          AppString.verifyEmailSubText,
                          style: getRegularStyle(
                            color: ColorManager.kDarkCharcoal,
                            fontSize: FontSize.s14,
                          ),
                        ),
                        const SizedBox(height: AppSize.s20),
                        const InputField(
                          label: AppString.otpCodeText,
                          hintText: AppString.otpCodeText,
                          border: InputBorder.none,
                          obscureText: true,
                        ),
                        Alert.primary(text: AppString.otpCodeExpireText),
                        const SizedBox(height: AppSize.s40),
                        PosButton(
                          onPressed: () {},
                          title: AppString.verifyCodeText,
                          fontSize: FontSize.s16,
                          fontWeight: FontWeightManager.bold,
                          borderRadius: AppSize.s8,
                        ),
                        const SizedBox(height: AppSize.s20),
                        PosButton(
                          onPressed: () {},
                          title: AppString.changeEmailAddressText,
                          buttonType: ButtonType.text,
                          buttonTextColor: ColorManager.kButtonTextNavyBlue,
                        ),
                        const SizedBox(height: AppSize.s20),
                      ],
                    ),
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
