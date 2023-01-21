import 'package:dio/dio.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/enums/bottom_sheet_type.dart';
import 'package:pos_mobile_app/models/merchant-stat.model.dart';
import 'package:pos_mobile_app/models/merchant.model.dart';
import 'package:pos_mobile_app/models/opening_closing_balance.model.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:pos_mobile_app/services/merchant.service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.logger.dart';
import '../../../utils/http_exception.dart';

const String OPENING_BALANCE = 'OPENING_BALANCE';
const String CLOSING_BALANCE = 'CLOSING_BALANCE';

class DashboardViewModel extends ReactiveViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _merchantService = locator<MerchantService>();
  final log = getLogger('DashboardViewModel');

  Merchant? get merchant => _authenticationService.currentMerchantUser;
  OpeningClosingBalance? get openingBalance => _merchantService.openingBalance;
  OpeningClosingBalance? get closingBalance => _merchantService.closingBalance;
  MerchantStat? get stat => _merchantService.stat;

  String? _selectedValue;
  String? get selectedValue => _selectedValue;

  handleSelectedValue(value) {
    _selectedValue = value;
    notifyListeners();
  }

  BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  Future<void> openSheet() async {
    if (merchant != null) {
      getCurrentOpeningBalance();
      notifyListeners();
    }
    var confirmationResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.openBalance,
      title: 'This is a floating bottom sheet',
      description:
          'This sheet is a custom built bottom sheet UI that allows you to show it from any service or viewmodel.',
      mainButtonTitle: 'Awesome!',
      secondaryButtonTitle: 'This is cool',
    );
  }
  //  OpeningClosingBalance response = await   _merchantService.getCurrentOpeningBalance(merchant!.branch!.id!)

  Future<void> getCurrentUser() async {
    try {
      await _authenticationService.getCurrentBaseUser();
      await _authenticationService.getCurrentMerchantUser();
    } on DioError catch (exception) {
      throw HttpException(exception.response!.data['message']);
    } finally {
      notifyListeners();
    }
  }

  Future<void> getCurrentOpeningBalance() async {
    runBusyFuture(
      getCurrentOpeningBalanceRequest(),
      busyObject: OPENING_BALANCE,
    );
  }

  Future<void> getCurrentOpeningBalanceRequest() async {
    try {
      await _merchantService.getCurrentOpeningBalance(merchant!.branch!.id!);
    } on DioError catch (error) {
      // print('eror: ${error.response?.data["message"]}');
      log.i('Error of response: ${error.response?.data["message"]}');
      throw HttpException(error.response?.data["message"]);
    } finally {
      notifyListeners();
    }
  }

  Future<OpeningClosingBalance> getCurrentClosingBalance() async {
    setBusy(true);
    try {
      OpeningClosingBalance openingClosingBalance = await runBusyFuture(
        _merchantService.getCurrentClosingBalance(merchant!.branch!.id!),
        busyObject: CLOSING_BALANCE,
      );
      return openingClosingBalance;
    } on DioError catch (error) {
      throw Exception(error.response!.data["message"]);
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  Future<void> editOpeningBalance({double? amount, String? branchId}) async {
    var confirmationResponse = await _bottomSheetService
        .showCustomSheet(variant: BottomSheetType.openBalance, data: {
      'amount': amount,
      'branchId': branchId,
    });
  }

  Future<void> enterClosingBalance({double? amount, String? branchId}) async {
    var confirmationResponse = await _bottomSheetService
        .showCustomSheet(variant: BottomSheetType.closeBalance, data: {
      'amount': amount,
      'branchId': branchId,
    });
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_merchantService];
}
