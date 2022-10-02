import 'package:dio/dio.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../enums/role.enum.dart';
import '../../../models/auth.model.dart';
import '../../../models/user.model.dart';

const String EMAIL_VALIDATOR = 'EMAIL_VALIDATOR';
const String PASSWORD_VALIDATOR = 'PASSWORD_VALIDATOR';
const String LOGIN_TASK_OBJECT = 'LOGIN_TASK_OBJECT';
const String ADMIN = 'ADMIN';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();

  String? _emailAddress;
  String? _password;

  String? get emailAddress => _emailAddress;
  String? get password => _password;

  setEmailAddress(String value) {
    _emailAddress = value;
  }

  setPassword(String value) {
    _password = value;
  }

  login() async {
    runBusyFuture(runLogin(), busyObject: LOGIN_TASK_OBJECT);
  }

  Future runLogin() async {
    if (_emailAddress == null || _emailAddress!.isEmpty) {
      return setErrorForObject(EMAIL_VALIDATOR, "Email address is required");
    }
    setErrorForObject(EMAIL_VALIDATOR, null);

    if (_password == null || _password!.isEmpty) {
      return setErrorForObject(PASSWORD_VALIDATOR, "Password is required");
    }
    setErrorForObject(PASSWORD_VALIDATOR, null);

    setBusy(true);

    var formData = {"email": emailAddress, "password": password};

    try {
      var response = await _authenticationService.login(formData);
      User user = await _authenticationService.getCurrentBaseUser();

      if (user.role! == ADMIN) {
        _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
      }
      return response;
    } on DioError catch (error) {
      print('error: ${error.response?.data["message"]}');
      throw Exception(error.response?.data["message"]);
    } finally {
      setBusy(false);
    }
  }

  navigateBack() => _navigationService.back();

  navigateToRegisterNow() => _navigationService.back();

  //  navigateToHome() => _navigationService.navigateTo(Routes.homeView);
}
