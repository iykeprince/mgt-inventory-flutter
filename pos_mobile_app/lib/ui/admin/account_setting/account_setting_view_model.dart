import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/models/admin.model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../models/user.model.dart';
import '../../../services/authentication.service.dart';

class AccountSettingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();

  User? get user => _authService.currentUser;
  Admin? get admin => _authService.currentAdminUser;

  navigateToEditProfile() =>
      _navigationService.navigateTo(Routes.adminEditProfileView);

  navigateToManageMerchantAccount() =>
      _navigationService.navigateTo(Routes.adminManageMerchantAccountView);

  navigateToHowItWorks() =>
      _navigationService.navigateTo(Routes.adminHowItWorksView);

  navigateToChangePassword() =>
      _navigationService.navigateTo(Routes.adminChangePasswordView);

  logout() async {
    await _authService.logout();
    _navigationService.pushNamedAndRemoveUntil(Routes.authView);
  }
}
