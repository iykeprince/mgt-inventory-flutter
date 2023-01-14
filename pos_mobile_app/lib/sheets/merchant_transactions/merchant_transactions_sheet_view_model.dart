import 'package:dio/dio.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:pos_mobile_app/enums/bottom_sheet_type.dart';
import 'package:pos_mobile_app/models/transaction.model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../models/date-filter.model.dart';
import '../../services/transaction.service.dart';

class MerchantTransactionsSheetViewModel extends ReactiveViewModel {
  final _transactionService = locator<TransactionService>();
  final _bottomSheetService = locator<BottomSheetService>();

  List<Transaction>? get transactions => _transactionService.transactions;

  List<String> get transactionTypes => [
        'ALL',
        'DEPOSIT',
        'CARD_WITHDRAWAL',
        'TRANSFER_WITHDRAWAL',
      ];

  String? _selectedTransactionType;
  String? get selectedTransactionType => _selectedTransactionType;

  void handleSelectedTransactionType(String? value) {
    _selectedTransactionType = value;
    // filterTransaction(df: selectedFilter!, type: value);
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

  bool _showSearch = false;
  bool get showSearch => _showSearch;
  void toggleSearch() {
    _showSearch = !_showSearch;
    notifyListeners();
  }

  void showTransactionDetail() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.merchantTransactionDetail,
      enterBottomSheetDuration: Duration(milliseconds: 300),
      exitBottomSheetDuration: Duration(milliseconds: 100),
    );
  }

  getMerchantTransaction() {
    runBusyFuture(
      getMerchantTransactionRequest(),
    );
  }

  getMerchantTransactionRequest() async {
    try {
      var response = await _transactionService.getMerchantTransactions();
      print('t Response: $response');
    } on DioError catch (e) {
      throw Exception(e.response!.data['message']);
    } finally {
      notifyListeners();
    }
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_transactionService];
}
