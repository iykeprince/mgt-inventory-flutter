import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';

import '../../app/app.locator.dart';
import '../../models/admin.model.dart';
import '../../models/user.model.dart';
import '../../services/authentication.service.dart';

class AdminHomeViewModel extends IndexTrackingViewModel {
  final _authService = locator<AuthenticationService>();

  User? get user => _authService.currentUser;
  Admin? get admin => _authService.currentAdminUser;

  Future<void> getCurrentUser() async {
    try {
      await _authService.getCurrentBaseUser();
      await _authService.getCurrentAdminUser();
    } on DioError catch (exception) {
      throw Exception(exception);
    } finally {
      notifyListeners();
    }
  }
}
