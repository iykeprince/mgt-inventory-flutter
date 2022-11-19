import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/services/admin.service.dart';
import 'package:stacked/stacked.dart';

import '../../../models/admin-stat.model.dart';
import '../../../models/branch.model.dart';

class AdminReportViewModel extends BaseViewModel {
  final _adminService = locator<AdminService>();

  String? _selectedValue;
  String? _selectedFilter;

  String? _selectedTransactionType;
  String? get selectedTransactionType => _selectedTransactionType;
  String? get selectedValue => _selectedValue;
  String? get selectedFilter => _selectedFilter;

  //  AdminStat? _stat;
  AdminStat? get stat => _adminService.stat;

  List<Branch>? get branches => _adminService.branches;

  handleSelectedValue(value) {
    _selectedValue = value;
    notifyListeners();
  }

  setSelectedFilter(String filter) {
    _selectedFilter = filter;
    notifyListeners();
  }
}
