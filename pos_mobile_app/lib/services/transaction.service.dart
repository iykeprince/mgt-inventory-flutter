import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';
import '../client/dio_client.dart';
import '../models/transaction.model.dart';

class TransactionService with ReactiveServiceMixin {
  Dio dioClient = locator<DioClient>().dio;

  TransactionService() {
    listenToReactiveValues([transactions]);
  }
  List<Transaction>? _filteredTransactions;
  final ReactiveValue<List<Transaction>?> _transactions =
      ReactiveValue<List<Transaction>?>([]);

  List<Transaction>? get transactions => _transactions.value;
  List<Transaction>? get filteredTransaction => _filteredTransactions;

  Future<Transaction> createTransaction(Map formData) async {
    var response = await dioClient.post(
      '/transaction/create',
      data: formData,
    );
    return Transaction.fromJson(response.data);
  }

  Future<List<Transaction>> getTransactions({
    int? page,
    int? pageSize,
    String? type,
    DateTime? start,
    DateTime? end,
    String? branchId,
  }) async {
    String url = "";

    url += "/transaction/admin?";

    if (page != null) {
      url += 'page=$page';
    }
    if (pageSize != null) {
      url += '&pageSize=$pageSize';
    }
    if (type != null) {
      url += '&type=$type';
    }
    if (start != null) {
      url += '&start=${start.toIso8601String()}';
    }
    if (end != null) {
      url += '&end=${end.toIso8601String()}';
    }
    if (branchId != null) {
      url += '&branchId=$branchId';
    }

    log('new url: $url');

    try {
      var response = await dioClient.get(url);

      List<Transaction> transactions = (response.data as List<dynamic>)
          .map((x) => Transaction.fromJson(x))
          .toList();
      _transactions.value = transactions;
      return transactions;
    } on DioError catch (err) {
      // ignore: use_rethrow_when_possible
      throw err;
    } finally {
      notifyListeners();
    }
  }

  Future<List<Transaction>> getMerchantTransactions() async {
    var response = await dioClient.get('/transaction/merchant');
    List<Transaction> transactions = (response.data as List<dynamic>)
        .map((x) => Transaction.fromJson(x))
        .toList();
    _transactions.value = transactions;
    return transactions;
  }

  Future<Transaction> deleteTransaction(String id) async {
    var response = await dioClient.delete('transaction/$id');
    return Transaction.fromJson(response.data);
  }

  Future<void> search(String value) async {
    _filteredTransactions = _transactions.value
        ?.where((element) => element.type!.contains(value))
        .toList();
    notifyListeners();
  }
}
