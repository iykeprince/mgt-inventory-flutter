import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

const String BUSINESS_NAME_VALIDATOR = 'BUSINESS_NAME_VALIDATOR';
const String EMAIL_VALIDATOR = 'EMAIL_VALIDATOR';
const String TERM_OF_USE_VALIDATOR = 'TERM_OF_USE_VALIDATOR';
const String SIGN_UP_WITH_EMAIL_OBJECT_KEY = 'sign-up-with-email-object-key';

class CreateAdminViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();

  String? _email;
  String? _businessName;
  String? get email => _email;
  String? get businessName => _businessName;
  bool? _tos = true;
  bool? get tos => _tos;

  navigateBack() => _navigationService.back();

  Future signUpWithEmail() async {
    await runBusyFuture(
      asyncSignUpWithEmail(),
      busyObject: SIGN_UP_WITH_EMAIL_OBJECT_KEY,
    );
  }

  Future asyncSignUpWithEmail() async {
    if (email == null || email!.isEmpty) {
      return setError(EMAIL_VALIDATOR);
    }
    // if (businessName == null || businessName!.isEmpty) {
    //   return setError(BUSINESS_NAME_VALIDATOR);
    // }
    if (tos == null || !tos!) {
      return setError(TERM_OF_USE_VALIDATOR);
    }

    setError(null);
    setBusy(true);
    var formData = {
      "email": email,
      "businessName": businessName,
      "numOfBranches": 1,
      "password": "password123"
    };
    try {
      print('hello');
      var response = await _authenticationService.register(formData);
      print('response: $response');
      _navigationService.navigateTo(Routes.verifyAdminView);
      // setMessage(response)

    } on DioError catch (error) {
      print('Error: ${error.response?.data["message"]}');
      throw Exception(error.response?.data);
    } finally {
      setBusy(false);
    }
  }

  void setEmail(String value) {
    _email = value;
  }

  void changeTos(bool value) {
    _tos = value;
    notifyListeners();
  }
}
