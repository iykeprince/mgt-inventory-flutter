import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/services/merchant.service.dart';
import 'package:stacked/stacked.dart';

import '../../../../services/transaction.service.dart';
import '../../../../utils/helpers.dart';

class FilterDrawerViewModel extends BaseViewModel {
  final _transactionService = locator<TransactionService>();
  final _merchantService = locator<MerchantService>();

  String? _from;
  String? _to;
  String? get from => _from;
  String? get to => _to;

  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  DateTime? _endDate;
  DateTime? get endDate => _endDate;

  String? _startDateError, _endDateError;
  String? get startDateError => _startDateError;
  String? get endDateError => _endDateError;

  handleFromDate(String value) {
    _from = value;
    DateTime dt = parseDate(value);
    _startDate = dt;
  }

  handleToDate(String value) {
    _to = value;
    DateTime dt = parseDate(value);
    _endDate = dt;
  }

  showResult(BuildContext context) async {
    if (_startDate == null) {
      _startDateError = "Starting date is required";
      notifyListeners();
      return;
    }
    if (_endDate == null) {
      _endDateError = "Starting date is required";
      notifyListeners();
      return;
    }

    await runBusyFuture(getMerchantTransaction());
    Navigator.pop(context);
  }

  Future getMerchantTransaction() async {
    try {
      await _merchantService.getReportStat(start: startDate, end: endDate);
      await _transactionService.getMerchantTransactions(
        start: startDate,
        end: endDate,
        page: 0,
        pageSize: 50,
      );
    } catch (e) {}
  }
}
