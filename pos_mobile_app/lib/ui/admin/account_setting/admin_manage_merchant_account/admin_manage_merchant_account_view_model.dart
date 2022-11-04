import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../models/merchant.model.dart';
import '../../../../services/admin.service.dart';

class AdminManageMerchantAccountViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _adminService = locator<AdminService>();

  List<Merchant> get merchants => _adminService.merchants;

  void navigateBack() => _navigationService.back();

  Future<void> navigateToCreateMerchant() async =>
      _navigationService.navigateTo(Routes.createMerchantAccountView);
}
