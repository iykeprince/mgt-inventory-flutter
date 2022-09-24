import 'package:pos_mobile_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class CreateAdminBusinessViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  bool obscurePassword = true;
  navigateBack() => _navigationService.back();

  navigateToCreateAccountSuccess() =>
      _navigationService.navigateTo(Routes.createAccountSuccessView);

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }
}
