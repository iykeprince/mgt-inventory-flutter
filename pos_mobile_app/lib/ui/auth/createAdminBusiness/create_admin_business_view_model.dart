import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:pos_mobile_app/ui/auth/createAdminBusiness/create_admin_business.form.dart';
import 'package:pos_mobile_app/ui/auth/login/login_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../utils/http_exception.dart';

const String BUSINESS_NAME_VALIDATOR = 'BUSINESS_NAME_VALIDATOR';
const String EMAIL_VALIDATOR = 'EMAIL_VALIDATOR';
const String NUM_OF_BRANCH_VALIDATOR = 'NUM_OF_BRANCH_VALIDATOR';
const String PASSWORD_VALIDATOR = 'PASSWORD_VALIDATOR';

class CreateAdminBusinessViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  bool _obscurePassword = true;
  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  bool get obscurePassword => _obscurePassword;

  // String? _businessName;
  // String? _emailAddress;
  // String? _numOfBranches;
  // String? _password;

  // String? get businessName => _businessName;
  // String? get emailAddress => _emailAddress;
  // String? get numOfBranches => _numOfBranches;
  // String? get password => _password;

  navigateBack() => _navigationService.back();

  navigateToCreateAccountSuccess() =>
      _navigationService.navigateTo(Routes.createAccountSuccessView);

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  // setBusinessName(String value) {
  //   _businessName = value;
  // }

  // setEmailAddress(String value) {
  //   _emailAddress = value;
  // }

  // setNumOfBranches(String value) {
  //   _numOfBranches = value;
  // }

  // setPassword(String value) {
  //   _password = value;
  // }

  createAdmin() async {
    runBusyFuture(runCreateAdminAccount());
  }

  Future runCreateAdminAccount() async {
    if (businessNameValue == null || businessNameValue!.isEmpty) {
      return setErrorForObject(
          BUSINESS_NAME_VALIDATOR, "business name is required");
    }
    setErrorForObject(BUSINESS_NAME_VALIDATOR, null);
    if (emailAddressValue == null || emailAddressValue!.isEmpty) {
      return setErrorForObject(EMAIL_VALIDATOR, "Email address is required");
    }
    setErrorForObject(EMAIL_VALIDATOR, null);
    if (numberOfBranchesValue == null || numberOfBranchesValue!.isEmpty) {
      return setErrorForObject(
          NUM_OF_BRANCH_VALIDATOR, "Number of branches is required");
    }
    setErrorForObject(NUM_OF_BRANCH_VALIDATOR, null);
    if (userPasswordValue == null || userPasswordValue!.isEmpty) {
      return setErrorForObject(PASSWORD_VALIDATOR, "Password is required");
    }
    setErrorForObject(PASSWORD_VALIDATOR, null);

    setBusy(true);

    var formData = {
      "email": emailAddressValue,
      "businessName": businessNameValue,
      "numOfBranches": int.parse(numberOfBranchesValue!),
      "password": userPasswordValue
    };

    try {
      var response = await _authenticationService.register(formData);
      _authenticationService
          .setInitialNumberOfBranches(int.parse(numberOfBranchesValue!));
      _navigationService.navigateTo(
        Routes.verifyAdminView,
        arguments: VerifyAdminViewArguments(email: emailAddressValue!),
      );
      return response;
    } on DioError catch (error) {
      throw HttpException(error.response?.data["message"]);
    } finally {
      setBusy(false);
    }
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
    _isFormValid = true;
    if (businessNameValue == null ||
        emailAddressValue == null ||
        userPasswordValue == null ||
        numberOfBranchesValue == null) {
      _isFormValid = false;
    }

    if (businessNameValue!.isEmpty ||
        emailAddressValue!.isEmpty ||
        userPasswordValue!.isEmpty ||
        numberOfBranchesValue!.isEmpty) {
      _isFormValid = false;
    }
  }
}
