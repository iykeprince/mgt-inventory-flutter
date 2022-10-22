import 'package:flutter/material.dart';
import 'package:pos_mobile_app/ui/merchant/profile/changepassword/change_password_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/string_manager.dart';
import 'package:pos_mobile_ui_package/utils/values_manager.dart';
import 'package:pos_mobile_ui_package/widgets/appbar/appbar.dart';
import 'package:pos_mobile_ui_package/widgets/keyboardAware/keyboard_aware.dart';
import 'package:stacked/stacked.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChangePasswordViewModel>.nonReactive(
      viewModelBuilder: () => ChangePasswordViewModel(),
      onModelReady: (model) {},
      builder: (context, model, child) => Scaffold(
        backgroundColor: ColorManager.kWhiteColor,
        appBar: Navbar(
          leadingText: AppString.changePasswordText,
          leadingWidth: double.infinity,
          onTap: model.navigateBack,
          iconColor: ColorManager.kDarkCharcoal,
        ),
        body: KeyboardAware(
          child: SingleChildScrollView(
              child: Column(
            children: const [
              SizedBox(
                height: AppSize.s12,
              ),
              ChangePasswordFormView()
            ],
          )),
        ),
      ),
    );
  }
}

class ChangePasswordFormView extends ViewModelWidget<ChangePasswordViewModel> {
  const ChangePasswordFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ChangePasswordViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSize.s40),
          InputField(
            label: AppString.oldPasswordText,
            hintText: '',
            border: InputBorder.none,
            labelStyle: getBoldStyle(
                color: ColorManager.kDarkCharcoal, fontSize: FontSize.s16),
            controller: model.oldPasswordController,
          ),
          const SizedBox(height: AppSize.s16),
          InputField(
            label: AppString.newPasswordText,
            hintText: '',
            border: InputBorder.none,
            labelStyle: getBoldStyle(
                color: ColorManager.kDarkCharcoal, fontSize: FontSize.s16),
            controller: model.newPasswordController,
          ),
          const SizedBox(height: AppSize.s16),
          InputField(
            label: AppString.confirmPasswordText,
            hintText: '',
            border: InputBorder.none,
            labelStyle: getBoldStyle(
                color: ColorManager.kDarkCharcoal, fontSize: FontSize.s16),
            controller: model.confirmPasswordController,
          ),
          const SizedBox(height: AppSize.s32),
          if (model.hasErrorForKey(CHANGE_PASSWORD_TASK))
            Alert.primary(
              text: '${model.error(CHANGE_PASSWORD_TASK)}',
            ),
          if (model.hasMessageForKey(CHANGE_PASSWORD_TASK))
            Alert.primary(text: '${model.message(CHANGE_PASSWORD_TASK)}'),
          if (model.hasErrorForKey(CHANGE_PASSWORD_TASK))
            const SizedBox(height: AppSize.s20),
          PosButton(
            onPressed: model.changePassword,
            title: AppString.changePasswordText,
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
          ),
          const SizedBox(height: AppSize.s20),
        ],
      ),
    );
  }
}
