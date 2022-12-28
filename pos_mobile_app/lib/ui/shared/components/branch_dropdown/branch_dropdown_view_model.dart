import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../models/admin-stat.model.dart';
import '../../../../models/branch.model.dart';
import '../../../../services/admin.service.dart';
import '../../../../utils/http_exception.dart';

class BranchDropdownViewModel extends BaseViewModel {
  final _adminService = locator<AdminService>();

  String? _selectedValue = 'All';
  String? get selectedValue =>
      _adminService.selectedBranch?.name ?? _selectedValue;

  Branch? _selectedBranch;
  Branch? get selectedBranch => _selectedBranch;

  List<Branch>? get branches => _adminService.branches;

  handleSelectedValue(String? value) async {
    print('value: $value');
    _selectedValue = value;
    notifyListeners();
    _selectedBranch = branches?.firstWhere(
      (element) => element.name?.toLowerCase() == value?.toLowerCase(),
    );
    _adminService.setSelectedBranch(_selectedBranch);
    await getStat();
  }

  getStat() async {
    runBusyFuture(getStatTask());
  }

  Future<AdminStat?> getStatTask() async {
    try {
      setBusy(true);
      await _adminService.getStat(selectedBranch?.id);
    } on DioError catch (error) {
      throw HttpException(error.response!.data['message']);
    } finally {
      setBusy(false);
    }
  }
}
