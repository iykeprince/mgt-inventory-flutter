import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/auth/auth_view_model.dart';
import 'package:pos_mobile_app/ui/auth/login/login_view_model.dart';
import 'package:pos_mobile_app/utils/colors.dart';
import 'package:pos_mobile_app/utils/helpers.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.nonReactive(
      viewModelBuilder: () => LoginViewModel(),
      onModelReady: (model) => listenToFormUpdated(model),
      onDispose: (_) => disposeForm(),
      builder: (context, model, child) => Scaffold(
        // resizeToAvoidBottomInset: false,
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
                  child: AuthNavbar(
                    title: AppString.login,
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
                        'assets/images/auth/lock.png',
                      ),
                    ],
                  ),
                ),
                LoginFormView(
                  emailController: emailController,
                  emailFocusNode: emailFocusNode,
                  passwordController: passwordController,
                  passwordFocusNode: passwordFocusNode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginFormView extends ViewModelWidget<LoginViewModel> {
  const LoginFormView({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.emailFocusNode,
    required this.passwordFocusNode,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context, LoginViewModel model) {
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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: AppSize.s40),
            Text(
              AppString.enterYourLoginDetails,
              style: getSemiBoldStyle(
                color: ColorManager.kDarkCharcoal,
                fontSize: FontSize.s20,
              ),
            ),
            const SizedBox(height: AppSize.s40),
            InputField(
              label: AppString.emailAddress,
              hintText: AppString.emailAddressPlaceholder,
              border: InputBorder.none,
              controller: emailController,
              focusnode: emailFocusNode,
            ),
            if (model.hasErrorForKey(EMAIL_VALIDATOR))
              Alert.primary(text: AppString.emailValidatorText),
            const SizedBox(height: AppSize.s12),
            InputField(
              label: AppString.password,
              hintText: AppString.password,
              border: InputBorder.none,
              obscureText: model.obscurePassword,
              labelRightItem: TextButton(
                onPressed: model.navigateToForgotPassword,
                child: Text(AppString.forgotPassword,
                    style: getSemiBoldStyle(
                        color: ColorManager.kSecondaryColor,
                        fontSize: FontSize.s14)),
              ),
              controller: passwordController,
              focusnode: passwordFocusNode,
              suffixIcon: InkWell(
                onTap: model.togglePasswordVisibility,
                child: Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Icon(
                    model.obscurePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    size: 18,
                    // color: ,
                  ),
                ),
              ),
            ),
            if (model.hasErrorForKey(PASSWORD_VALIDATOR))
              Alert.primary(text: AppString.passwordValidatorText),
            const SizedBox(height: AppSize.s20),
            if (model.hasErrorForKey(LOGIN_TASK_OBJECT))
              Alert.primary(text: '${model.error(LOGIN_TASK_OBJECT)}'),
            const SizedBox(height: AppSize.s20),
            PosButton(
              // onPressed: !model.isFormValid ? model.login : (){ },
              onPressed:
                  !model.isFormValid || model.isBusy ? null : model.login,
              title: AppString.login,
              // buttonBgColor: ColorManager.kLightGreen1,
              // buttonTextColor: ColorManager.kDarkCharcoal,
              fontSize: FontSize.s16,
              fontWeight: FontWeightManager.bold,
              border: Border.all(
                color: ColorManager.kBorderLightGreen,
                width: 1,
              ),
              borderRadius: AppSize.s8,
              busy: model.isBusy,
              disabled: !model.isFormValid || model.isBusy,
            ),
            const SizedBox(height: AppSize.s24),
            Divider(),
            const SizedBox(height: AppSize.s24),
            PosButton(
              onPressed: model.continueWithApple,
              title: AppString.continueWithApple,
              buttonType: ButtonType.fill,
              buttonBgColor: ColorManager.kBackgroundolor,
              buttonTextColor: ColorManager.kDarkCharcoal,
              fontSize: FontSize.s16,
              fontWeight: FontWeightManager.semiBold,
              leadingSvg: SvgPicture.asset('assets/images/apple_icon.svg'),
              leadingIconColor: ColorManager.kDarkColor,
              leadingIconSpace: AppSize.s12,
              paddingVertical: AppPadding.p16,
            ),
            const SizedBox(height: AppSize.s20),
            PosButton(
              onPressed: model.continueWithGoogle,
              title: AppString.continueWithGoogle,
              buttonType: ButtonType.fill,
              buttonBgColor: ColorManager.kBackgroundolor,
              buttonTextColor: ColorManager.kDarkCharcoal,
              fontSize: FontSize.s16,
              fontWeight: FontWeightManager.semiBold,
              leadingSvg: SvgPicture.asset('assets/images/google_icon.svg'),
              leadingIconSpace: AppSize.s16,
              paddingVertical: AppPadding.p16,
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
      ),
    );
  }
}
