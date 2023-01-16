import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../app/app.locator.dart';
import '../../../../../models/account.model.dart';
import '../../../../../models/merchant.model.dart';
import '../../../../../models/opening_closing_balance.model.dart';
import '../../../../../services/authentication.service.dart';
import '../../../../../services/expense.service.dart';
import '../../../../../services/merchant.service.dart';
import '../../../../../services/shared.service.dart';
import '../../../../../services/transaction.service.dart';
import '../../../../../utils/pos_contants.dart';

class LogNewExpenseViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _expenseService = locator<ExpenseService>();
  final _sharedService = locator<SharedService>();
  final _navigationService = locator<NavigationService>();
  final _merchantService = locator<MerchantService>();

  TextEditingController expenseNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController serviceChargeController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController otherController = TextEditingController();

  List<String> _expenseTypes = ["Paper Purchase", "Date Renewal"];
  List<String> get expenseTypes => _expenseTypes;

  List<String> get paymentMethods => [CASH, CREDIT_CARD, TRANSFER];

  List<String> get transactionTypes =>
      ["ALL", "CARD_WITHDRAWAL", "TRANSFER_WITHDRAWAL", "DEPOSIT"];

  Merchant? get merchant => _authenticationService.currentMerchantUser;
  List<Account>? get accounts => _sharedService.branchAccounts;
  String? _selectedAccountDetailValue;
  String? get selectedAccountDetailValue => _selectedAccountDetailValue;
  Account? _selectedAccountDetail;
  Account? get selectedAccountDetail => _selectedAccountDetail;

  String? _selectedExpenseDate;
  String? get selectedExpenseDate => _selectedExpenseDate;
  String? _selectedExpenseType;
  String? get selectedExpenseType => _selectedExpenseType;
  String? _paymentMethod;
  String? get paymentMethod => _paymentMethod;

  OpeningClosingBalance? get openingBalance => _merchantService.openingBalance;

  Future createExpense() async {
    runBusyFuture(createExpenseRequest());
  }

  Future createExpenseRequest() async {
    if (openingBalance == null) {
      Fluttertoast.showToast(
        msg:
            'Operation not allowed. Please enter your opening balance before proceeding with log!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: ColorManager.kDarkColor,
        textColor: ColorManager.kWhiteColor,
        fontSize: FontSize.s16,
      );
      return;
    }

    var formData = {
      "name": expenseNameController.text,
      "type": selectedExpenseType,
      "amount": double.parse(amountController.text),
      "paymentMethod": paymentMethod,
      "comment": commentController.text,
      "branchId": merchant!.branch!.id!,
      "accountId": selectedAccountDetail?.id,
      "isDeduction": true,
      "other": otherController.text
    };
    print('form data: $formData');

    setBusy(true);
    try {
      await _expenseService.createExpense(formData);
      Fluttertoast.showToast(
        msg: 'Expense created successfully!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: ColorManager.kDarkColor,
        textColor: ColorManager.kWhiteColor,
        fontSize: FontSize.s16,
      );
      _navigationService.back();
    } on DioError catch (error) {
      print('${error.response?.data}');
      throw Exception(error.response!.data["message"]);
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  void handleSelectedAccountDetails(String? value) {
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
    _selectedExpenseDate = value;
  }

  void handleSelectedExpenseType(String? value) {
    _selectedExpenseType = value;
    notifyListeners();
  }

  void handleSelctedPaymentMethod(String? value) {
    _paymentMethod = value;
    notifyListeners();
  }
}
