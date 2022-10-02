import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

const String VERIFY_MERCHANT_TASK_OBJECT = 'VERIFY_MERCHANT_TASK_OBJECT';

class VerifyMerchantViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();

  String? _otp;
  String? get otp => _otp;
  String _email = '';
  String get email => _email;

  setOTP(String value) {
    _otp = value;
  }

  setEmailAddress(String value) {
    _email = value;
  }

  verifyOTP() async {
    runBusyFuture(runOtpTask(), busyObject: VERIFY_MERCHANT_TASK_OBJECT);
  }

  Future runOtpTask() async {
    var formData = {"email": email, "token": otp};

    setBusy(true);
    try {
      var response = await _authenticationService.verifyOtp(formData);
      _navigationService.replaceWith(Routes.verifyMerchantSuccessView);
      return response;
    } on DioError catch (error) {
      throw Exception(error.response?.data["message"]);
    } finally {
      setBusy(false);
    }
  }

  navigateToVerifySuccess() =>
      _navigationService.navigateTo(Routes.verifyMerchantSuccessView);
}
