import 'package:dio/dio.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/services/admin.service.dart';
import 'package:stacked/stacked.dart';

import '../../../../models/branch.model.dart';

class AddBranchViewModel extends BaseViewModel {
  final _adminService = locator<AdminService>();

  List<Branch>? get branches => _adminService.branches;
  List<Map<String, dynamic>> _createBranchForm = [];
  List<Map<String, dynamic>> get createBranchForm => _createBranchForm;

  void navigateBack() {}

  addNewBranch() {
    Map<String, dynamic> newFormData = {
      "idx": _createBranchForm.length + 1,
      "name": "",
      "location": "",
      "numOfMerchants": 0,
      "posName": "",
      "bankAccountDetail": ""
    };
    _createBranchForm = [...createBranchForm, newFormData];
    notifyListeners();
  }

  saveBranchDetail() async {
    await runBusyFuture(runSaveBranchDetail());
  }

  Future runSaveBranchDetail() async {
    var formDataList = _createBranchForm
        .map(
          (x) => ({
            "name": x['name'],
            "location": x['location'],
            "numberOfMerchants": int.parse(x['numOfMerchants'] ?? '0'),
            "isInit": branches!.isEmpty ? true : false
          }),
        )
        .toList();
    print('form data list: $formDataList');
    setBusy(true);
    try {
      var futures = formDataList
          .map((formData) async => await _adminService.createBranch(formData));
      var results = await Future.wait(futures);
      print('results: ${results.map((e) => e.toJson()).toList()}');
      return results;
    } on DioError catch (error) {
      throw Exception(error.response?.data['message']);
    } finally {
      setBusy(false);
    }
  }

  void initialiseForm() {
    _createBranchForm = [];
    for (var i = 0; i < branches!.length; i++) {
      Map<String, dynamic> formData = {'idx': 1 + i, ...branches![i].toJson()};
      _createBranchForm = [..._createBranchForm, formData];
    }
    notifyListeners();
  }
}
