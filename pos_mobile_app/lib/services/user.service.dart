import 'package:dio/dio.dart';
import 'package:pos_mobile_app/models/admin.model.dart';
import 'package:pos_mobile_app/models/default_response.model.dart';
import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';
import '../client/dio_client.dart';
import '../models/branch.model.dart';
import '../models/merchant.model.dart';

class UserService with ReactiveServiceMixin {
  Dio dioClient = locator<DioClient>().dio;

  Future<DefaultResponse> disableUser(String id) async {
    var response = await dioClient.put('/user/disable-user/$id');
    return DefaultResponse.fromJson(response.data);
  }

  Future<DefaultResponse> enableUser(String id) async {
    var response = await dioClient.put('/user/enable-user/$id');
    return DefaultResponse.fromJson(response.data);
  }
}
