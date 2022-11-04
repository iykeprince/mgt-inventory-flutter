import 'package:dio/dio.dart';
import 'package:pos_mobile_app/models/admin.model.dart';
import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';
import '../client/dio_client.dart';
import '../models/branch.model.dart';
import '../models/merchant.model.dart';

class AdminService with ReactiveServiceMixin {
  Dio dioClient = locator<DioClient>().dio;

  AdminService() {
    listenToReactiveValues([_branches, _merchants]);
  }
  final ReactiveValue<List<Branch>?> _branches =
      ReactiveValue<List<Branch>?>([]);
  final ReactiveValue<List<Merchant>> _merchants =
      ReactiveValue<List<Merchant>>([]);

  List<Branch>? get branches => _branches.value;
  List<Merchant> get merchants => _merchants.value;

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
    print('response.data: ${response.data}');
    Merchant merchant = Merchant.fromJson(response.data);

    return merchant;
  }
}
