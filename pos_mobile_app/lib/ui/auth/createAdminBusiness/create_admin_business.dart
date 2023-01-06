import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/auth/createAdminBusiness/create_admin_business_view_model.dart';
import 'package:pos_mobile_app/utils/colors.dart';
import 'package:pos_mobile_app/utils/helpers.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'create_admin_business.form.dart';

@FormView(fields: [
  FormTextField(name: 'businessName'),
  FormTextField(name: 'emailAddress'),
  FormTextField(name: 'numberOfBranches'),
  FormTextField(name: 'userPassword')
])
class CreateAdminBusinessView extends StatelessWidget
    with $CreateAdminBusinessView {
  CreateAdminBusinessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAdminBusinessViewModel>.nonReactive(
      viewModelBuilder: () => CreateAdminBusinessViewModel(),
      onModelReady: (model) => listenToFormUpdated(model),
      onDispose: (_) => disposeForm(),
      builder: (context, model, child) => Scaffold(
        // resizeToAvoidBottomInset: true,
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
                    title: AppString.createAdmin,
                    onTap: model.navigateBack,
                    iconThemeColor: ColorManager.kWhiteColor,
                    textColor: ColorManager.kWhiteColor,
                  ),
                ),
                CreateBusinessFormView(
                  businessNameController: businessNameController,
                  emailController: emailAddressController,
                  numberOfBranchesController: numberOfBranchesController,
                  passwordController: userPasswordController,
                  businessNameFocusNode: businessNameFocusNode,
                  emailFocusNode: emailAddressFocusNode,
                  numberOfBranchesFocusNode: numberOfBranchesFocusNode,
                  passwordFocusNode: userPasswordFocusNode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CreateBusinessFormView
    extends ViewModelWidget<CreateAdminBusinessViewModel> {
  const CreateBusinessFormView({
    Key? key,
    required this.passwordController,
    required this.numberOfBranchesController,
    required this.emailController,
    required this.businessNameController,
    required this.businessNameFocusNode,
    required this.emailFocusNode,
    required this.numberOfBranchesFocusNode,
    required this.passwordFocusNode,
  }) : super(key: key);

  final TextEditingController businessNameController;
  final TextEditingController emailController;
  final TextEditingController numberOfBranchesController;
  final TextEditingController passwordController;
  final FocusNode businessNameFocusNode;
  final FocusNode emailFocusNode;
  final FocusNode numberOfBranchesFocusNode;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context, CreateAdminBusinessViewModel model) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: ScreenHorizontalSize),
        decoration: const BoxDecoration(
            color: ColorManager.kWhiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.s16),
                topRight: Radius.circular(AppSize.s16))),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(children: [
            const SizedBox(height: AppSize.s40),
            Text(
              AppString.businessDetailsText,
              style: getMediumStyle(
                  color: ColorManager.kDarkCharcoal, fontSize: FontSize.s20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSize.s40),
            InputField(
              label: AppString.businessNameText,
              hintText: AppString.businessNamePlaceholder,
              border: InputBorder.none,
              controller: businessNameController,
              focusnode: businessNameFocusNode,
            ),
            if (model.hasErrorForKey(BUSINESS_NAME_VALIDATOR))
              Alert.primary(text: AppString.businessNameValidatorText),
            const SizedBox(height: AppSize.s12),
            InputField(
              label: AppString.emailAddress,
              hintText: AppString.emailAddressPlaceholder,
              border: InputBorder.none,
              controller: emailController,
              focusnode: emailFocusNode,
              keyBoardType: TextInputType.emailAddress,
            ),
            if (model.hasErrorForKey(EMAIL_VALIDATOR))
              Alert.primary(text: AppString.emailValidatorText),
            const SizedBox(height: AppSize.s12),
            InputField(
              label: AppString.numOfBranchText,
              hintText: AppString.numOfBranchPlaceholder,
              border: InputBorder.none,
              controller: numberOfBranchesController,
              focusnode: numberOfBranchesFocusNode,
              keyBoardType: TextInputType.number,
            ),
            if (model.hasErrorForKey(NUM_OF_BRANCH_VALIDATOR))
              Alert.primary(text: AppString.numOfBranchValidatorText),
            const SizedBox(height: AppSize.s12),
            InputField(
              label: AppString.password,
              hintText: AppString.password,
              border: InputBorder.none,
              obscureText: model.obscurePassword,
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
            if (model.hasError)
              Alert.primary(
                text: '${model.modelError}',
              ),
            if (model.hasError) const SizedBox(height: AppSize.s20),
            PosButton(
              onPressed: !model.isFormValid
                  ? () {}
                  : () {
                      dismissKeyboard(context);
                      model.createAdmin();
                    },
              title: AppString.createAccountText,
              fontSize: FontSize.s16,
              fontWeight: FontWeightManager.bold,
              borderRadius: AppSize.s8,
              busy: model.isBusy,
              disabled: !model.isFormValid,
            ),
            const SizedBox(height: AppSize.s32),
          ]),
        ),
      ),
    );
  }
}
