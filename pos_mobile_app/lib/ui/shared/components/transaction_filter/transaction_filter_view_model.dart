import 'package:dio/dio.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:pos_mobile_app/ui/shared/components/transaction_filter/transaction_filter_view.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../models/date-filter.model.dart';
import '../../../../services/transaction.service.dart';

class TransactionFilterViewModel extends BaseViewModel {
  final _transactionService = locator<TransactionService>();

  DateFilter? _selectedFilter = DATE_FILTER_LIST[0];
  DateFilter? get selectedFilter => _selectedFilter;

  setSelectedFilter(DateFilter filter) {
    _selectedFilter = filter;
    filterTransaction(df: filter);
    notifyListeners();
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
