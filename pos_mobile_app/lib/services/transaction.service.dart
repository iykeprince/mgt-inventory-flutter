import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';
import '../client/dio_client.dart';
import '../models/transaction.model.dart';

class TransactionService with ReactiveServiceMixin {
  Dio dioClient = locator<DioClient>().dio;

  TransactionService() {
    listenToReactiveValues([_transactions]);
  }
  final ReactiveValue<List<Transaction>?> _transactions =
      ReactiveValue<List<Transaction>?>([]);

  Future<Transaction> createTransaction(Map formData) async {
    var response = await dioClient.post(
      'transaction',
      data: formData,
    );
    return Transaction.fromJson(response.data);
  }

  Future<List<Transaction>> getTransactions(String? branchId) async {
    String url;
    if (branchId == null) {
      url = 'transaction/admin';
    } else {
      url = 'transaction/admin?branchId=$branchId';
    }
    try {
      var response = await dioClient.get(url);
      print('response data transactions: ${response.data}');
      // List<Transaction> transactions = (response.data as List<dynamic>)
      //     .map((x) => Transaction.fromJson(x))
      //     .toList();
      // _transactions.value = transactions;
      return [];
    } on DioError catch (err) {
      print(err.response!.data);
      throw err;
    }
  }

  Future<List<Transaction>> getMerchantTransactions() async {
    var response = await dioClient.get('transaction/merchant');
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
}
