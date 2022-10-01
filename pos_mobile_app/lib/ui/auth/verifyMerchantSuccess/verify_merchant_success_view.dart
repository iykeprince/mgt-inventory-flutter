import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VerifyMerchantSuccessViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateToCompeleteMerchantRegister() =>
      _navigationService.navigateTo(Routes.compeleteMerchantRegister);
}
