import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/ui/auth/createAdminBusiness/create_admin_business_view_model.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/authentication.service.dart';
import '../../../utils/http_exception.dart';

const String FULLNAME_VALIDATOR = 'BUSINESS_NAME_VALIDATOR';
const String EMAIL_VALIDATOR = 'EMAIL_VALIDATOR';
const String CONTACT_PHONE_VALIDATOR = 'CONTACT_PHONE_VALIDATOR';
const String PASSWORD_VALIDATOR = 'PASSWORD_VALIDATOR';
const String UPDATE_MERCHANT_PROFILE_TASK_OBJECT =
    'UPDATE_MERCHANT_PROFILE_TASK_OBJECT';

class CompeleteMerchantRegisterModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();

  bool _obscurePassword = true;

  bool get obscurePassword => _obscurePassword;

  String? _fullName;
  String? _emailAddress;
  String? _phone;
  String? _password;
  String? get fullName => _fullName;
  String? get emailAddress => _emailAddress;
  String? get phone => _phone;
  String? get password => _password;

  setFullName(String value) {
    _fullName = value;
  }

  setEmailAddress(String value) {
    _emailAddress = value;
  }

  setContactPhone(String value) {
    _phone = value;
  }

  setPassword(String value) {
    _password = value;
  }

  String? fullNameValidation(String? text) {
    if (text == null || text.isEmpty) {
      return "Fullname is empty!";
    }
    return null;
  }

  String? emailValidation(String? text) {
    if (text == null || text.isEmpty) {
      return "Email address is empty!";
    }
    return null;
  }

  String? phoneValidation(String? text) {
    if (text == null || text.isEmpty) {
      return "Phone number is required!";
    }
    return null;
  }

  String? passwordValidation(String? text) {
    if (text == null || text.isEmpty) {
      return "Password is empty!";
    }
    return null;
  }

  navigateBack() => _navigationService.back();
  navigateToHome() => _navigationService.navigateTo(Routes.merchantHomeView);

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  updateMerchantProfile() async {
    runBusyFuture(runUpdateMerchantProfile(),
        busyObject: UPDATE_MERCHANT_PROFILE_TASK_OBJECT);
  }

  Future runUpdateMerchantProfile() async {
    if (_fullName == null || _fullName!.isEmpty) {
      return setErrorForObject(FULLNAME_VALIDATOR, "fullname name is empty");
    }
    setErrorForObject(FULLNAME_VALIDATOR, null);
    // if (_emailAddress == null || _emailAddress!.isEmpty) {
    //   return setErrorForObject(EMAIL_VALIDATOR, "Email address is required");
    // }
    // setErrorForObject(EMAIL_VALIDATOR, null);

    if (_phone == null || _phone!.isEmpty) {
      return setErrorForObject(CONTACT_PHONE_VALIDATOR, "Phone is required");
    }
    setErrorForObject(CONTACT_PHONE_VALIDATOR, null);
    if (_password == null || _password!.isEmpty) {
      return setErrorForObject(PASSWORD_VALIDATOR, "Password is required");
    }
    setErrorForObject(PASSWORD_VALIDATOR, null);

    setBusy(true);

    var formData = {
      "name": fullName,
      "email": emailAddress,
      "contactPhone": phone,
      "password": password
    };
    print(formData);
    try {
      var response =
          await _authenticationService.updateMerchantProfile(formData);
      print('repsonse: ${response.accessToken}');
      _navigationService.navigateTo(
        Routes.merchantHomeView,
      );
      return response;
    } on DioError catch (error) {
      Fluttertoast.showToast(
        msg: "${error.response?.data["message"]}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorManager.kDarkCharcoal,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      throw HttpException(error.response?.data["message"]);
    } finally {
      setBusy(false);
    }
  }
}
