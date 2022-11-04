import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile_app/enums/dialog_type.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../models/merchant.model.dart';
import '../../../../services/admin.service.dart';

const String DELETING_MERCHANT_TASK = 'DELETING_MERCHANT_TASK';

class AdminManageMerchantAccountViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _adminService = locator<AdminService>();
  final _dialogService = locator<DialogService>();

  List<Merchant> get merchants => _adminService.merchants;

  void navigateBack() => _navigationService.back();

  Future<void> navigateToCreateMerchant() async {
    await _navigationService.navigateTo(Routes.createMerchantAccountView);
    notifyListeners();
    print('calling from back');
  }

  Future<void> navigateToMerchantDetails() async =>
      _navigationService.navigateTo(Routes.adminMerchantDetailView);

  Future<void> showDeleteMerchantDialog(Merchant merchant) async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.DELETE_MERCHANT_ACCOUNT,
      title: 'Delete Merchant Account',
    );
    if (response?.data == 'DELETE_MERCHANT') {
      await runBusyFuture(deleteMerchantAccount(merchant.id!));
    }
  }

  Future<List<Merchant>> deleteMerchantAccount(id) async {
    setBusy(true);
    try {
      Merchant merchant = await _adminService.deleteMerchantAccount(id);
      //show toast
      Fluttertoast.showToast(
        msg: "Merchant account removed",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorManager.kDarkCharcoal,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return await _adminService.getMerchants();
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
      throw Exception(e.response!.data);
    } finally {
      setBusy(false);

      notifyListeners();
    }
  }
}
