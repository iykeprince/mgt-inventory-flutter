import 'package:dio/dio.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/models/transaction.model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../services/transaction.service.dart';
import '../../../../utils/http_exception.dart';

class AdminTransactionViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _transactionService = locator<TransactionService>();

  String? _branchId;
  String? get branchId => _branchId;
  List<Transaction>? get transactions => _transactionService.transactions;

  getTransactions() async {
    runBusyFuture(getTransactionsTask());
  }

  Future<List<Transaction>> getTransactionsTask() async {
    try {
      setBusy(true);
      List<Transaction> transactions =
          await _transactionService.getTransactions(
        type: 'ALL',
        page: 1,
        pageSize: 30,
      );
      return transactions;
    } on DioError catch (error) {
      print(error.response!.data['message']);
      throw HttpException(error.response!.data['message']);
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  void navigateBack() => _navigationService.back();
}
