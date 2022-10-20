import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';
import '../client/dio_client.dart';
import '../models/merchant.model.dart';

class MerchantService with ReactiveServiceMixin {
  Dio dioClient = locator<DioClient>().dio;

  Future<Merchant> updateMerchant(Map formData) async {
    var response = await dioClient.put('/merchant/update', data: formData);
    Merchant merchant = Merchant.fromJson(response.data);

    return merchant;
  }
}
