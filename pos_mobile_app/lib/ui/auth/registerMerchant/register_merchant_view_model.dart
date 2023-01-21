import 'package:dio/dio.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:pos_mobile_app/ui/auth/login/login_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../models/user.model.dart';
import '../../../utils/http_exception.dart';
import '../../../utils/pos_contants.dart';

class RegisterMerchantViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  bool _tos = true;
  String? _emailAddress;

  bool get tos => _tos;
  String? get emailAddress => _emailAddress;

  setEmailAddress(String email) {
    _emailAddress = email;
  }

  setTos(bool value) {
    _tos = value;
    notifyListeners();
  }

  navigateBack() => _navigationService.back();

  navigateToVerifyMerchant() async {
    runBusyFuture(runVerifyMerchant(), busyObject: VERIFY_MERCHANT_TASK_OBJECT);
  }

  Future runVerifyMerchant() async {
    if (_emailAddress == null || _emailAddress!.isEmpty) {
      return setErrorForObject(
          EMAIL_ADDRESS_VALIDATOR, "Email address is required");
    }
    setErrorForObject(EMAIL_ADDRESS_VALIDATOR, null);
    if (!_tos) {
      return setErrorForObject(
          TOS_VALIDATOR, "You need to accept the terms of use");
    }
    setErrorForObject(TOS_VALIDATOR, null);
    setBusy(true);
    var formData = {'email': emailAddress};
    try {
      User user = await _authenticationService.checkEmail(formData);
      if (user.role != MERCHANT) {
        throw HttpException(
            "Operation not allowed. Only merchant email address needed");
      }
      await _authenticationService.requestOTP(formData);
      _navigationService.navigateTo(
        Routes.verifyMerchantView,
        arguments: VerifyMerchantViewArguments(emailAddress: emailAddress!),
      );
      return user;
    } on DioError catch (error) {
      throw HttpException(error.response?.data["message"]);
    } finally {
      setBusy(false);
    }
  }

  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  @override
  void setFormStatus() {
    if (emailValue == "") {
      _isFormValid = false;
      return;
    }
    if (tos == false) {
      _isFormValid = false;
      return;
    }
    _isFormValid = true;
  }
}
