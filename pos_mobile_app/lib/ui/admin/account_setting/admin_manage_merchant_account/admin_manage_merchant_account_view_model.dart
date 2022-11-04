import 'package:pos_mobile_app/enums/dialog_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../models/merchant.model.dart';
import '../../../../services/admin.service.dart';

class AdminManageMerchantAccountViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _adminService = locator<AdminService>();
  final _dialogService = locator<DialogService>();

  List<Merchant> get merchants => _adminService.merchants;

  void navigateBack() => _navigationService.back();

  Future<void> navigateToCreateMerchant() async =>
      _navigationService.navigateTo(Routes.createMerchantAccountView);

  Future<void> navigateToMerchantDetails() async =>
      _navigationService.navigateTo(Routes.adminMerchantDetailView);

  Future<void> showDeleteMerchantDialog() async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.DELETE_MERCHANT_ACCOUNT,
      title: 'Delete Merchant Account',
    );
    if (response?.data == 'DELETE_MERCHANT') {
      print('run delete fn');
    }
  }
}
