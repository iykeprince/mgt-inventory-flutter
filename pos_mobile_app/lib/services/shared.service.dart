import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';
import '../client/dio_client.dart';
import '../models/account.model.dart';
import '../models/admin-stat.model.dart';

class SharedService with ReactiveServiceMixin {
  Dio dioClient = locator<DioClient>().dio;

  SharedService() {
    listenToReactiveValues([
      branchAccounts,
      selectedAccount,
      stat,
    ]);
  }

  AdminStat? _stat;
  final ReactiveValue<List<Account>?> _branchAccounts =
      ReactiveValue<List<Account>?>([]);
  final ReactiveValue<Account?> _selectedAccount =
      ReactiveValue<Account?>(null);

  AdminStat? get stat => _stat;

  List<Account>? get branchAccounts => _branchAccounts.value;
  Account? get selectedAccount => _selectedAccount.value;

  Future<List<Account>> getBranchAccounts(String branchId) async {
    var response = await dioClient.get('/admin/accounts/$branchId');
    List<Account> accounts = (response.data as List<dynamic>)
        .map((x) => Account.fromJson(x))
        .toList();
    _branchAccounts.value = accounts;
    return accounts;
  }

//Fetching stat by branch id
  Future<void> getStat(String? id) async {
    print('shared stat branch id: $id');
    var response = await dioClient.get('/admin/stat?branchId=$id');
    print('shared stat response data ${response.data}');
    AdminStat statResponse = AdminStat.fromJson(response.data);
    _stat = statResponse;
    notifyListeners();
  }

  void setSelectedAccount(Account? selectedAccount) {
    _selectedAccount.value = selectedAccount;
  }
}
