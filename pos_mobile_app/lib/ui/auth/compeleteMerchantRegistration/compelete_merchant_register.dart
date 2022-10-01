import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pos_mobile_app/ui/auth/compeleteMerchantRegistration/compelete_merchant_register_model.dart';
import 'package:pos_mobile_app/utils/colors.dart';
import 'package:pos_mobile_app/utils/helpers.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

class CompeleteMerchantRegister extends StatelessWidget {
  const CompeleteMerchantRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompeleteMerchantRegisterModel>.nonReactive(
      viewModelBuilder: () => CompeleteMerchantRegisterModel(),
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
                    title: AppString.registerMerchant,
                    onTap: model.navigateBack,
                    iconThemeColor: ColorManager.kWhiteColor,
                    textColor: ColorManager.kWhiteColor,
                    automaticallyImplyLeading: false,
                  ),
                ),
                CompleteMerchantFormView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompleteMerchantFormView
    extends ViewModelWidget<CompeleteMerchantRegisterModel> {
  const CompleteMerchantFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CompeleteMerchantRegisterModel model) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.84,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
        decoration: const BoxDecoration(
            color: ColorManager.kWhiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.s16),
                topRight: Radius.circular(AppSize.s16))),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: AppSize.s40),
            Text(
              AppString.completeProfile,
              style: getMediumStyle(
                  color: ColorManager.kDarkCharcoal, fontSize: FontSize.s20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSize.s40),
            const InputField(
              label: AppString.fullNameText,
              hintText: AppString.businessNamePlaceholder,
              border: InputBorder.none,
              // onChanged: model.setBusinessName,
            ),
            // if (model.hasErrorForKey(BUSINESS_NAME_VALIDATOR))
            Alert.primary(text: AppString.businessNameValidatorText),
            const SizedBox(height: AppSize.s12),
            const InputField(
              label: AppString.usernameText,
              hintText: AppString.sampleUsernameText,
              border: InputBorder.none,
              // onChanged: model.setEmailAddress,
              keyBoardType: TextInputType.text,
            ),
            // if (model.hasErrorForKey(EMAIL_VALIDATOR))
            Alert.primary(text: AppString.emailValidatorText),
            const SizedBox(height: AppSize.s12),
            const InputField(
              label: AppString.contactNumberText,
              hintText: AppString.samplePhoneText,
              border: InputBorder.none,
              // onChanged: model.setNumOfBranches,
              keyBoardType: TextInputType.number,
            ),
            // if (model.hasErrorForKey(NUM_OF_BRANCH_VALIDATOR))
            Alert.primary(text: AppString.contactValidatorText),
            const SizedBox(height: AppSize.s12),
            const InputField(
              label: AppString.branchNameText,
              hintText: AppString.samplebranchNameText,
              border: InputBorder.none,
              readOnly: true,
              fillColor: ColorManager.kGreyOpacity2,
              hintColor: ColorManager.kDarkCharcoal,
              keyBoardType: TextInputType.number,
            ),

            const SizedBox(height: AppSize.s12),
            InputField(
              label: AppString.password,
              hintText: AppString.password,
              border: InputBorder.none,
              obscureText: model.obscurePassword,
              // onChanged: model.setPassword,
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
            // if (model.hasErrorForKey(PASSWORD_VALIDATOR))
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
                model.navigateToHome();
                // model.createAdmin();
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
      ),
    );
  }
}
