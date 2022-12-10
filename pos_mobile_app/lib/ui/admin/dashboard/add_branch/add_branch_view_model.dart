import 'package:dio/dio.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/services/admin.service.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../models/branch.model.dart';
import '../../../../utils/http_exception.dart';

class AddBranchViewModel extends BaseViewModel {
  final _adminService = locator<AdminService>();
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();

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
    };
    _createBranchForm = [...createBranchForm, newFormData];
    notifyListeners();
  }

  removeBranch(int index) {
    _createBranchForm.removeAt(index);
    notifyListeners();
  }

  saveBranchDetail() async {
    await runBusyFuture(runSaveBranchDetail());
  }

  Future<void> runSaveBranchDetail() async {
    var formDataList = _createBranchForm
        .map(
          (x) => ({
            "name": x['name'],
            "location": x['location'],
            "numberOfMerchants": int.parse(x['numOfMerchants']),
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
      _navigationService.navigateTo(Routes.adminHomeView);
    } on DioError catch (error) {
      throw HttpException(error.response?.data['message']);
    } finally {
      setBusy(false);
    }
  }

  void initialiseForm() {
    _createBranchForm = [];
    for (var i = 0; i < _authenticationService.initialNumberOfBranches; i++) {
      Map<String, dynamic> formData = {
        'idx': 1 + i,
      };
      _createBranchForm = [..._createBranchForm, formData];
    }
    notifyListeners();
  }
}
