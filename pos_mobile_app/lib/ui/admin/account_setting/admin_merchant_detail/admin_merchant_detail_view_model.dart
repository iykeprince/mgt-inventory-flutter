import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../models/user.model.dart';
import '../../../../services/admin.service.dart';
import '../../../../services/authentication.service.dart';
import '../../../../services/user.service.dart';
import '../../../../utils/http_exception.dart';

const String REVOKE_MERCHANT_ACCESS_TASK = 'REVOKE_MERCHANT_ACCESS_TASK';
const String ENABLE_MERCHANT_ACCESS_TASK = 'ENABLE_MERCHANT_ACCESS_TASK';

class AdminMerchantDetailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _adminService = locator<AdminService>();
  final _dialogService = locator<DialogService>();
  final _userService = locator<UserService>();
  final _authenticationService = locator<AuthenticationService>();

  User? _user;
  User? get user => _user;

  void navigateBack() => _navigationService.back();

  Future<void> revokeMerchantAccess(String id) async {
    runBusyFuture(
      revokeMerchantAccessTask(id),
      busyObject: REVOKE_MERCHANT_ACCESS_TASK,
    );
  }

  Future<User?> revokeMerchantAccessTask(String id) async {
    setBusyForObject(REVOKE_MERCHANT_ACCESS_TASK, true);
    try {
      await _userService.disableUser(id);
      _user = await _authenticationService.getCurrentBaseUser();
      return _user;
    } on DioError catch (error) {
      throw HttpException(error.response?.data);
    } finally {
      setBusyForObject(REVOKE_MERCHANT_ACCESS_TASK, false);
      notifyListeners();
    }
  }

  Future<void> enableMerchantAccess(String id) async {
    runBusyFuture(
      enableMerchantAccessTask(id),
      busyObject: ENABLE_MERCHANT_ACCESS_TASK,
    );
  }

  Future<User?> enableMerchantAccessTask(String id) async {
    setBusyForObject(ENABLE_MERCHANT_ACCESS_TASK, true);
    try {
      await _userService.enableUser(id);
      _user = await _authenticationService.getCurrentBaseUser();
      return _user;
    } on DioError catch (error) {
      throw HttpException(error.response?.data["message"]);
    } finally {
      setBusyForObject(ENABLE_MERCHANT_ACCESS_TASK, false);
      notifyListeners();
    }
  }
}
