import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/utils/pos_contants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();

  navigateToAuth() async {
    _navigator.replaceWith(Routes.authView);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(IS_FIRST_TIME_USER, false);
  }
}
