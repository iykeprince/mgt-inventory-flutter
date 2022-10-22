import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/enums/bottom_sheet_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends BaseViewModel {
  String? _selectedValue;
  String? get selectedValue => _selectedValue;

  handleSelectedValue(value) {
    _selectedValue = value;
    notifyListeners();
  }

  BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  Future<void> openSheet() async {
    var confirmationResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.openBalance,
      title: 'This is a floating bottom sheet',
      description:
          'This sheet is a custom built bottom sheet UI that allows you to show it from any service or viewmodel.',
      mainButtonTitle: 'Awesome!',
      secondaryButtonTitle: 'This is cool',
    );
  }
}
