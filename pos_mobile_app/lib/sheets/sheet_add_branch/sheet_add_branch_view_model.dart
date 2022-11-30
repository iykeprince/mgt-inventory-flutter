import 'package:dio/dio.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/services/admin.service.dart';
import 'package:pos_mobile_app/sheets/sheet_add_branch/sheet_add_branch_view.form.dart';
import 'package:pos_mobile_app/utils/http_exception.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/src/models/overlay_response.dart';

import '../../models/branch.model.dart';

class SheetAddBranchViewModel extends FormViewModel {
  final _adminService = locator<AdminService>();

  List<Branch>? get branches => _adminService.branches;
  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  @override
  void setFormStatus() {
    _isFormValid = true;
    // TODO: implement setFormStatus
    if (branchNameValue == null ||
        locationValue == null ||
        numberOfMerchantsValue == null) {
      _isFormValid = false;
    }

    if (branchNameValue!.isEmpty ||
        locationValue!.isEmpty ||
        numberOfMerchantsValue!.isEmpty) {
      _isFormValid = false;
    }
  }

  createBranch(Function(SheetResponse p1)? completer) async {
    await runBusyFuture(createBranchRequest());
    completer!(SheetResponse(confirmed: true));
  }

  createBranchRequest() async {
    setBusy(true);
    var formData = {
      "name": branchNameValue,
      "location": locationValue,
      "numberOfMerchants": int.parse(numberOfMerchantsValue ?? '0'),
      "isInit": branches!.isEmpty ? true : false
    };

    try {
      await _adminService.createBranch(formData);
    } on DioError catch (e) {
      throw HttpException(e.response!.data['message']);
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }
}
