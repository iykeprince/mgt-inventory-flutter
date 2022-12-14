import 'package:dio/dio.dart';
import 'package:pos_mobile_app/models/account.model.dart';
import 'package:pos_mobile_app/models/admin-stat.model.dart';
import 'package:pos_mobile_app/models/admin.model.dart';
import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';
import '../client/dio_client.dart';
import '../models/balance.model.dart';
import '../models/branch.model.dart';
import '../models/merchant.model.dart';

class AdminService with ReactiveServiceMixin {
  Dio dioClient = locator<DioClient>().dio;

  AdminService() {
    listenToReactiveValues([
      _branches,
      _merchants,
      _stat,
      _accountBalances,
      _accounts,
    ]);
  }
  final ReactiveValue<List<Branch>?> _branches =
      ReactiveValue<List<Branch>?>([]);
  final ReactiveValue<List<Merchant>> _merchants =
      ReactiveValue<List<Merchant>>([]);
  final ReactiveValue<List<Balance>> _accountBalances =
      ReactiveValue<List<Balance>>([]);
  final ReactiveValue<List<Account>> _accounts =
      ReactiveValue<List<Account>>([]);
  final ReactiveValue<AdminStat?> _stat = ReactiveValue<AdminStat?>(null);

  List<Branch>? get branches => _branches.value;
  List<Merchant> get merchants => _merchants.value;
  List<Balance> get accountBalances => _accountBalances.value;
  List<Account> get accounts => _accounts.value;
  AdminStat? get stat => _stat.value;

  Future<AdminStat> getStat(String? id) async {
    String url;
    if (id == null) {
      url = '/admin/stat';
    } else {
      url = '/admin/stat?branchId=$id';
    }
    var response = await dioClient.get(url);
    AdminStat statResponse = AdminStat.fromJson(response.data);
    _stat.value = statResponse;
    return statResponse;
  }

  Future<Admin> updateAdmin(Map formData) async {
    var response = await dioClient.put('/admin/update', data: formData);
    Admin admin = Admin.fromJson(response.data);

    return admin;
  }

  Future<List<Branch>> getBranches() async {
    var response = await dioClient.get('/admin/branches');
    List<Branch> branches = (response.data as List<dynamic>)
        .map((x) => Branch.fromJson(x))
        .toList();
    _branches.value = branches;
    return branches;
  }

  Future<Branch> createBranch(Map<String, dynamic> formData) async {
    var response = await dioClient.post('/admin/branches', data: formData);
    Branch branch = Branch.fromJson(response.data);
    _branches.value = [...?_branches.value, branch];
    return branch;
  }

  Future<Branch> updateBranch(String id, Map<String, dynamic> formData) async {
    var response = await dioClient.put('/admin/branches/$id', data: formData);
    return Branch.fromJson(response.data);
  }

  Future<Branch> deleteBranch(String id) async {
    var response = await dioClient.delete('/admin/branches/$id');
    return Branch.fromJson(response.data);
  }

  Future<List<Merchant>> getMerchants() async {
    var response = await dioClient.get('/admin/merchants');
    List<Merchant> merchants = (response.data as List<dynamic>)
        .map((x) => Merchant.fromJson(x))
        .toList();
    _merchants.value = merchants;
    print('merchants: ${_merchants.value}');
    return merchants;
  }

  Future<Merchant> createMerchantAccount(Map formData) async {
    var response = await dioClient.post('/merchant/create', data: formData);
    Merchant merchant = Merchant.fromJson(response.data);
    _merchants.value = [..._merchants.value, merchant];
    return merchant;
  }

  Future<Merchant> deleteMerchantAccount(String id) async {
    var response = await dioClient.delete('/merchant/remove/$id');

    Merchant merchant = Merchant.fromJson(response.data);

    return merchant;
  }

  Future<List<Account>> getAccounts() async {
    var response = await dioClient.get('/admin/accounts');
    List<Account> accounts = (response.data as List<dynamic>)
        .map((x) => Account.fromJson(x))
        .toList();
    _accounts.value = accounts;
    return accounts;
  }

  Future<Account> createAccount(Map formData) async {
    var response = await dioClient.post('/admin/add-account', data: formData);

    Account account = Account.fromJson(response.data);
    _accounts.value = [..._accounts.value, account];
    return account;
  }

  Future<Merchant> updateMerchantToBranch(
      String merchantId, String branchId) async {
    var response = await dioClient.put('/admin/set/m/b/$merchantId/$branchId');
    return Merchant.fromJson(response.data);
  }

  Future<Account> updateAccountToBranch(
      String accountId, String branchId) async {
    var response = await dioClient.put('/admin/set/a/b/$accountId/$branchId');
    return Account.fromJson(response.data);
  }

  Future<List<Balance>> getAccountBalances() async {
    var response = await dioClient.get('/admin/balances');
    List<Balance> accounts = (response.data as List<dynamic>)
        .map((x) => Balance.fromJson(x))
        .toList();
    _accountBalances.value = accounts;
    return accounts;
  }

  Future<Admin> deleteAdminAccount(String id) async {
    var response = await dioClient.delete('/admin/remove/$id');
    return Admin.fromJson(response.data);
  }
}
