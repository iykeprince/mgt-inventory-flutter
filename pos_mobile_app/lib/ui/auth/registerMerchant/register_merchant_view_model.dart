import 'package:pos_mobile_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class RegisterMerchantViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateBack() => _navigationService.back();
  navigateToVerfiyMerchant() =>
      _navigationService.navigateTo(Routes.verifyMerchantView);
}
