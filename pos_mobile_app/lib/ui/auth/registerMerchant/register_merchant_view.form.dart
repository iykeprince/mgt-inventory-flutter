// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String EmailValueKey = 'email';

final Map<String, TextEditingController>
    _RegisterMerchantViewTextEditingControllers = {};

final Map<String, FocusNode> _RegisterMerchantViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _RegisterMerchantViewTextValidations = {
  EmailValueKey: null,
};

mixin $RegisterMerchantView on StatelessWidget {
  TextEditingController get emailController =>
      _getFormTextEditingController(EmailValueKey);
  FocusNode get emailFocusNode => _getFormFocusNode(EmailValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_RegisterMerchantViewTextEditingControllers.containsKey(key)) {
      return _RegisterMerchantViewTextEditingControllers[key]!;
    }
    _RegisterMerchantViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _RegisterMerchantViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_RegisterMerchantViewFocusNodes.containsKey(key)) {
      return _RegisterMerchantViewFocusNodes[key]!;
    }
    _RegisterMerchantViewFocusNodes[key] = FocusNode();
    return _RegisterMerchantViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    emailController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          EmailValueKey: emailController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        EmailValueKey: _getValidationMessage(EmailValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _RegisterMerchantViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_RegisterMerchantViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _RegisterMerchantViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _RegisterMerchantViewFocusNodes.values) {
      focusNode.dispose();
    }

    _RegisterMerchantViewTextEditingControllers.clear();
    _RegisterMerchantViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get emailValue => this.formValueMap[EmailValueKey] as String?;

  bool get hasEmail =>
      this.formValueMap.containsKey(EmailValueKey) &&
      (emailValue?.isNotEmpty ?? false);

  bool get hasEmailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey]?.isNotEmpty ?? false;

  String? get emailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey];
}

extension Methods on FormViewModel {
  setEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailValueKey] = validationMessage;
}
