import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../enums/dialog_type.dart';
import '../../../../models/branch.model.dart';
import '../../../../services/admin.service.dart';
import '../../../../utils/http_exception.dart';

class AdminBranchDetailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _adminService = locator<AdminService>();
  final _dialogService = locator<DialogService>();

  void navigateBack() => _navigationService.back();

  Future<void> showDeleteBranchDialog(String id) async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.DELETE_BRANCH_ACCOUNT,
      title: 'Delete Branch',
    );
    if (response?.data == 'DELETE_MERCHANT') {
      // await runBusyFuture(deleteBranch(branch.id!));
      runBusyFuture(deleteBranchTask(id));
    }
  }

  Future<List<Branch>> deleteBranchTask(id) async {
    setBusy(true);
    try {
      Branch branch = await _adminService.deleteBranch(id);
      //show toast
      Fluttertoast.showToast(
        msg: "Branch removed",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorManager.kDarkCharcoal,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return await _adminService.getBranches();
    } on DioError catch (e) {
      print('Error: ${e.response!.data}');
      Fluttertoast.showToast(
        msg: "An error occured",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorManager.kDarkCharcoal,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      throw HttpException(e.response!.data["message"]);
    } finally {
      setBusy(false);

      notifyListeners();
    }
  }
}
