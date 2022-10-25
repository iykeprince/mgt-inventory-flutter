import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pos_mobile_app/models/default_response.model.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/authentication.service.dart';
import 'package:fluttertoast/fluttertoast.dart';

const String CHANGE_PASSWORD_TASK = 'CHANGE_PASSWORD_TASK';

class ChangePasswordViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? get oldPassword => oldPasswordController.text;
  String? get newPassword => newPasswordController.text;
  String? get confirmPassword => confirmPasswordController.text;

  navigateBack() => _navigationService.back();

  changePassword() async {
    await runBusyFuture(runChangePassword(), busyObject: CHANGE_PASSWORD_TASK);
  }

  Future<DefaultResponse> runChangePassword() async {
    Map<String, dynamic> formData = {
      'oldPassword': oldPassword!.toString(),
      'newPassword': newPassword!.toString(),
      'confirmPassword': confirmPassword!.toString()
    };
    setBusy(true);
    try {
      var response = await _authService.changePassword(formData);
      print(response.toJson());
      //show toast
      Fluttertoast.showToast(
        msg: "Password successfully changed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorManager.kDarkCharcoal,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      setMessage("Passwrod was changed successfully!");
      _navigationService.back();
      return response;
    } on DioError catch (error) {
      throw Exception(error.response?.data["message"]);
    } finally {
      setBusy(false);
    }
  }
}
