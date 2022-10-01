import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/auth/createAdminBusiness/create_admin_business_modal.dart';
import 'package:pos_mobile_app/utils/colors.dart';
import 'package:pos_mobile_app/utils/helpers.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import '../createAdmin/create_admin_view_model.dart';

class CreateAdminBusinessView extends StatelessWidget {
  const CreateAdminBusinessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAdminBusinessViewModel>.nonReactive(
      viewModelBuilder: () => CreateAdminBusinessViewModel(),
      builder: (context, model, child) => Scaffold(
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
                    automaticallyImplyLeading: false,
                  ),
                ),
                CreateBusinessFormView(),
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
  const CreateBusinessFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CreateAdminBusinessViewModel model) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
        decoration: const BoxDecoration(
            color: ColorManager.kWhiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.s16),
                topRight: Radius.circular(AppSize.s16))),
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
            onChanged: model.setBusinessName,
          ),
          if (model.hasErrorForKey(BUSINESS_NAME_VALIDATOR))
            Alert.primary(text: AppString.businessNameValidatorText),
          const SizedBox(height: AppSize.s12),
          InputField(
            label: AppString.emailAddress,
            hintText: AppString.emailAddressPlaceholder,
            border: InputBorder.none,
            onChanged: model.setEmailAddress,
            keyBoardType: TextInputType.emailAddress,
          ),
          if (model.hasErrorForKey(EMAIL_VALIDATOR))
            Alert.primary(text: AppString.emailValidatorText),
          const SizedBox(height: AppSize.s12),
          InputField(
            label: AppString.numOfBranchText,
            hintText: AppString.numOfBranchPlaceholder,
            border: InputBorder.none,
            onChanged: model.setNumOfBranches,
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
            onChanged: model.setPassword,
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
            onPressed: () {
              dismissKeyboard(context);
              model.createAdmin();
            },
            title: AppString.createAccountText,
            fontSize: FontSize.s16,
            fontWeight: FontWeightManager.bold,
            borderRadius: AppSize.s8,
            busy: model.isBusy,
          ),
          const SizedBox(height: AppSize.s100),
        ]),
      ),
    );
  }
}
