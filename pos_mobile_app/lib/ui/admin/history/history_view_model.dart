import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/dummy.widget/listtile_widget.dart';
import 'package:pos_mobile_app/enums/transaction_status.dart';
import 'package:pos_mobile_app/services/admin.service.dart';
import 'package:pos_mobile_app/services/transaction.service.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/font_styles.dart';
import 'package:pos_mobile_ui_package/utils/text_styles.dart';
import 'package:stacked/stacked.dart';

import '../../../models/branch.model.dart';
import '../../../models/transaction.model.dart';

class AdminHistoryViewModel extends BaseViewModel {
  final _adminService = locator<AdminService>();
  String? _selectedValue;
  String? _selectedFilter;

  String? _selectedTransactionType;
  String? get selectedTransactionType => _selectedTransactionType;
  String? get selectedValue => _selectedValue;
  String? get selectedFilter => _selectedFilter;

  List<Branch>? get branches => _adminService.branches;

  List<Transaction>? get transactions => [
        // Transaction(
        //   accountId: "string",
        //   isDeduction: true,
        //   isCardWithdrawal: true,
        //   isTransferWithdrawal: true,
        //   id: "string",
        //   type: "string",
        //   other: "string",
        //   transactionId: "string",
        //   amount: 120,
        //   serviceCharge: 0,
        //   bankCharge: 0,
        //   serviceChargePaymentType: "string",
        //   merchantId: "string",
        //   branchId: "string",
        //   comment: "string",
        //   createdAt: DateTime.parse("2022-11-19T11:26:10.443Z"),
        //   updatedAt: DateTime.parse(
        //     "2022-11-19T11:26:10.443Z",
        //   ),
        // ),
        // Transaction(
        //   accountId: "string",
        //   isDeduction: true,
        //   isCardWithdrawal: true,
        //   isTransferWithdrawal: true,
        //   id: "string",
        //   type: TransactionStatus.CREDIT.toString(),
        //   other: "string",
        //   transactionId: "string",
        //   amount: 100,
        //   serviceCharge: 0,
        //   bankCharge: 0,
        //   serviceChargePaymentType: "string",
        //   merchantId: "string",
        //   branchId: "string",
        //   comment: "string",
        //   createdAt: DateTime.parse("2022-11-19T11:26:10.443Z"),
        //   updatedAt: DateTime.parse(
        //     "2022-11-19T11:26:10.443Z",
        //   ),
        // ),
        // Transaction(
        //   accountId: "string",
        //   isDeduction: true,
        //   isCardWithdrawal: true,
        //   isTransferWithdrawal: true,
        //   id: "string",
        //   type: TransactionStatus.CREDIT.toString(),
        //   other: "string",
        //   transactionId: "string",
        //   amount: 100,
        //   serviceCharge: 0,
        //   bankCharge: 0,
        //   serviceChargePaymentType: "string",
        //   merchantId: "string",
        //   branchId: "string",
        //   comment: "string",
        //   createdAt: DateTime.parse("2022-11-19T11:26:10.443Z"),
        //   updatedAt: DateTime.parse(
        //     "2022-11-19T11:26:10.443Z",
        //   ),
        // ),
        // Transaction(
        //   accountId: "string",
        //   isDeduction: true,
        //   isCardWithdrawal: true,
        //   isTransferWithdrawal: true,
        //   id: "string",
        //   type: TransactionStatus.CREDIT.toString(),
        //   other: "string",
        //   transactionId: "string",
        //   amount: 100,
        //   serviceCharge: 0,
        //   bankCharge: 0,
        //   serviceChargePaymentType: "string",
        //   merchantId: "string",
        //   branchId: "string",
        //   comment: "string",
        //   createdAt: DateTime.parse("2022-11-19T11:26:10.443Z"),
        //   updatedAt: DateTime.parse(
        //     "2022-11-19T11:26:10.443Z",
        //   ),
        // ),
        // Transaction(
        //   accountId: "string",
        //   isDeduction: true,
        //   isCardWithdrawal: true,
        //   isTransferWithdrawal: true,
        //   id: "string",
        //   type: TransactionStatus.CREDIT.toString(),
        //   other: "string",
        //   transactionId: "string",
        //   amount: 100,
        //   serviceCharge: 0,
        //   bankCharge: 0,
        //   serviceChargePaymentType: "string",
        //   merchantId: "string",
        //   branchId: "string",
        //   comment: "string",
        //   createdAt: DateTime.parse("2022-11-19T11:26:10.443Z"),
        //   updatedAt: DateTime.parse(
        //     "2022-11-19T11:26:10.443Z",
        //   ),
        // ),
      ];

  List<String> get transactionTypes => [
        'ALL',
        'DEPOSIT',
        'CARD_WITHDRAWAL',
        'TRANSFER_WITHDRAWAL',
      ];

  void handleSelectedTransactionType(String? value) {
    _selectedTransactionType = value;
    notifyListeners();
  }

  handleSelectedValue(value) {
    _selectedValue = value;
    notifyListeners();
  }

  setSelectedFilter(String filter) {
    _selectedFilter = filter;
    notifyListeners();
  }

  List<ListTileWidget> cardLists(BuildContext context) {
    return [];
  }
}
