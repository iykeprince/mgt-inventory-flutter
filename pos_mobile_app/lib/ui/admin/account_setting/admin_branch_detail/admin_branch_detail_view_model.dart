import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile_app/models/merchant.model.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../enums/dialog_type.dart';
import '../../../../models/account.model.dart';
import '../../../../models/branch.model.dart';
import '../../../../services/admin.service.dart';
import '../../../../utils/http_exception.dart';

const String CREATE_ACCOUNT_REQUEST = 'CREATE_ACCOUNT_REQUEST';
const String UPDATE_FORM_REQUEST = 'UPDATE_FORM_REQUEST';

class AdminBranchDetailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _adminService = locator<AdminService>();
  final _dialogService = locator<DialogService>();

  final TextEditingController locationController = TextEditingController();

  List<Merchant> _selectedMerchants = [];
  List<Merchant> get selectedMerchants => _selectedMerchants;

  List<Merchant>? get merchants => _adminService.merchants;
  List<Account>? get accounts => _adminService.accounts;

  bool _isEditMode = false;
  bool get isEditMode => _isEditMode;

  setSelectedMerchantItem(String? value) {
    Merchant foundMerchant =
        merchants!.firstWhere((element) => element.name!.contains(value!));

    _selectedMerchants = [..._selectedMerchants, foundMerchant];
  }

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

  void editForm() {
    _isEditMode = true;
    notifyListeners();
  }

  updateForm() async {
    runBusyFuture(updateFormRequest(), busyObject: UPDATE_FORM_REQUEST);
  }

  Future<void> updateFormRequest() async {
    if (locationController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Location field is required",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorManager.kDarkCharcoal,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
//continue here
    // await _adminService.updateBranch()
    _isEditMode = false;
    print('update');
    notifyListeners();
  }

  Future<void> fetchAccounts() async {
    runBusyFuture(fetchAccountTask());
  }

  Future<void> fetchAccountTask() async {
    setBusy(true);
    try {
      await _adminService.getAccounts();
    } on DioError catch (e) {
      print('Error: ${e.response!.data}');
      Fluttertoast.showToast(
        msg: "An error occured fetching accounts",
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

  Future<void> showDialogCreatePOSAccount() async {
    var response = await _dialogService.showCustomDialog(
        variant: DialogType.CREATE_POS_ACCOUNT);
    notifyListeners();
    // if (response!.confirmed) {
    //   Map<String, dynamic> formData = response.data;
    //   runBusyFuture(createAccount(formData, "POS"));
    // }
  }

  Future<void> showDialogCreateBankAccount() async {
    var response = await _dialogService.showCustomDialog(
        variant: DialogType.CREATE_BANK_ACCOUNT);
    notifyListeners();
    // if (response!.confirmed) {
    //   Map<String, dynamic> formData = response.data;
    //   runBusyFuture(createAccount(formData, "BANK"));
    // }
  }

  //Create account
  Map<String, dynamic> formData = {
    "serviceProviderName": "",
    "accountName": "",
    "accountNo": ""
  };

  handleProviderName(String? value) {
    formData["serviceProviderName"] = value;
  }

  handleAccountName(String? value) {
    formData["accountName"] = value;
  }

  handleAccountNumber(String? value) {
    formData["accountNo"] = value;
  }

  Future createAccount(
      String accountType, Function(DialogResponse) completer) async {
    setBusyForObject(CREATE_ACCOUNT_REQUEST, true);
    try {
      var postData = {
        "accountDetail": {
          ...formData,
        },
        "accountType": accountType,
      };
      var response = await _adminService.createAccount(postData);
      print('response: ${response.accountDetail!.toJson()}');
    } on DioError catch (e) {
      throw Exception(e.response!.data["message"]);
    } finally {
      setBusyForObject(CREATE_ACCOUNT_REQUEST, false);
      completer(DialogResponse(confirmed: true));
    }
  }
}
