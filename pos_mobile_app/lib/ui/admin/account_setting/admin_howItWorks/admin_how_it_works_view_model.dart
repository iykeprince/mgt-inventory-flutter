import 'package:pos_mobile_ui_package/widgets/buttons/toggle_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class AdminHowItWorksViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  HowItWorksType? _selectedType;
  HowItWorksType? get selectedType => _selectedType;

  navigateBack() => _navigationService.back();

  handleItemSelected(HowItWorksType? value) {
    _selectedType = value;
    notifyListeners();
  }
}
