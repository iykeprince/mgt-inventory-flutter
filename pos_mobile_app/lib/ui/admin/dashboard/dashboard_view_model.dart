import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/enums/bottom_sheet_type.dart';
import 'package:pos_mobile_app/enums/dialog_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/admin.model.dart';
import '../../../models/user.model.dart';
import '../../../services/authentication.service.dart';

class AdminDashboardViewModel extends BaseViewModel {
  final _authService = locator<AuthenticationService>();
  final _dialogService = locator<DialogService>();

  User? get user => _authService.currentUser;
  Admin? get admin => _authService.currentAdminUser;

  BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  Future<void> createMerchantSheet() async {
    var confirmationResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.createMerchant,
      title: "Merchant  Details",
      description:
          'You haven’t added branch details to your account yet.\n You need to add branch details in order to be able to register your merchants accounts.',
      mainButtonTitle: "Add Branch Details",
      secondaryButtonTitle: "Log New Transaction",
      useRootNavigator: true,
      ignoreSafeArea: true,

      // description:
      //     'This sheet is a custom built bottom sheet UI that allows you to show it from any service or viewmodel.',
      // mainButtonTitle: 'Awesome!',
      // secondaryButtonTitle: 'This is cool',
    );
  }

  Future<void> switchBranch() async {
    var confirmationResponse = await _dialogService.showCustomDialog(
      variant: DialogType.SWITCH_BRANCH,
      title: "Merchant  Details",
      description:
          'You haven’t added branch details to your account yet.\n You need to add branch details in order to be able to register your merchants accounts.',
      mainButtonTitle: "Add Branch Details",
      secondaryButtonTitle: "Log New Transaction",

      // description:
      //     'This sheet is a custom built bottom sheet UI that allows you to show it from any service or viewmodel.',
      // mainButtonTitle: 'Awesome!',
      // secondaryButtonTitle: 'This is cool',
    );
  }
}
