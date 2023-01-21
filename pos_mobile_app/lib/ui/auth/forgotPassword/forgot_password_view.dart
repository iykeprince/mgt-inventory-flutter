import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/auth/auth_view_model.dart';
import 'package:pos_mobile_app/ui/auth/forgotPassword/forgot_password_view.form.dart';
import 'package:pos_mobile_app/ui/auth/login/login_view_model.dart';
import 'package:pos_mobile_app/utils/colors.dart';
import 'package:pos_mobile_app/utils/helpers.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'forgot_password_view_model.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
])
class ForgotPasswordView extends StatelessWidget with $ForgotPasswordView {
  ForgotPasswordView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPasswordViewModel>.nonReactive(
      viewModelBuilder: () => ForgotPasswordViewModel(),
      onModelReady: (model) => listenToFormUpdated(model),
      onDispose: (_) => disposeForm(),
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
                      title: AppString.resetPassword,
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
                VerifyAdminFormView(
                  emailController: emailController,
                  emailFocusNode: emailFocusNode,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VerifyAdminFormView extends ViewModelWidget<ForgotPasswordViewModel> {
  const VerifyAdminFormView({
    Key? key,
    required this.emailController,
    required this.emailFocusNode,
  }) : super(key: key);

  final TextEditingController emailController;
  final FocusNode emailFocusNode;

  @override
  Widget build(BuildContext context, ForgotPasswordViewModel model) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        // height: 300,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
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
              AppString.forgotYourPasswordText,
              style: getSemiBoldStyle(
                color: ColorManager.kDarkCharcoal,
                fontSize: FontSize.s20,
              ),
            ),
            const SizedBox(height: AppSize.s8),
            Text(
              AppString.forgotYourPasswordSubText,
              style: getRegularStyle(
                color: ColorManager.kDarkCharcoal,
                fontSize: FontSize.s14,
              ),
            ),
            const SizedBox(height: AppSize.s40),
            InputField(
              label: AppString.emailAddress,
              hintText: AppString.emailAddressPlaceholder,
              border: InputBorder.none,
              keyBoardType: TextInputType.number,
              controller: emailController,
              focusnode: emailFocusNode,
            ),
            const SizedBox(height: AppSize.s40),
            PosButton(
              onPressed: model.isFormValid || model.isBusy
                  ? () {}
                  : () {
                      dismissKeyboard(context);
                      model.forgotPassword();
                    },
              title: AppString.sendResetLinkText,
              fontSize: FontSize.s16,
              fontWeight: FontWeightManager.bold,
              borderRadius: AppSize.s8,
              busy: model.isBusy,
              disabled: !model.isFormValid || model.isBusy,
            ),
            const SizedBox(height: AppSize.s20),
            if (model.hasError) Alert.primary(text: '${model.modelError}'),
            if (model.hasError) const SizedBox(height: AppSize.s20),
            Column(
              children: [
                PosButton(
                  onPressed: model.goBack,
                  title: AppString.returnToLoginText,
                  buttonType: ButtonType.text,
                  buttonTextColor: ColorManager.kButtonTextNavyBlue,
                  fontWeight: FontWeightManager.semiBold,
                ),
              ],
            ),
            const SizedBox(height: AppSize.s20),
          ],
        ),
      ),
    );
  }
}
