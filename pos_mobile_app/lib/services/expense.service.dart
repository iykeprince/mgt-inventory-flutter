import 'package:dio/dio.dart';
import 'package:pos_mobile_app/enums/transaction_status.dart';
import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';
import '../client/dio_client.dart';
import '../models/expense.model.dart';
import '../models/transaction.model.dart';

class ExpenseService with ReactiveServiceMixin {
  Dio dioClient = locator<DioClient>().dio;

  ExpenseService() {
    listenToReactiveValues([_expenses]);
  }
  final ReactiveValue<List<Expense>?> _expenses =
      ReactiveValue<List<Expense>?>([]);

  List<Expense>? get expenses => _expenses.value;

  Future<Expense> createExpense(Map formData) async {
    var response = await dioClient.post(
      '/expense',
      data: formData,
    );
    return Expense.fromJson(response.data);
  }

  Future<List<Expense>> getMerchantExpenses({
    int? page,
    int? pageSize,
    String? type,
    DateTime? start,
    DateTime? end,
    String? branchId,
  }) async {
    String url = "";

    url += "/expense/merchant?";

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

    print('new url: $url');

    try {
      var response = await dioClient.get(url);

      List<Expense> expenses = (response.data as List<dynamic>)
          .map((x) => Expense.fromJson(x))
          .toList();
      _expenses.value = expenses;
      return expenses;
    } on DioError catch (err) {
      print(err.response!.data);
      throw err;
    }
  }
}
