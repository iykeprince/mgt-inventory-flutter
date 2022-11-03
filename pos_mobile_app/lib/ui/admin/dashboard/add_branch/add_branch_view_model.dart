import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/services/admin.service.dart';
import 'package:stacked/stacked.dart';

import '../../../../models/branch.model.dart';

class AddBranchViewModel extends BaseViewModel {
  final _adminService = locator<AdminService>();

  int _counter = 0;
  int get counter => _counter;
  List<Branch>? get branches => _adminService.branches;
  void navigateBack() {}

  addNewBranch() {
    _adminService.addBranch();
    notifyListeners();
  }

  saveBranchDetail() {}
}
