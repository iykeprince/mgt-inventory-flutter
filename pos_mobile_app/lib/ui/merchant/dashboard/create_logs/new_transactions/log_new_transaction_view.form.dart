// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String AmountValueKey = 'amount';
const String BankChargeValueKey = 'bankCharge';
const String ServiceChargeValueKey = 'serviceCharge';
const String CommentValueKey = 'comment';
const String OtherValueKey = 'other';

final Map<String, TextEditingController>
    _LogNewTransactionViewTextEditingControllers = {};

final Map<String, FocusNode> _LogNewTransactionViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _LogNewTransactionViewTextValidations = {
  AmountValueKey: null,
  BankChargeValueKey: null,
  ServiceChargeValueKey: null,
  CommentValueKey: null,
  OtherValueKey: null,
};

mixin $LogNewTransactionView on StatelessWidget {
  TextEditingController get amountController =>
      _getFormTextEditingController(AmountValueKey);
  TextEditingController get bankChargeController =>
      _getFormTextEditingController(BankChargeValueKey);
  TextEditingController get serviceChargeController =>
      _getFormTextEditingController(ServiceChargeValueKey);
  TextEditingController get commentController =>
      _getFormTextEditingController(CommentValueKey);
  TextEditingController get otherController =>
      _getFormTextEditingController(OtherValueKey);
  FocusNode get amountFocusNode => _getFormFocusNode(AmountValueKey);
  FocusNode get bankChargeFocusNode => _getFormFocusNode(BankChargeValueKey);
  FocusNode get serviceChargeFocusNode =>
      _getFormFocusNode(ServiceChargeValueKey);
  FocusNode get commentFocusNode => _getFormFocusNode(CommentValueKey);
  FocusNode get otherFocusNode => _getFormFocusNode(OtherValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_LogNewTransactionViewTextEditingControllers.containsKey(key)) {
      return _LogNewTransactionViewTextEditingControllers[key]!;
    }
    _LogNewTransactionViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _LogNewTransactionViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_LogNewTransactionViewFocusNodes.containsKey(key)) {
      return _LogNewTransactionViewFocusNodes[key]!;
    }
    _LogNewTransactionViewFocusNodes[key] = FocusNode();
    return _LogNewTransactionViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    amountController.addListener(() => _updateFormData(model));
    bankChargeController.addListener(() => _updateFormData(model));
    serviceChargeController.addListener(() => _updateFormData(model));
    commentController.addListener(() => _updateFormData(model));
    otherController.addListener(() => _updateFormData(model));
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
          AmountValueKey: amountController.text,
          BankChargeValueKey: bankChargeController.text,
          ServiceChargeValueKey: serviceChargeController.text,
          CommentValueKey: commentController.text,
          OtherValueKey: otherController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        AmountValueKey: _getValidationMessage(AmountValueKey),
        BankChargeValueKey: _getValidationMessage(BankChargeValueKey),
        ServiceChargeValueKey: _getValidationMessage(ServiceChargeValueKey),
        CommentValueKey: _getValidationMessage(CommentValueKey),
        OtherValueKey: _getValidationMessage(OtherValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _LogNewTransactionViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey = validatorForKey(
        _LogNewTransactionViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller
        in _LogNewTransactionViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _LogNewTransactionViewFocusNodes.values) {
      focusNode.dispose();
    }

    _LogNewTransactionViewTextEditingControllers.clear();
    _LogNewTransactionViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get amountValue => this.formValueMap[AmountValueKey] as String?;
  String? get bankChargeValue =>
      this.formValueMap[BankChargeValueKey] as String?;
  String? get serviceChargeValue =>
      this.formValueMap[ServiceChargeValueKey] as String?;
  String? get commentValue => this.formValueMap[CommentValueKey] as String?;
  String? get otherValue => this.formValueMap[OtherValueKey] as String?;

  bool get hasAmount =>
      this.formValueMap.containsKey(AmountValueKey) &&
      (amountValue?.isNotEmpty ?? false);
  bool get hasBankCharge =>
      this.formValueMap.containsKey(BankChargeValueKey) &&
      (bankChargeValue?.isNotEmpty ?? false);
  bool get hasServiceCharge =>
      this.formValueMap.containsKey(ServiceChargeValueKey) &&
      (serviceChargeValue?.isNotEmpty ?? false);
  bool get hasComment =>
      this.formValueMap.containsKey(CommentValueKey) &&
      (commentValue?.isNotEmpty ?? false);
  bool get hasOther =>
      this.formValueMap.containsKey(OtherValueKey) &&
      (otherValue?.isNotEmpty ?? false);

  bool get hasAmountValidationMessage =>
      this.fieldsValidationMessages[AmountValueKey]?.isNotEmpty ?? false;
  bool get hasBankChargeValidationMessage =>
      this.fieldsValidationMessages[BankChargeValueKey]?.isNotEmpty ?? false;
  bool get hasServiceChargeValidationMessage =>
      this.fieldsValidationMessages[ServiceChargeValueKey]?.isNotEmpty ?? false;
  bool get hasCommentValidationMessage =>
      this.fieldsValidationMessages[CommentValueKey]?.isNotEmpty ?? false;
  bool get hasOtherValidationMessage =>
      this.fieldsValidationMessages[OtherValueKey]?.isNotEmpty ?? false;

  String? get amountValidationMessage =>
      this.fieldsValidationMessages[AmountValueKey];
  String? get bankChargeValidationMessage =>
      this.fieldsValidationMessages[BankChargeValueKey];
  String? get serviceChargeValidationMessage =>
      this.fieldsValidationMessages[ServiceChargeValueKey];
  String? get commentValidationMessage =>
      this.fieldsValidationMessages[CommentValueKey];
  String? get otherValidationMessage =>
      this.fieldsValidationMessages[OtherValueKey];
}

extension Methods on FormViewModel {
  setAmountValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AmountValueKey] = validationMessage;
  setBankChargeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BankChargeValueKey] = validationMessage;
  setServiceChargeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ServiceChargeValueKey] = validationMessage;
  setCommentValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CommentValueKey] = validationMessage;
  setOtherValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[OtherValueKey] = validationMessage;
}
