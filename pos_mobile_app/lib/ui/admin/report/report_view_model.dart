import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/services/admin.service.dart';
import 'package:stacked/stacked.dart';

import '../../../models/admin-stat.model.dart';
import '../../../models/branch.model.dart';

class AdminReportViewModel extends BaseViewModel {
  final _adminService = locator<AdminService>();

  String? _selectedFilter;

  String? _selectedTransactionType;
  String? get selectedTransactionType => _selectedTransactionType;
  String? get selectedFilter => _selectedFilter;

  //  AdminStat? _stat;
  AdminStat? get stat => _adminService.stat;

  setSelectedFilter(String filter) {
    _selectedFilter = filter;
    notifyListeners();
  }
}
