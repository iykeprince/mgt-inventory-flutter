import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/enums/bottom_sheet_type.dart';
import 'package:pos_mobile_app/models/user.model.dart';
import 'package:pos_mobile_app/utils/pos_contants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../models/merchant.model.dart';
import '../../services/authentication.service.dart';

class MerchantHomeViewModel extends IndexTrackingViewModel {
  final _authService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();
  User? get user => _authService.currentUser;
  Merchant? get merchant => _authService.currentMerchantUser;

  bool _add = true;

  bool get add => _add;

  void toggleAddLogs() {
    _add = !_add;
    notifyListeners();
  }

  //Dashboard bottom sheet

  BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  Future<void> logSheet() async {
    navigateToLogNewExpense() =>
        _navigationService.navigateTo(Routes.logNewExpenseView);
    navigateToLogNewTransaction() =>
        _navigationService.navigateTo(Routes.logNewTransactionView);
    var confirmationResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.createLogs,
      mainButtonTitle: "Log New Expense",
      secondaryButtonTitle: "Log New Transaction",
      useRootNavigator: false,
      data: navigateToLogNewTransaction,
      customData: navigateToLogNewExpense,

      // description:
      //     'This sheet is a custom built bottom sheet UI that allows you to show it from any service or viewmodel.',
      // mainButtonTitle: 'Awesome!',
      // secondaryButtonTitle: 'This is cool',
    );
  }

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
        toggleAddLogs();
        logSheet();
        print('something between dashboard aonly');
        break;
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
