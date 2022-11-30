// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String OldPasswordValueKey = 'oldPassword';
const String NewPasswordValueKey = 'newPassword';
const String ConfirmPasswordValueKey = 'confirmPassword';

final Map<String, TextEditingController>
    _AdminChangePasswordViewTextEditingControllers = {};

final Map<String, FocusNode> _AdminChangePasswordViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _AdminChangePasswordViewTextValidations = {
  OldPasswordValueKey: null,
  NewPasswordValueKey: null,
  ConfirmPasswordValueKey: null,
};

mixin $AdminChangePasswordView on StatelessWidget {
  TextEditingController get oldPasswordController =>
      _getFormTextEditingController(OldPasswordValueKey);
  TextEditingController get newPasswordController =>
      _getFormTextEditingController(NewPasswordValueKey);
  TextEditingController get confirmPasswordController =>
      _getFormTextEditingController(ConfirmPasswordValueKey);
  FocusNode get oldPasswordFocusNode => _getFormFocusNode(OldPasswordValueKey);
  FocusNode get newPasswordFocusNode => _getFormFocusNode(NewPasswordValueKey);
  FocusNode get confirmPasswordFocusNode =>
      _getFormFocusNode(ConfirmPasswordValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_AdminChangePasswordViewTextEditingControllers.containsKey(key)) {
      return _AdminChangePasswordViewTextEditingControllers[key]!;
    }
    _AdminChangePasswordViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AdminChangePasswordViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AdminChangePasswordViewFocusNodes.containsKey(key)) {
      return _AdminChangePasswordViewFocusNodes[key]!;
    }
    _AdminChangePasswordViewFocusNodes[key] = FocusNode();
    return _AdminChangePasswordViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    oldPasswordController.addListener(() => _updateFormData(model));
    newPasswordController.addListener(() => _updateFormData(model));
    confirmPasswordController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the dynamic
  void _updateFormData(dynamic model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          OldPasswordValueKey: oldPasswordController.text,
          NewPasswordValueKey: newPasswordController.text,
          ConfirmPasswordValueKey: confirmPasswordController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the dynamic
  void _updateValidationData(dynamic model) => model.setValidationMessages({
        OldPasswordValueKey: _getValidationMessage(OldPasswordValueKey),
        NewPasswordValueKey: _getValidationMessage(NewPasswordValueKey),
        ConfirmPasswordValueKey: _getValidationMessage(ConfirmPasswordValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _AdminChangePasswordViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey = validatorForKey(
        _AdminChangePasswordViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller
        in _AdminChangePasswordViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AdminChangePasswordViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AdminChangePasswordViewTextEditingControllers.clear();
    _AdminChangePasswordViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get oldPasswordValue =>
      this.formValueMap[OldPasswordValueKey] as String?;
  String? get newPasswordValue =>
      this.formValueMap[NewPasswordValueKey] as String?;
  String? get confirmPasswordValue =>
      this.formValueMap[ConfirmPasswordValueKey] as String?;

  bool get hasOldPassword => this.formValueMap.containsKey(OldPasswordValueKey);
  bool get hasNewPassword => this.formValueMap.containsKey(NewPasswordValueKey);
  bool get hasConfirmPassword =>
      this.formValueMap.containsKey(ConfirmPasswordValueKey);

  bool get hasOldPasswordValidationMessage =>
      this.fieldsValidationMessages[OldPasswordValueKey]?.isNotEmpty ?? false;
  bool get hasNewPasswordValidationMessage =>
      this.fieldsValidationMessages[NewPasswordValueKey]?.isNotEmpty ?? false;
  bool get hasConfirmPasswordValidationMessage =>
      this.fieldsValidationMessages[ConfirmPasswordValueKey]?.isNotEmpty ??
      false;

  String? get oldPasswordValidationMessage =>
      this.fieldsValidationMessages[OldPasswordValueKey];
  String? get newPasswordValidationMessage =>
      this.fieldsValidationMessages[NewPasswordValueKey];
  String? get confirmPasswordValidationMessage =>
      this.fieldsValidationMessages[ConfirmPasswordValueKey];
}

extension Methods on FormViewModel {
  setOldPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[OldPasswordValueKey] = validationMessage;
  setNewPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NewPasswordValueKey] = validationMessage;
  setConfirmPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ConfirmPasswordValueKey] =
          validationMessage;
}
