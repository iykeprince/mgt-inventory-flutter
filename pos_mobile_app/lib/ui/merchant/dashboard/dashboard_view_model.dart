import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  String? _selectedValue;
  String? get selectedValue => _selectedValue;

  handleSelectedValue(value) {
    _selectedValue = value;
    notifyListeners();
  }
}
