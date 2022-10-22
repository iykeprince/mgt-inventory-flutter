import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/merchant.model.dart';
import '../../../models/user.model.dart';
import '../../../services/authentication.service.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();

  User? get user => _authService.currentUser;
  Merchant? get merchant => _authService.currentMerchantUser;

  navigateToEditProfile() =>
      _navigationService.navigateTo(Routes.editProfileView);

  navigateToHowItWorks() =>
      _navigationService.navigateTo(Routes.howItWorksView);

  navigateToChangePassword() =>
      _navigationService.navigateTo(Routes.changePasswordView);

  logout() async {
    await _authService.logout();
    _navigationService.pushNamedAndRemoveUntil(Routes.authView);
  }
}
