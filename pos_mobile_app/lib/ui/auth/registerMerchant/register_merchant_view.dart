import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pos_mobile_app/utils/colors.dart';
import 'package:pos_mobile_app/utils/helpers.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';
import '../../../utils/pos_contants.dart';
import 'register_merchant_view_model.dart';

class RegisterMerchantView extends StatelessWidget {
  const RegisterMerchantView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterMerchantViewModel>.nonReactive(
      viewModelBuilder: () => RegisterMerchantViewModel(),
      builder: (context, model, child) => Scaffold(
        // resizeToAvoidBottomInset: false,
        body: KeyboardAware(
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
                    title: AppString.registerMerchant,
                    onTap: model.navigateBack,
                    iconThemeColor: ColorManager.kWhiteColor,
                    textColor: ColorManager.kWhiteColor,
                  ),
                ),
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
                const RegisterMerchantFormView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterMerchantFormView
    extends ViewModelWidget<RegisterMerchantViewModel> {
  const RegisterMerchantFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, RegisterMerchantViewModel model) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SingleChildScrollView(
        reverse: true,
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
          decoration: const BoxDecoration(
              color: ColorManager.kWhiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.s16),
                  topRight: Radius.circular(AppSize.s16))),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: AppSize.s40),
            Text(
              AppString.enterYourEmailAddress,
              style: getMediumStyle(
                  color: ColorManager.kDarkCharcoal, fontSize: FontSize.s20),
            ),
            const SizedBox(height: AppSize.s40),
            InputField(
              label: AppString.emailAddress,
              hintText: AppString.emailAddressPlaceholder,
              border: InputBorder.none,
              onChanged: model.setEmailAddress,
            ),
            if (model.hasErrorForKey(EMAIL_ADDRESS_VALIDATOR))
              Alert.primary(
                text: model.error(EMAIL_ADDRESS_VALIDATOR),
              ),
            const SizedBox(height: AppSize.s6),
            PosCheckBox(
                value: model.tos,
                onChanged: (value) {
                  model.setTos(value);
                },
                richText: Expanded(
                  child: GestureDetector(
                    onTap: () {
                      model.setTos(!model.tos);
                    },
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
                                color: ColorManager.kButtonTextNavyBlue,
                                fontSize: FontSize.s14,
                              ),
                            ),
                            TextSpan(
                              text: AppString.haveReadText,
                              style: getRegularStyle(
                                color: ColorManager.kTurquoiseDarkColor,
                                fontSize: FontSize.s14,
                              ),
                            ),
                            TextSpan(
                                text: AppString.privacyPolicyText,
                                style: getMediumStyle(
                                  color: ColorManager.kButtonTextNavyBlue,
                                  fontSize: FontSize.s14,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = (() {
                                    print('Hello barrest dev in');
                                  })),
                          ]),
                    ),
                  ),
                )),
            const SizedBox(height: AppSize.s12),
            if (model.hasErrorForKey(TOS_VALIDATOR))
              Alert.primary(
                text: model.error(TOS_VALIDATOR),
              ),
            if (model.hasErrorForKey(VERIFY_MERCHANT_TASK_OBJECT))
              Alert.primary(
                text: '${model.error(VERIFY_MERCHANT_TASK_OBJECT)}',
              ),
            const SizedBox(height: AppSize.s12),
            PosButton(
              onPressed: () {
                dismissKeyboard(context);
                model.navigateToVerifyMerchant();
              },
              title: AppString.continueText,
              trailingIcon: Icons.arrow_forward,
              trailingIconColor: ColorManager.kWhiteColor,
              trailingIconSpace: AppSize.s28,
              fontSize: FontSize.s16,
              fontWeight: FontWeightManager.bold,
              borderRadius: AppSize.s8,
              busy: model.isBusy,
            ),
            const SizedBox(height: AppSize.s28),
          ]),
        ),
      ),
    );
  }
}
