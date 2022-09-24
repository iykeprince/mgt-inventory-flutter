import 'package:pos_mobile_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class AuthViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateToCreateAdmin() =>
      _navigationService.navigateTo(Routes.createAdminView);
  navigateToRegisterMerchant() =>
      _navigationService.navigateTo(Routes.registerMerchantView);

  navigateToLogin() => _navigationService.navigateTo(Routes.loginView);
}
