import 'package:dio/dio.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/app/app.logger.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/models/user.model.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:pos_mobile_app/utils/pos_contants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewViewModel extends FutureViewModel<void> {
  final log = getLogger('MyViewModel');
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future<void> getCurrentUser() async {
    log.i('');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final bool? isFirstTimeUser = preferences.getBool(IS_FIRST_TIME_USER);
    if (isFirstTimeUser != null && isFirstTimeUser) {
      return _navigationService.replaceWith(Routes.onboardView);
    }

    String? routeName;
    try {
      User response = await _authenticationService.getCurrentBaseUser();

      log.i('Success Profile ${response.id}');
      switch (response.role) {
        case "MERCHANT":
          routeName = Routes.merchantHomeView;
          break;
        case "ADMIN":
          routeName = Routes.adminHomeView;
          break;
        case "SUPERADMIN":
        default:
          break;
      }
      _navigationService.replaceWith(routeName!);
    } on DioError catch (error) {
      _navigationService.replaceWith(Routes.authView);
    }
  }

  @override
  Future<void> futureToRun() => getCurrentUser();

  @override
  void onError(error) {
    log.e(error);
    //hello who are you
    log.i('Error e');
  }
}
