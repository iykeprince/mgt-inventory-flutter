// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String BranchNameValueKey = 'branchName';
const String LocationValueKey = 'location';
const String NumberOfMerchantsValueKey = 'numberOfMerchants';

final Map<String, TextEditingController>
    _SheetAddBranchBottomSheetTextEditingControllers = {};

final Map<String, FocusNode> _SheetAddBranchBottomSheetFocusNodes = {};

final Map<String, String? Function(String?)?>
    _SheetAddBranchBottomSheetTextValidations = {
  BranchNameValueKey: null,
  LocationValueKey: null,
  NumberOfMerchantsValueKey: null,
};

mixin $SheetAddBranchBottomSheet on StatelessWidget {
  TextEditingController get branchNameController =>
      _getFormTextEditingController(BranchNameValueKey);
  TextEditingController get locationController =>
      _getFormTextEditingController(LocationValueKey);
  TextEditingController get numberOfMerchantsController =>
      _getFormTextEditingController(NumberOfMerchantsValueKey);
  FocusNode get branchNameFocusNode => _getFormFocusNode(BranchNameValueKey);
  FocusNode get locationFocusNode => _getFormFocusNode(LocationValueKey);
  FocusNode get numberOfMerchantsFocusNode =>
      _getFormFocusNode(NumberOfMerchantsValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_SheetAddBranchBottomSheetTextEditingControllers.containsKey(key)) {
      return _SheetAddBranchBottomSheetTextEditingControllers[key]!;
    }
    _SheetAddBranchBottomSheetTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _SheetAddBranchBottomSheetTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_SheetAddBranchBottomSheetFocusNodes.containsKey(key)) {
      return _SheetAddBranchBottomSheetFocusNodes[key]!;
    }
    _SheetAddBranchBottomSheetFocusNodes[key] = FocusNode();
    return _SheetAddBranchBottomSheetFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    branchNameController.addListener(() => _updateFormData(model));
    locationController.addListener(() => _updateFormData(model));
    numberOfMerchantsController.addListener(() => _updateFormData(model));
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
          BranchNameValueKey: branchNameController.text,
          LocationValueKey: locationController.text,
          NumberOfMerchantsValueKey: numberOfMerchantsController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the dynamic
  void _updateValidationData(dynamic model) => model.setValidationMessages({
        BranchNameValueKey: _getValidationMessage(BranchNameValueKey),
        LocationValueKey: _getValidationMessage(LocationValueKey),
        NumberOfMerchantsValueKey:
            _getValidationMessage(NumberOfMerchantsValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _SheetAddBranchBottomSheetTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey = validatorForKey(
        _SheetAddBranchBottomSheetTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller
        in _SheetAddBranchBottomSheetTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _SheetAddBranchBottomSheetFocusNodes.values) {
      focusNode.dispose();
    }

    _SheetAddBranchBottomSheetTextEditingControllers.clear();
    _SheetAddBranchBottomSheetFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get branchNameValue =>
      this.formValueMap[BranchNameValueKey] as String?;
  String? get locationValue => this.formValueMap[LocationValueKey] as String?;
  String? get numberOfMerchantsValue =>
      this.formValueMap[NumberOfMerchantsValueKey] as String?;

  bool get hasBranchName => this.formValueMap.containsKey(BranchNameValueKey);
  bool get hasLocation => this.formValueMap.containsKey(LocationValueKey);
  bool get hasNumberOfMerchants =>
      this.formValueMap.containsKey(NumberOfMerchantsValueKey);

  bool get hasBranchNameValidationMessage =>
      this.fieldsValidationMessages[BranchNameValueKey]?.isNotEmpty ?? false;
  bool get hasLocationValidationMessage =>
      this.fieldsValidationMessages[LocationValueKey]?.isNotEmpty ?? false;
  bool get hasNumberOfMerchantsValidationMessage =>
      this.fieldsValidationMessages[NumberOfMerchantsValueKey]?.isNotEmpty ??
      false;

  String? get branchNameValidationMessage =>
      this.fieldsValidationMessages[BranchNameValueKey];
  String? get locationValidationMessage =>
      this.fieldsValidationMessages[LocationValueKey];
  String? get numberOfMerchantsValidationMessage =>
      this.fieldsValidationMessages[NumberOfMerchantsValueKey];
}

extension Methods on FormViewModel {
  setBranchNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BranchNameValueKey] = validationMessage;
  setLocationValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LocationValueKey] = validationMessage;
  setNumberOfMerchantsValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NumberOfMerchantsValueKey] =
          validationMessage;
}
