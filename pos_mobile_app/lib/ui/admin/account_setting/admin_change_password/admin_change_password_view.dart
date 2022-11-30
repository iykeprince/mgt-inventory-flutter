import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/string_manager.dart';
import 'package:pos_mobile_ui_package/utils/values_manager.dart';
import 'package:pos_mobile_ui_package/widgets/appbar/appbar.dart';
import 'package:pos_mobile_ui_package/widgets/keyboardAware/keyboard_aware.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'admin_change_password_view.form.dart';
import 'admin_change_password_view_model.dart';

@FormView(fields: [
  FormTextField(name: 'oldPassword'),
  FormTextField(name: 'newPassword'),
  FormTextField(name: 'confirmPassword'),
])
class AdminChangePasswordView extends StatelessWidget
    with $AdminChangePasswordView {
  AdminChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminChangePasswordViewModel>.nonReactive(
      viewModelBuilder: () => AdminChangePasswordViewModel(),
      onModelReady: (model) {
        listenToFormUpdated(model);
      },
      onDispose: (_) => disposeForm(),
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
            children: [
              const SizedBox(
                height: AppSize.s12,
              ),
              AdminChangePasswordFormView(
                  oldPasswordController: oldPasswordController,
                  oldPasswordFocusNode: oldPasswordFocusNode,
                  newPasswordController: newPasswordController,
                  newPasswordFocusNode: newPasswordFocusNode,
                  confirmPasswordController: confirmPasswordController,
                  confirmPasswordFocusNode: confirmPasswordFocusNode),
            ],
          )),
        ),
      ),
    );
  }
}

class AdminChangePasswordFormView
    extends ViewModelWidget<AdminChangePasswordViewModel> {
  const AdminChangePasswordFormView(
      {Key? key,
      required this.oldPasswordController,
      required this.newPasswordController,
      required this.confirmPasswordController,
      required this.oldPasswordFocusNode,
      required this.newPasswordFocusNode,
      required this.confirmPasswordFocusNode})
      : super(key: key);

  final TextEditingController oldPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  final FocusNode oldPasswordFocusNode;
  final FocusNode newPasswordFocusNode;
  final FocusNode confirmPasswordFocusNode;

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
                  controller: oldPasswordController,
                  focusnode: oldPasswordFocusNode,
                ),
                const SizedBox(height: AppSize.s16),
                InputField(
                  label: AppString.newPasswordText,
                  hintText: '',
                  border: InputBorder.none,
                  labelStyle: getBoldStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s16),
                  controller: newPasswordController,
                  focusnode: newPasswordFocusNode,
                ),
                const SizedBox(height: AppSize.s16),
                InputField(
                  label: AppString.confirmPasswordText,
                  hintText: '',
                  border: InputBorder.none,
                  labelStyle: getBoldStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s16),
                  controller: confirmPasswordController,
                  focusnode: confirmPasswordFocusNode,
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
              onPressed: model.isFormValid ? model.changePassword : () {},
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
              disabled: !model.isFormValid,
            ),
            // const SizedBox(height: AppSize.s4),
          ],
        ),
      ),
    );
  }
}
