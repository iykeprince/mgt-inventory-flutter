import 'package:dio/dio.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:pos_mobile_app/ui/auth/login/login_view.form.dart';
import 'package:pos_mobile_app/utils/http_exception.dart';
import 'package:pos_mobile_app/utils/pos_contants.dart';
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

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();

  String? get emailAddress => emailValue;
  String? get password => passwordValue;
  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  login() async {
    print('login');
    runBusyFuture(runLogin(), busyObject: LOGIN_TASK_OBJECT);
  }

  Future runLogin() async {
    setBusy(true);

    var formData = {"email": emailAddress, "password": password};

    try {
      var response = await _authenticationService.login(formData);
      User user = await _authenticationService.getCurrentBaseUser();
      switch (user.role!) {
        case ADMIN:
          _navigationService.pushNamedAndRemoveUntil(Routes.adminHomeView);
          break;
        case MERCHANT:
        default:
          _navigationService.pushNamedAndRemoveUntil(Routes.merchantHomeView);
          break;
      }
      return response;
    } on DioError catch (error) {
      print('error: ${error.response?.data}');
      throw HttpException(error.response?.data["message"]);
    } finally {
      setBusy(false);
    }
  }

  navigateBack() => _navigationService.back();

  navigateToRegisterNow() => _navigationService.back();

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
    _isFormValid = true;
    if (emailValue == null) {
      _isFormValid = false;
      setEmailValidationMessage("Email address is required");
    }
    if (emailValue!.isEmpty) {
      _isFormValid = false;
      setEmailValidationMessage("Email address is required");
    }

    if (passwordValue == null) {
      _isFormValid = false;
      setPasswordValidationMessage("Password is required");
    }
    if (passwordValue!.isEmpty) {
      _isFormValid = false;
      setPasswordValidationMessage("Password is required");
    }
  }

  //  navigateToHome() => _navigationService.navigateTo(Routes.homeView);
}
