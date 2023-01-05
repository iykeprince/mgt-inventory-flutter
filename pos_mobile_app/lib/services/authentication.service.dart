import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/client/dio_client.dart';
import 'package:pos_mobile_app/models/admin.model.dart';
import 'package:pos_mobile_app/models/auth.model.dart';
import 'package:pos_mobile_app/models/default_response.model.dart';
import 'package:pos_mobile_app/models/merchant.model.dart';
import 'package:pos_mobile_app/models/user.model.dart';
import 'package:pos_mobile_app/utils/pos_contants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class AuthenticationService with ReactiveServiceMixin {
  Dio dioClient = locator<DioClient>().dio;

  AuthenticationService() {
    listenToReactiveValues([
      currentUser,
      currentMerchantUser,
      _currentAdminUser,
      _initialNumberOfBranches
    ]);
  }

  final ReactiveValue<User?> _currentBaseUser = ReactiveValue<User?>(null);
  final ReactiveValue<Merchant?> _currentMerchantUser =
      ReactiveValue<Merchant?>(null);
  final ReactiveValue<Admin?> _currentAdminUser = ReactiveValue<Admin?>(null);
  final ReactiveValue<int> _initialNumberOfBranches = ReactiveValue<int>(0);

  User? get currentUser => _currentBaseUser.value;
  Merchant? get currentMerchantUser => _currentMerchantUser.value;
  Admin? get currentAdminUser => _currentAdminUser.value;
  int get initialNumberOfBranches => _initialNumberOfBranches.value;

  void setInitialNumberOfBranches(int value) {
    _initialNumberOfBranches.value = value;
  }

  Future<bool> isAuthenticated() async {
    final preferences = await SharedPreferences.getInstance();
    String? accessToken = preferences.getString(AUTH_TOKEN_KEY);
    String? refreshToken = preferences.getString(AUTH_REFRESH_KEY);

    if (accessToken!.isEmpty || refreshToken!.isEmpty) {
      return false;
    } //to be removed

    bool isRefreshTokenExpired = JwtDecoder.isExpired(refreshToken);
    if (isRefreshTokenExpired) {
      return false;
    }

    return true;
  }

  Future<String> getLocalAuthRole() async {
    final preferences = await SharedPreferences.getInstance();
    String? accessToken = preferences.getString(AUTH_TOKEN_KEY);
    String? refreshToken = preferences.getString(AUTH_REFRESH_KEY);

    bool isAccessTokenExpired = JwtDecoder.isExpired(accessToken!);

    if (isAccessTokenExpired) {
      // try and request for another access token
      var response = await requestAccessTokenFromRefreshToken(refreshToken!);
      accessToken = response.accessToken;
    }
    return JwtDecoder.decode(accessToken)["role"];
  }

  Future<Auth> requestAccessTokenFromRefreshToken(String refreshToken) async {
    final preferences = await SharedPreferences.getInstance();
    var response = await dioClient.get(
      '/auth/token/refresh',
    );
    Auth auth = Auth.fromJson(response.data);

    preferences.setString(AUTH_TOKEN_KEY, auth.accessToken);
    preferences.setString(AUTH_REFRESH_KEY, auth.refreshToken);

    return auth;
  }

  Future<Auth> login(Map<String, dynamic> formData) async {
    final preferences = await SharedPreferences.getInstance();

    var response = await dioClient.post(
      '/auth/signin',
      data: formData,
    );
    Auth auth = Auth.fromJson(response.data);

    preferences.setString(AUTH_TOKEN_KEY, auth.accessToken);
    preferences.setString(AUTH_REFRESH_KEY, auth.refreshToken);
    return auth;
  }

  Future<Map<String, dynamic>> register(Map<String, dynamic> formData) async {
    var response = await dioClient.post(
      '/auth/signup-with-email',
      data: formData,
    );

    return response.data;
  }

  Future<DefaultResponse> verifyOtp(Map<String, String?> formData) async {
    final preferences = await SharedPreferences.getInstance();
    var response = await dioClient.post(
      '/auth/verify-user-email',
      data: formData,
    );

    DefaultResponse res = DefaultResponse.fromJson(response.data);
    preferences.setString(AUTH_TOKEN_KEY, res.accessToken!);
    preferences.setString(AUTH_REFRESH_KEY, res.refreshToken!);
    return res;
  }

  Future<User> getCurrentBaseUser() async {
    var response = await dioClient.get(
      '/user/me',
    );
    User authUser = User.fromJson(response.data);
    _currentBaseUser.value = authUser;
    // Todo: add to shared preferences...
    return authUser;
  }

  Future<Merchant> getCurrentMerchantUser() async {
    var response = await dioClient.get(
      '/merchant/profile',
    );
    Merchant merchant = Merchant.fromJson(response.data);
    _currentMerchantUser.value = merchant;
    //Todo: shared preferences..
    // print('merchant profile: ${merchant.toJson()}');
    return merchant;
  }

  Future<Admin?> getCurrentAdminUser() async {
    var response = await dioClient.get(
      '/admin/profile',
    );
    if (response.data is Map) {
      Admin? authUser = Admin.fromJson(response.data);
      _currentAdminUser.value = authUser;
      return authUser;
    } else {
      return null;
    }
  }

  Future<DefaultResponse> forgotPassword(Map<String, dynamic> formData) async {
    var response = await dioClient.post(
      '/auth/forgot-password',
      data: formData,
    );
    return DefaultResponse.fromJson(response.data);
  }

  Future<Auth> updateMerchantProfile(Map<String, dynamic> formData) async {
    final preferences = await SharedPreferences.getInstance();
    var response = await dioClient.post(
      "/auth/update",
      data: formData,
    );

    Auth auth = Auth.fromJson(response.data);

    preferences.setString(AUTH_TOKEN_KEY, auth.accessToken);
    return auth;
  }

  Future<User> checkEmail(Map<String, dynamic> formData) async {
    var response = await dioClient.post(
      "/auth/check-email",
      data: formData,
    );
    return User.fromJson(response.data);
  }

  Future<DefaultResponse> requestOTP(Map<String, dynamic> formData) async {
    var response = await dioClient.post(
      "/auth/request-otp",
      data: formData,
    );

    return DefaultResponse.fromJson(response.data);
  }

  Future<DefaultResponse> changePassword(Map<String, dynamic> formData) async {
    var response = await dioClient.post(
      '/user/change-password',
      data: formData,
    );
    return DefaultResponse.fromJson(response.data);
  }

  Future<void> logout() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString(AUTH_TOKEN_KEY, "");
  }
}
