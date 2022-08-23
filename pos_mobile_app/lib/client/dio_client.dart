import 'package:dio/dio.dart';
import 'package:pos_mobile_app/utils/pos_contants.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://pos-web-app.herokuapp.com',
      connectTimeout: 15000,
      // receiveTimeout: 3000,
    ),
  )..interceptors.add(BearerTokenInterceptor());

  Dio get dio => _dio;
}

class BearerTokenInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    final sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString(AUTH_TOKEN_KEY) != null) {
      options.headers['Authorization'] =
          'Bearer ${sharedPreferences.getString(AUTH_TOKEN_KEY)}';
      print('OPTIONS: ${options.toString()}');
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    return super.onError(err, handler);
  }
}
