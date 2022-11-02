import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/enums/bottom_sheet_type.dart';
import 'package:pos_mobile_app/enums/dialog_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AdminDashboardViewModel extends BaseViewModel {
  //Dashboard bottom sheet

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

  DialogService _dialogService = locator<DialogService>();
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
