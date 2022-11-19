import 'package:dio/dio.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/models/transaction.model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../services/transaction.service.dart';

class AdminTransactionViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _transactionService = locator<TransactionService>();

  String? _branchId;
  String? get branchId => _branchId;
  List<Transaction>? get transactions => [];

  getTransactions() async {
    runBusyFuture(getTransactionsTask());
  }

  Future<List<Transaction>> getTransactionsTask() async {
    try {
      List<Transaction> transactions =
          await _transactionService.getTransactions(branchId);
      return [];
    } on DioError catch (error) {
      print(error.response!.data['message']);
      throw Exception(error.response!.data['message']);
    }
  }

  void navigateBack() => _navigationService.back();
}
