import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/enums/bottom_sheet_type.dart';
import 'package:pos_mobile_app/services/admin.service.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../enums/dialog_type.dart';
import '../../../../models/branch.model.dart';
import '../../../../utils/http_exception.dart';

class AdminManageBranchViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _adminService = locator<AdminService>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  List<Branch>? get branches => _adminService.branches;

  void navigateBack() => _navigationService.back();
  void navigateToBranchDetail(Branch branchItem) =>
      _navigationService.navigateTo(
        Routes.adminBranchDetailView,
        arguments: AdminBranchDetailViewArguments(branch: branchItem),
      );

  navigateToCreateBranch() async {
    await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.addBranch);
    notifyListeners();
  }

  // _navigationService.navigateTo(Routes.addBranchView);

  Future<void> showDeleteBranchDialog(Branch branch) async {
    print('delete ${branch.toJson()}');
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.DELETE_BRANCH_ACCOUNT,
      title: 'Delete Branch',
    );
    if (response!.confirmed) {
      await runBusyFuture(deleteBranch(branch.id!));
    }
  }

  Future<List<Branch>> deleteBranch(id) async {
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
      throw HttpException(e.response!.data);
    } finally {
      setBusy(false);

      notifyListeners();
    }
  }
}
