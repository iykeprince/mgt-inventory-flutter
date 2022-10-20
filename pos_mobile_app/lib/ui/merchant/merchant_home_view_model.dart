import 'package:dio/dio.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/models/user.model.dart';
import 'package:stacked/stacked.dart';

import '../../models/merchant.model.dart';
import '../../services/authentication.service.dart';

class MerchantHomeViewModel extends IndexTrackingViewModel {
  final _authService = locator<AuthenticationService>();

  User? get user => _authService.currentUser;
  Merchant? get merchant => _authService.currentMerchantUser;

  Future<void> getCurrentUser() async {
    try {
      await _authService.getCurrentBaseUser();
      await _authService.getCurrentMerchantUser();
    } on DioError catch (exception) {
      throw Exception(exception);
    } finally {
      notifyListeners();
    }
  }
}
