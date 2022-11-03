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
    listenToReactiveValues([_branches]);
  }
  final ReactiveValue<List<Branch>?> _branches =
      ReactiveValue<List<Branch>?>([]);
  List<Branch>? get branches => _branches.value;

  Future<Admin> updateAdmin(Map formData) async {
    var response = await dioClient.put('/admin/update', data: formData);
    Admin admin = Admin.fromJson(response.data);

    return admin;
  }

  Future<List<Branch>> getBranches() async {
    var response = await dioClient.get('/admin/branches');
    print('body: ${response.data}');
    List<Branch> branches = (response.data as List<dynamic>)
        .map((x) => Branch.fromJson(x))
        .toList();
    _branches.value = branches;
    return branches;
  }
}
