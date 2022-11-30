import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pos_mobile_app/models/default_response.model.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/admin_change_password/admin_change_password_view.form.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/authentication.service.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../utils/http_exception.dart';

const String ADMIN_CHANGE_PASSWORD_TASK = 'ADMIN_CHANGE_PASSWORD_TASK';

class AdminChangePasswordViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();

  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  // TextEditingController oldPasswordController = TextEditingController();
  // TextEditingController newPasswordController = TextEditingController();
  // TextEditingController confirmPasswordController = TextEditingController();

  // String? get oldPassword => oldPasswordController.text;
  // String? get newPassword => newPasswordController.text;
  // String? get confirmPassword => confirmPasswordController.text;

  navigateBack() => _navigationService.back();

  changePassword() async {
    await runBusyFuture(
      runChangePassword(),
      busyObject: ADMIN_CHANGE_PASSWORD_TASK,
    );
  }

  Future<DefaultResponse> runChangePassword() async {
    Map<String, dynamic> formData = {
      'oldPassword': oldPasswordValue,
      'newPassword': newPasswordValue,
      'confirmPassword': confirmPasswordValue
    };
    setBusy(true);
    try {
      var response = await _authService.changePassword(formData);
      print(response.toJson());
      //show toast
      Fluttertoast.showToast(
        msg: "Password successfully changed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorManager.kDarkCharcoal,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      setMessage("Passwrod was changed successfully!");
      _navigationService.back();
      return response;
    } on DioError catch (error) {
      throw HttpException(error.response?.data["message"]);
    } finally {
      setBusy(false);
    }
  }

  @override
  void setFormStatus() {
    _isFormValid = true;

    if (oldPasswordValue == null ||
        newPasswordValue == null ||
        confirmPasswordValue == null) {
      _isFormValid = false;
    }

    if (oldPasswordValue!.isEmpty ||
        newPasswordValue!.isEmpty ||
        confirmPasswordValue!.isEmpty) {
      _isFormValid = false;
    }
  }
}
