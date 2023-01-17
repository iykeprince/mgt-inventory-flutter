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

import '../../main.dart';

class SplashViewViewModel extends BaseViewModel {
  final log = getLogger('MyViewModel');
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    log.i('');

    String? routeName;

    bool isAuthenticated = await _authenticationService.isAuthenticated();
    print('isAuthenticated: $isAuthenticated');
    if (!isAuthenticated) {
      if (await getIsFirstTimeUser()) {
        _navigationService.replaceWith(Routes.onboardView);
        return;
      }
      _navigationService.replaceWith(Routes.loginView);
    } else {
      String authRole = await _authenticationService.getLocalAuthRole();
      print('ROLE: $authRole');

      log.i('Success Profile $authRole');
      switch (authRole) {
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
      _navigationService.clearStackAndShow(routeName!);
    }

    // } on DioError catch (error) {
    //   _navigationService.replaceWith(Routes.authView);
    // } finally {
    //   await _authenticationService.getCurrentBaseUser();
    // }
  }

  Future<bool> getIsFirstTimeUser() async {
    final preferences = await SharedPreferences.getInstance();
    bool? isFirstTime = preferences.getBool(IS_FIRST_TIME_USER);
    return isFirstTime ?? true;
  }
}
