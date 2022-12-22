import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/models/default_response.model.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../utils/http_exception.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();

  String _email = '';
  String get email => _email;

  goBack() => _navigationService.back();

  Future<void> forgotPassword() async {
    await runBusyFuture(runForgotPasswordTask());
  }

  Future runForgotPasswordTask() async {
    var formData = {"email": email};

    setBusy(true);
    try {
      var response = await _authenticationService.forgotPassword(formData);
      Fluttertoast.showToast(
        msg: response.message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorManager.kDarkCharcoal,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      goBack();
      return response;
    } on DioError catch (error) {
      throw HttpException(error.response?.data["message"]);
    } finally {
      setBusy(false);
    }
  }

  setEmail(String email) {
    _email = email;
  }
}
