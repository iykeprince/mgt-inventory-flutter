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
import '../../../../../utils/pos_contants.dart';

class LogNewTransactionViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _transactionService = locator<TransactionService>();
  final _sharedService = locator<SharedService>();
  final _navigationService = locator<NavigationService>();

  TextEditingController amountController = TextEditingController();
  TextEditingController bankChargeController = TextEditingController();
  TextEditingController serviceChargeController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController otherController = TextEditingController();

  List<String> get transactionTypes => [
        "Transfer",
        "Withdrawal",
        "Airtime",
        "DSTV",
        "IKEDC",
        "GoTV",
        "Data",
        OTHER
      ];
  List<String> get serviceChargePayments => [CASH, CREDIT_CARD, TRANSFER];
  // ["ALL", "CARD_WITHDRAWAL", "TRANSFER_WITHDRAWAL", "DEPOSIT"];

  Merchant? get merchant => _authenticationService.currentMerchantUser;
  List<Account>? get accounts => _sharedService.branchAccounts;

  bool _showOtherInput = false;
  bool get showOtherInput => _showOtherInput;

  String? _selectedAccountDetailValue;
  String? get selectedAccountDetailValue => _selectedAccountDetailValue;
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
      "other": otherController.text,
      "amount": double.parse(amountController.text),
      "bankCharge": double.parse(bankChargeController.text),
      "serviceCharge": double.parse(serviceChargeController.text),
      "serviceChargePaymentType": serviceChargePaymentMethod,
      "comment": commentController.text,
      "branchId": merchant!.branchId,
      "isDeduction": true,
      "isCardWithdrawal": isCardWithrawal(serviceChargePaymentMethod),
      "isTransferWithdrawal": isTransferWithdrawal(serviceChargePaymentMethod)
    };
    print('form data: $formData');

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
      print('Error on transaction creation: ${error.response!.data}');
      throw Exception(error.response!.data["message"]);
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  void handleSelectedAccountDetails(String? value) {
    //'${model.selectedAccountDetail?.accountDetail?.serviceProviderName} - ${model.selectedAccountDetail?.accountDetail?.accountName} - ${model.selectedAccountDetail?.accountDetail?.accountNo}'
    print('selected account : $value');
    _selectedAccountDetailValue = value;
    notifyListeners();
    String name = value!.split(' - ')[0];
    print('name of the selected account provider: $name');
    _selectedAccountDetail = accounts!.firstWhere((element) =>
        element.accountDetail!.serviceProviderName!.toLowerCase() ==
        name.toLowerCase());
  }

  handleSelectedDate(String value) {
    _selectedTransactionDate = value;
    notifyListeners();
  }

  void handleSelectedTransactionType(String? value) {
    _selectedTransactionType = value;
    _showOtherInput = false;
    if (value == OTHER) {
      _showOtherInput = true;
    }

    notifyListeners();
  }

  void handleSelctedServiceChargePaymentMethod(String? value) {
    _serviceChargePaymentMethod = value;
    notifyListeners();
  }

  bool isCardWithrawal(String? serviceChargePaymentMethod) {
    if (serviceChargePaymentMethod == CREDIT_CARD) return true;
    return false;
  }

  bool isTransferWithdrawal(String? serviceChargePaymentMethod) {
    if (serviceChargePaymentMethod == TRANSFER) return true;
    return false;
  }
}
