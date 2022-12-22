import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:pos_mobile_app/services/shared.service.dart';
import 'package:pos_mobile_app/services/transaction.service.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/font_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../models/account.model.dart';
import '../../../../../models/merchant.model.dart';

class LogNewTransactionViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _transactionService = locator<TransactionService>();
  final _sharedService = locator<SharedService>();
  final _navigationService = locator<NavigationService>();

  TextEditingController amountController = TextEditingController();
  TextEditingController bankChargeController = TextEditingController();
  TextEditingController serviceChargeController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  List<String> get transactionTypes =>
      ["ALL", "CARD_WITHDRAWAL", "TRANSFER_WITHDRAWAL", "DEPOSIT"];

  Merchant? get merchant => _authenticationService.currentMerchantUser;
  List<Account>? get accounts => _sharedService.branchAccounts;

  Account? _selectedAccountDetail;
  Account? get selectedAccountDetail => _selectedAccountDetail;

  String? _selectedTransactionDate;
  String? get selectedTransactionDate => _selectedTransactionDate;
  String? _selectedTransactionType;
  String? get selectedTransactionType => _selectedTransactionType;
  String? _serviceChargePaymentMethod;
  String? get serviceChargePaymentMethod => _serviceChargePaymentMethod;

  Future createTransaction() async {
    runBusyFuture(createTransactionRequest());
  }

  Future createTransactionRequest() async {
    var formData = {
      "adminId": merchant!.adminId,
      "accountId": selectedAccountDetail!.id,
      "transactionType": selectedTransactionType,
      "other": "string",
      "amount": amountController.text,
      "bankCharge": bankChargeController.text,
      "serviceCharge": serviceChargeController.text,
      "serviceChargePaymentType": serviceChargePaymentMethod,
      "comment": commentController.text,
      "branchId": merchant!.branchId,
      "isDeduction": true,
      "isCardWithdrawal": false,
      "isTransferWithdrawal": false
    };
    setBusy(true);
    try {
      await _transactionService.createTransaction(formData);
      Fluttertoast.showToast(
        msg: 'Transaction created successfully!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: ColorManager.kDarkColor,
        textColor: ColorManager.kWhiteColor,
        fontSize: FontSize.s16,
      );
      _navigationService.back();
    } on DioError catch (error) {
      throw Exception(error.response!.data["message"]);
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  void handleSelectedAccountDetails(String? value) {
    _selectedAccountDetail = accounts!.firstWhere((element) =>
        element.accountDetail!.serviceProviderName!.toLowerCase() ==
        value!.toLowerCase());
  }

  handleSelectedDate(String value) {
    _selectedTransactionDate = value;
  }

  void handleSelectedTransactionType(String? value) {
    _selectedTransactionType = value;
  }

  void handleSelctedServiceChargePaymentMethod(String? value) {
    _serviceChargePaymentMethod = value;
  }
}
