import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/models/default_response.model.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../utils/http_exception.dart';

const String OTP_REQUEST = 'OTP_REQUEST';

class VerifyAdminViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();

  int? _endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;
  int? get endTime => _endTime;

  String? _otp;
  String? get otp => _otp;
  String _email = '';
  String get email => _email;

  setOTP(String value) {
    _otp = value;
  }

  goBack() => _navigationService.back();

  Future<void> verifyOTP() async {
    await runBusyFuture(runOtpTask());
  }

  Future runOtpTask() async {
    var formData = {"email": email, "token": otp};

    setBusy(true);
    try {
      var response = await _authenticationService.verifyOtp(formData);
      _navigationService.replaceWith(Routes.verifyAdminSuccessView);
      return response;
    } on DioError catch (error) {
      throw HttpException(error.response?.data["message"]);
    } finally {
      setBusy(false);
    }
  }

  Future requestOTP() async {
    await runBusyFuture(requestOTPTask(), busyObject: OTP_REQUEST);
  }

  Future<DefaultResponse> requestOTPTask() async {
    var formData = {"email": email};
    setBusyForObject(OTP_REQUEST, true);
    notifyListeners();
    try {
      var response = await _authenticationService.requestOTP(formData);
      await Fluttertoast.showToast(
        msg: response.message,
        gravity: ToastGravity.TOP,
        toastLength: Toast.LENGTH_LONG,
      );
      _endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;
      return response;
    } on DioError catch (error) {
      throw HttpException(error.response!.data['message']);
    } finally {
      setBusyForObject(OTP_REQUEST, false);
      notifyListeners();
    }
  }

  setEmail(String email) {
    _email = email;
  }
}
