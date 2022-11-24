import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/dummy.widget/listtile_widget.dart';
import 'package:pos_mobile_app/enums/transaction_status.dart';
import 'package:pos_mobile_app/services/admin.service.dart';
import 'package:pos_mobile_app/services/transaction.service.dart';
import 'package:pos_mobile_app/ui/admin/history/history_view.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/font_styles.dart';
import 'package:pos_mobile_ui_package/utils/text_styles.dart';
import 'package:stacked/stacked.dart';

import '../../../models/branch.model.dart';
import '../../../models/transaction.model.dart';

class AdminHistoryViewModel extends BaseViewModel {
  final _adminService = locator<AdminService>();
  final _transactionService = locator<TransactionService>();
  String? _selectedValue;
  DateFilter? _selectedFilter;

  String? _selectedTransactionType;
  String? get selectedTransactionType => _selectedTransactionType;
  String? get selectedValue => _selectedValue;
  DateFilter? get selectedFilter => _selectedFilter;

  List<Branch>? get branches => _adminService.branches;

  List<Transaction>? get transactions => _transactionService.transactions;

  List<String> get transactionTypes => [
        'ALL',
        'DEPOSIT',
        'CARD_WITHDRAWAL',
        'TRANSFER_WITHDRAWAL',
      ];

  void handleSelectedTransactionType(String? value) {
    _selectedTransactionType = value;
    filterTransaction(df: selectedFilter!, type: value);
    notifyListeners();
  }

  handleSelectedValue(String? value) {
    _selectedValue = value;
    print('selected value: $value');
    Branch branch = branches!.firstWhere(
        (element) => element.name!.toLowerCase() == value!.toLowerCase());
    filterTransaction(
      df: selectedFilter!,
      branchId: branch.id,
    );
    notifyListeners();
  }

  setSelectedFilter(DateFilter filter) {
    _selectedFilter = filter;
    filterTransaction(df: filter);
    notifyListeners();
  }

  List<ListTileWidget> cardLists(BuildContext context) {
    return [];
  }

  void filterTransaction(
      {DateFilter? df, String? type, String? branchId}) async {
    DateTime startDate = df == null
        ? Moment.now().startOf(DurationUnit.day).toMoment()
        : Moment.now() -
            Duration(
                days: df.day ?? 0,
                hours: df.hour ?? 0,
                minutes: df.minute ?? 0,
                seconds: df.seconds ?? 0);

    DateTime endDate = DateTime.now();
    setBusy(true);
    notifyListeners();
    try {
      await _transactionService.getTransactions(
        start: startDate,
        end: endDate,
        type: type ?? "ALL",
        branchId: branchId,
        page: 1,
        pageSize: 20,
      );
    } on DioError catch (error) {
      print('error: ${error.response!.data['message']}');
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }
}
