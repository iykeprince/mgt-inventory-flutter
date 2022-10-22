import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/models/user.model.dart';
import 'package:pos_mobile_app/utils/pos_contants.dart';
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

  void triggerAction() {
    switch (currentIndex) {
      case DASBHOARD_VIEW_INDEX:
      case HISTORY_VIEW_INDEX:
        print('something between dashboard and rport');
        break;
      case REPORT_VIEW_INDEX:
        print('Report view action is trigger');
        break;
      case PROFILE_VIEW_INDEX:
      default:
        print('profile thing');
    }
  }
}
