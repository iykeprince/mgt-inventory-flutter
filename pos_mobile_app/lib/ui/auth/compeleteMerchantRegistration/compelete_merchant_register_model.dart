import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CompeleteMerchantRegisterModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  bool _obscurePassword = true;

  bool get obscurePassword => _obscurePassword;

  navigateBack() => _navigationService.back();
  navigateToHome() => _navigationService.navigateTo(Routes.homeView);

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }
}
