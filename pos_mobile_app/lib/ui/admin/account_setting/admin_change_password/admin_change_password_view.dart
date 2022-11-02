import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/string_manager.dart';
import 'package:pos_mobile_ui_package/utils/values_manager.dart';
import 'package:pos_mobile_ui_package/widgets/appbar/appbar.dart';
import 'package:pos_mobile_ui_package/widgets/keyboardAware/keyboard_aware.dart';
import 'package:stacked/stacked.dart';

import 'admin_change_password_view_model.dart';

class AdminChangePasswordView extends StatelessWidget {
  const AdminChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminChangePasswordViewModel>.nonReactive(
      viewModelBuilder: () => AdminChangePasswordViewModel(),
      onModelReady: (model) {},
      builder: (context, model, child) => Scaffold(
        backgroundColor: ColorManager.kWhiteColor,
        appBar: Navbar(
          title: AppString.changePasswordText,
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
              AdminChangePasswordFormView()
            ],
          )),
        ),
      ),
    );
  }
}

class AdminChangePasswordFormView
    extends ViewModelWidget<AdminChangePasswordViewModel> {
  const AdminChangePasswordFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AdminChangePasswordViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
      child: SizedBox(
        height: screenHeightPercentage(context, percentage: 0.83),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: AppSize.s20),
                InputField(
                  label: AppString.oldPasswordText,
                  hintText: '',
                  border: InputBorder.none,
                  labelStyle: getBoldStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s16),
                  controller: model.oldPasswordController,
                ),
                const SizedBox(height: AppSize.s16),
                InputField(
                  label: AppString.newPasswordText,
                  hintText: '',
                  border: InputBorder.none,
                  labelStyle: getBoldStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s16),
                  controller: model.newPasswordController,
                ),
                const SizedBox(height: AppSize.s16),
                InputField(
                  label: AppString.confirmPasswordText,
                  hintText: '',
                  border: InputBorder.none,
                  labelStyle: getBoldStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s16),
                  controller: model.confirmPasswordController,
                ),
                const SizedBox(height: AppSize.s32),
                if (model.hasErrorForKey(ADMIN_CHANGE_PASSWORD_TASK))
                  Alert.primary(
                    text: '${model.error(ADMIN_CHANGE_PASSWORD_TASK)}',
                  ),
                if (model.hasMessageForKey(ADMIN_CHANGE_PASSWORD_TASK))
                  Alert.primary(
                      text: '${model.message(ADMIN_CHANGE_PASSWORD_TASK)}'),
                if (model.hasErrorForKey(ADMIN_CHANGE_PASSWORD_TASK))
                  const SizedBox(height: AppSize.s20),
              ],
            ),
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
            // const SizedBox(height: AppSize.s4),
          ],
        ),
      ),
    );
  }
}
