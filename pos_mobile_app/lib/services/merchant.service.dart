import 'package:dio/dio.dart';
import 'package:pos_mobile_app/models/merchant-stat.model.dart';
import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';
import '../client/dio_client.dart';
import '../models/merchant.model.dart';
import '../models/opening_closing_balance.model.dart';

class MerchantService with ReactiveServiceMixin {
  Dio dioClient = locator<DioClient>().dio;

  MerchantService() {
    listenToReactiveValues([openingBalance, closingBalance]);
  }

  MerchantStat? _stat;
  final ReactiveValue<OpeningClosingBalance?> _openingBalance =
      ReactiveValue<OpeningClosingBalance?>(null);
  final ReactiveValue<OpeningClosingBalance?> _closingBalance =
      ReactiveValue<OpeningClosingBalance?>(null);

  OpeningClosingBalance? get openingBalance => _openingBalance.value;
  OpeningClosingBalance? get closingBalance => _closingBalance.value;
  MerchantStat? get stat => _stat;

  Future<void> getStat({
    DateTime? start,
    DateTime? end,
  }) async {
    String url = '/merchant/stat';

    if (start != null) {
      url += '?start=${start.toIso8601String()}';
    }
    if (end != null) {
      url += '&end=${end.toIso8601String()}';
    }
    var response = await dioClient.get(url);
    print('stat response data ${response.data}');
    MerchantStat statResponse = MerchantStat.fromJson(response.data);
    _stat = statResponse;
    notifyListeners();
    // return statResponse;
  }

  Future<Merchant> updateMerchant(Map formData) async {
    var response = await dioClient.put('/merchant/update', data: formData);
    Merchant merchant = Merchant.fromJson(response.data);

    return merchant;
  }

  Future<OpeningClosingBalance> createOpeningBalance(Map formData) async {
    var response = await dioClient.post(
      '/merchant/opening-balance',
      data: formData,
    );
    OpeningClosingBalance openingClosingBalance =
        OpeningClosingBalance.fromJson(response.data);

    return openingClosingBalance;
  }

  Future<OpeningClosingBalance> createClosingBalance(Map formData) async {
    var response = await dioClient.post(
      '/merchant/closing-balance',
      data: formData,
    );
    return OpeningClosingBalance.fromJson(response.data);
  }

  Future<void> getCurrentOpeningBalance(String branchId) async {
    var response =
        await dioClient.get('/merchant/opening-balance?branchId=$branchId');
    OpeningClosingBalance openingClosingBalance =
        OpeningClosingBalance.fromJson(response.data);
    _openingBalance.value = openingClosingBalance;
    notifyListeners();
  }

  Future<OpeningClosingBalance> getCurrentClosingBalance(
      String branchId) async {
    var response =
        await dioClient.get('/merchant/closing-balance?branchId=$branchId');
    OpeningClosingBalance openingClosingBalance =
        OpeningClosingBalance.fromJson(response.data);
    _closingBalance.value = openingClosingBalance;
    return openingClosingBalance;
  }
}
