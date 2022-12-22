import 'package:dio/dio.dart';
import 'package:pos_mobile_app/models/account.model.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../models/admin-stat.model.dart';
import '../../../../models/branch.model.dart';
import '../../../../services/admin.service.dart';
import '../../../../services/shared.service.dart';
import '../../../../utils/http_exception.dart';

class AccountDropdownViewModel extends BaseViewModel {
  final _sharedService = locator<SharedService>();

  String? _selectedValue = 'All POS';
  String? get selectedValue => _selectedValue;

  Account? _selectedAccount;
  Account? get selectedAccount => _selectedAccount;

  List<Account>? get accounts => _sharedService.branchAccounts;

  handleSelectedValue(String? value) async {
    print('value: $value');
    _selectedValue = value;
    notifyListeners();
    _selectedAccount = accounts?.firstWhere(
      (element) =>
          element.accountDetail?.serviceProviderName?.toLowerCase() ==
          value?.toLowerCase(),
    );
    _sharedService.setSelectedAccount(_selectedAccount);
    // await getStat();
  }

  getStat() async {
    runBusyFuture(getStatTask());
  }

  Future<void> getStatTask() async {
    try {
      setBusy(true);
      // AdminStat stat = await _adminService.getStat(selectedBranch?.id);
      // return stat;
    } on DioError catch (error) {
      throw HttpException(error.response!.data['message']);
    } finally {
      setBusy(false);
    }
  }
}
