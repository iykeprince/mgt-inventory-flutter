import 'package:dio/dio.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/app/app.logger.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/models/user.model.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:pos_mobile_app/ui/onboarding/onboarding_view.dart';
import 'package:pos_mobile_app/utils/pos_contants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewViewModel extends BaseViewModel {
  final log = getLogger('MyViewModel');
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  runSplash() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final bool? isFirstTimeUser = preferences.getBool(IS_FIRST_TIME_USER);
    if (isFirstTimeUser != null && !isFirstTimeUser) {
      return _navigationService.replaceWith(Routes.authView);
    }
    Future.delayed(const Duration(seconds: 2), () {
      _navigationService.replaceWith(Routes.onboardView);
    });
  }

  // Future<User> getCurrentUser() async {

  // log.i('');
  // try {
  //   var response = await _authenticationService.getCurrentBaseUser();
  //   if (response == null) {
  //     log.i('Success Profile ${response.role}');

  //     // switch (response.role) {
  //     //   case "MERCHANT":
  //     //   case "ADMIN":
  //     //   case "SUPERADMIN":
  //     //     break;
  //     // }
  //   }
  //   return response;
  // } on DioError catch (error) {
  //   throw Exception(error.message);
  // }
  // }

  // @override
  // Future<User> futureToRun() => getCurrentUser();

  // @override
  // void onError(error) {
  //   log.e(error);
  //   //hello who are you
  //   log.i('Error e');

  // bool? isFirstTimeUser = _sharedPreferences.getBool(IS_FIRST_TIME_USER);
  // if (isFirstTimeUser == null) {
  // }
  // }
}
