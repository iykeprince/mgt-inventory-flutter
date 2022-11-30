// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String BusinessNameValueKey = 'businessName';
const String EmailAddressValueKey = 'emailAddress';
const String NumberOfBranchesValueKey = 'numberOfBranches';
const String UserPasswordValueKey = 'userPassword';

final Map<String, TextEditingController>
    _CreateAdminBusinessViewTextEditingControllers = {};

final Map<String, FocusNode> _CreateAdminBusinessViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _CreateAdminBusinessViewTextValidations = {
  BusinessNameValueKey: null,
  EmailAddressValueKey: null,
  NumberOfBranchesValueKey: null,
  UserPasswordValueKey: null,
};

mixin $CreateAdminBusinessView on StatelessWidget {
  TextEditingController get businessNameController =>
      _getFormTextEditingController(BusinessNameValueKey);
  TextEditingController get emailAddressController =>
      _getFormTextEditingController(EmailAddressValueKey);
  TextEditingController get numberOfBranchesController =>
      _getFormTextEditingController(NumberOfBranchesValueKey);
  TextEditingController get userPasswordController =>
      _getFormTextEditingController(UserPasswordValueKey);
  FocusNode get businessNameFocusNode =>
      _getFormFocusNode(BusinessNameValueKey);
  FocusNode get emailAddressFocusNode =>
      _getFormFocusNode(EmailAddressValueKey);
  FocusNode get numberOfBranchesFocusNode =>
      _getFormFocusNode(NumberOfBranchesValueKey);
  FocusNode get userPasswordFocusNode =>
      _getFormFocusNode(UserPasswordValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_CreateAdminBusinessViewTextEditingControllers.containsKey(key)) {
      return _CreateAdminBusinessViewTextEditingControllers[key]!;
    }
    _CreateAdminBusinessViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CreateAdminBusinessViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CreateAdminBusinessViewFocusNodes.containsKey(key)) {
      return _CreateAdminBusinessViewFocusNodes[key]!;
    }
    _CreateAdminBusinessViewFocusNodes[key] = FocusNode();
    return _CreateAdminBusinessViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    businessNameController.addListener(() => _updateFormData(model));
    emailAddressController.addListener(() => _updateFormData(model));
    numberOfBranchesController.addListener(() => _updateFormData(model));
    userPasswordController.addListener(() => _updateFormData(model));
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
          BusinessNameValueKey: businessNameController.text,
          EmailAddressValueKey: emailAddressController.text,
          NumberOfBranchesValueKey: numberOfBranchesController.text,
          UserPasswordValueKey: userPasswordController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the dynamic
  void _updateValidationData(dynamic model) => model.setValidationMessages({
        BusinessNameValueKey: _getValidationMessage(BusinessNameValueKey),
        EmailAddressValueKey: _getValidationMessage(EmailAddressValueKey),
        NumberOfBranchesValueKey:
            _getValidationMessage(NumberOfBranchesValueKey),
        UserPasswordValueKey: _getValidationMessage(UserPasswordValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _CreateAdminBusinessViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey = validatorForKey(
        _CreateAdminBusinessViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller
        in _CreateAdminBusinessViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CreateAdminBusinessViewFocusNodes.values) {
      focusNode.dispose();
    }

    _CreateAdminBusinessViewTextEditingControllers.clear();
    _CreateAdminBusinessViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get businessNameValue =>
      this.formValueMap[BusinessNameValueKey] as String?;
  String? get emailAddressValue =>
      this.formValueMap[EmailAddressValueKey] as String?;
  String? get numberOfBranchesValue =>
      this.formValueMap[NumberOfBranchesValueKey] as String?;
  String? get userPasswordValue =>
      this.formValueMap[UserPasswordValueKey] as String?;

  bool get hasBusinessName =>
      this.formValueMap.containsKey(BusinessNameValueKey);
  bool get hasEmailAddress =>
      this.formValueMap.containsKey(EmailAddressValueKey);
  bool get hasNumberOfBranches =>
      this.formValueMap.containsKey(NumberOfBranchesValueKey);
  bool get hasUserPassword =>
      this.formValueMap.containsKey(UserPasswordValueKey);

  bool get hasBusinessNameValidationMessage =>
      this.fieldsValidationMessages[BusinessNameValueKey]?.isNotEmpty ?? false;
  bool get hasEmailAddressValidationMessage =>
      this.fieldsValidationMessages[EmailAddressValueKey]?.isNotEmpty ?? false;
  bool get hasNumberOfBranchesValidationMessage =>
      this.fieldsValidationMessages[NumberOfBranchesValueKey]?.isNotEmpty ??
      false;
  bool get hasUserPasswordValidationMessage =>
      this.fieldsValidationMessages[UserPasswordValueKey]?.isNotEmpty ?? false;

  String? get businessNameValidationMessage =>
      this.fieldsValidationMessages[BusinessNameValueKey];
  String? get emailAddressValidationMessage =>
      this.fieldsValidationMessages[EmailAddressValueKey];
  String? get numberOfBranchesValidationMessage =>
      this.fieldsValidationMessages[NumberOfBranchesValueKey];
  String? get userPasswordValidationMessage =>
      this.fieldsValidationMessages[UserPasswordValueKey];
}

extension Methods on FormViewModel {
  setBusinessNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BusinessNameValueKey] = validationMessage;
  setEmailAddressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailAddressValueKey] = validationMessage;
  setNumberOfBranchesValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NumberOfBranchesValueKey] =
          validationMessage;
  setUserPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[UserPasswordValueKey] = validationMessage;
}
