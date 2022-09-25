import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

const String BUSINESS_NAME_VALIDATOR = 'BUSINESS_NAME_VALIDATOR';
const String EMAIL_VALIDATOR = 'EMAIL_VALIDATOR';
const String NUM_OF_BRANCH_VALIDATOR = 'NUM_OF_BRANCH_VALIDATOR';
const String PASSWORD_VALIDATOR = 'PASSWORD_VALIDATOR';

class CreateAdminBusinessViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  bool _obscurePassword = true;

  bool get obscurePassword => _obscurePassword;

  String? _businessName;
  String? _emailAddress;
  String? _numOfBranches;
  String? _password;

  String? get businessName => _businessName;
  String? get emailAddress => _emailAddress;
  String? get numOfBranches => _numOfBranches;
  String? get password => _password;

  navigateBack() => _navigationService.back();

  navigateToCreateAccountSuccess() =>
      _navigationService.navigateTo(Routes.createAccountSuccessView);

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    print('obscure: $obscurePassword');
    notifyListeners();
  }

  setBusinessName(String value) {
    _businessName = value;
  }

  setEmailAddress(String value) {
    _emailAddress = value;
  }

  setNumOfBranches(String value) {
    _numOfBranches = value;
  }

  setPassword(String value) {
    _password = value;
  }

  createAdmin() async {
    runBusyFuture(runCreateAdminAccount());
  }

  Future runCreateAdminAccount() async {
    if (_businessName == null || _businessName!.isEmpty) {
      return setErrorForObject(
          BUSINESS_NAME_VALIDATOR, "business name is required");
    }
    setErrorForObject(BUSINESS_NAME_VALIDATOR, null);
    if (_emailAddress == null || _emailAddress!.isEmpty) {
      return setErrorForObject(EMAIL_VALIDATOR, "Email address is required");
    }
    setErrorForObject(EMAIL_VALIDATOR, null);
    if (_numOfBranches == null || _numOfBranches!.isEmpty) {
      return setErrorForObject(
          NUM_OF_BRANCH_VALIDATOR, "Number of branches is required");
    }
    setErrorForObject(NUM_OF_BRANCH_VALIDATOR, null);
    if (_password == null || _password!.isEmpty) {
      return setErrorForObject(PASSWORD_VALIDATOR, "Password is required");
    }
    setErrorForObject(PASSWORD_VALIDATOR, null);

    setBusy(true);

    var formData = {
      "email": emailAddress,
      "businessName": businessName,
      "numOfBranches": int.parse(numOfBranches!),
      "password": password
    };
    try {
      var response = await _authenticationService.register(formData);
      print('response: $response');
      _navigationService.navigateTo(
        Routes.verifyAdminView,
        arguments: VerifyAdminViewArguments(email: emailAddress!),
      );
      return response;
    } on DioError catch (error) {
      throw Exception(error.response?.data["message"]);
    } finally {
      setBusy(false);
    }
  }
}
