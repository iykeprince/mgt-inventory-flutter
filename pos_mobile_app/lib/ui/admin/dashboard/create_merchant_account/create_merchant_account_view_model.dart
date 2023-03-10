import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../models/branch.model.dart';
import '../../../../models/merchant.model.dart';
import '../../../../services/admin.service.dart';
import '../../../../utils/http_exception.dart';

class CreateMerchantAccountViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _adminService = locator<AdminService>();

  String? _selectedValue;
  String? get selectedValue => _selectedValue;

  navigateBack() => _navigationService.back();

  List<Branch>? get branches => _adminService.branches;

  TextEditingController merchantNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController branchController = TextEditingController();

  String? get merchantName => merchantNameController.text;
  String? get email => emailController.text;
  String? get branch => branchController.text;

  void setBranch(String value) {
    _selectedValue = value;

    Branch foundBranch = branches!.firstWhere(
        (element) => element.name!.toLowerCase() == value.toLowerCase());
    branchController.text = foundBranch.id!;
    // print('selected branch id: ${branchController.text}');
    notifyListeners();
  }

  createMerchantAccount() async {
    await runBusyFuture(runCreateMerchant());
  }

  Future<List<Merchant>> runCreateMerchant() async {
    var formData = {"name": merchantName, "email": email, "branchId": branch};
    setBusy(true);
    try {
      await _adminService.createMerchantAccount(formData);
      List<Merchant> merchants = await _adminService.getMerchants();
      Fluttertoast.showToast(
        msg: "Merchant account created",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorManager.kDarkCharcoal,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      setMessage("Merchant account created successfully!");
      _navigationService.back();
      return merchants;
    } on DioError catch (error) {
      print('error: ${error.response?.data}');
      Fluttertoast.showToast(
        msg: error.response?.data['message'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorManager.kDarkCharcoal,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      throw HttpException(error.response?.data['message']);
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }
}
