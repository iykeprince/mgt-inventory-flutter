import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/enums/bottom_sheet_type.dart';
import 'package:pos_mobile_app/enums/dialog_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/admin.model.dart';
import '../../../models/branch.model.dart';
import '../../../models/merchant.model.dart';
import '../../../models/user.model.dart';
import '../../../services/admin.service.dart';
import '../../../services/authentication.service.dart';

class AdminDashboardViewModel extends BaseViewModel {
  final _authService = locator<AuthenticationService>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _adminService = locator<AdminService>();

  List<Branch>? get branches => _adminService.branches;
  List<Merchant>? get merchants => _adminService.merchants;

  User? get user => _authService.currentUser;
  Admin? get admin => _authService.currentAdminUser;

  Future<void> navigateToCreateMerchant() async =>
      _navigationService.navigateTo(Routes.createMerchantAccountView);
}
/**
 * 
 */