import 'package:dio/dio.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/utils/http_exception.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../enums/bottom_sheet_type.dart';
import '../../enums/dialog_type.dart';
import '../../main.dart';
import '../../models/admin.model.dart';
import '../../models/branch.model.dart';
import '../../models/merchant.model.dart';
import '../../models/user.model.dart';
import '../../services/admin.service.dart';
import '../../services/authentication.service.dart';
import '../../utils/pos_contants.dart';

const String ADMIN_FETCH_BRANCH = "ADMIN_FETCH_BRANCH";
const String ADMIN_FETCH_MERCHANT = "ADMIN_FETCH_MERCHANT";

class AdminHomeViewModel extends IndexTrackingViewModel {
  final _authService = locator<AuthenticationService>();
  final _dialogService = locator<DialogService>();
  final _adminService = locator<AdminService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  bool _showBranches = false;
  bool get showBranches => _showBranches;
  User? get user => _authService.currentUser;
  Admin? get admin => _authService.currentAdminUser;

  List<Branch>? get branches => _adminService.branches;
  List<Merchant> get merchants => _adminService.merchants;

  Future<void> getCurrentUser() async {
    try {
      await _authService.getCurrentBaseUser();
      await _authService.getCurrentAdminUser();
      await messaging.subscribeToTopic('RECORD_BETA_NOTIFICATION_${admin!.id}');
    } on DioError catch (exception) {
      throw HttpException(exception.response!.data['message']);
    } finally {
      notifyListeners();
    }
  }

  fetchBranch() async {
    runBusyFuture(
      _adminService.getBranches(),
      busyObject: ADMIN_FETCH_BRANCH,
    );
  }

  fetchMerchants() async {
    runBusyFuture(
      fetchMerchantTask(),
      busyObject: ADMIN_FETCH_MERCHANT,
    );
  }

  fetchMerchantTask() async {
    try {
      return await _adminService.getMerchants();
    } on DioError catch (e) {
      print("error: ${e.response!.data['message']}'");
      throw HttpException(e.response!.data['message']);
    }
  }

  Future<void> navigateSwitchBranch() async {
    _showBranches = !_showBranches;
    notifyListeners();
    if (!busy(ADMIN_FETCH_BRANCH) && _adminService.branches!.isEmpty) {
      await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.createMerchant,
        title: "Merchant  Details",
        description:
            'You haven???t added branch details to your account yet.\n You need to add branch details in order to be able to register your merchants accounts.',
        mainButtonTitle: "Add Branch Details",
        secondaryButtonTitle: "Log New Transaction",
        useRootNavigator: true,
        ignoreSafeArea: true,
        // customData: switchBranch,

        // description:
        //     'This sheet is a custom built bottom sheet UI that allows you to show it from any service or viewmodel.',
        // mainButtonTitle: 'Awesome!',
        // secondaryButtonTitle: 'This is cool',
      );
      return;
    }
    var confirmationResponse = await _dialogService.showCustomDialog(
        variant: DialogType.SWITCH_BRANCH,
        title: "Switch Branch",
        description:
            'You haven???t added branch details to your account yet.\n You need to add branch details in order to be able to register your merchants accounts.',
        mainButtonTitle: "Add Branch Details",
        secondaryButtonTitle: "Log New Transaction",
        data: {
          BRANCHES: branches,
          SELECTED_BRANCH: _adminService.selectedBranch,
        });
    if (confirmationResponse?.data is bool && confirmationResponse?.data) {
      _showBranches = false;

      notifyListeners();
    }
    if (confirmationResponse?.data is Branch) {
      //selected branch do something with
      _showBranches = false;
      print(
          'confirm fresponse: ${(confirmationResponse?.data as Branch).toJson()}');
      notifyListeners();
    }
    if (confirmationResponse?.data is String &&
        confirmationResponse?.data == "ADD_NEW_BRANCH") {
      print('add new branch');
      _navigationService.navigateTo(Routes.addBranchView);
      _showBranches = false;
    }

    notifyListeners();
    /**
     * 
     */
  }
}
