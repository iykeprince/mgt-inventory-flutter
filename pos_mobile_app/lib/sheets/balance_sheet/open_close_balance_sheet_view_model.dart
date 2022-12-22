import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../models/account.model.dart';
import '../../models/merchant.model.dart';
import '../../models/opening_closing_balance.model.dart';
import '../../services/authentication.service.dart';
import '../../services/merchant.service.dart';
import '../../services/shared.service.dart';
import '../../ui/merchant/dashboard/dashboard_view_model.dart';

class OpeningClosingBalanceSheetViewModel extends BaseViewModel {
  final _sharedService = locator<SharedService>();
  final _merchantService = locator<MerchantService>();
  final _authenticationService = locator<AuthenticationService>();

  Merchant? get merchant => _authenticationService.currentMerchantUser;

  TextEditingController cashController = TextEditingController();
  List<TextEditingController> controllers = [];

  List<Account>? get accounts => _sharedService.branchAccounts;

  Future createOpeningBalance(Function(SheetResponse p1)? completer) async {
    await runBusyFuture(createOpeningBalanceRequest(),
        busyObject: OPENING_BALANCE);
    completer!(
      SheetResponse(
        confirmed: true,
      ),
    );
  }

  Future createClosingBalance(Function(SheetResponse p1)? completer) async {
    await runBusyFuture(createClosingBalanceRequest(),
        busyObject: CLOSING_BALANCE);
    completer!(
      SheetResponse(
        confirmed: true,
      ),
    );
  }

  Future<OpeningClosingBalance> createOpeningBalanceRequest() async {
    if (merchant == null) {
      throw Exception("No merchant available");
    }
    setBusy(true);
    var formData = {
      "amount": double.parse(cashController.text),
      "branchId": merchant!.branch!.id
    };
    try {
      OpeningClosingBalance response =
          await _merchantService.createOpeningBalance(formData);

      return response;
    } on DioError catch (error) {
      throw Exception(error.response!.data['message']);
    } finally {
      setBusy(false);
    }
  }

  Future<OpeningClosingBalance> createClosingBalanceRequest() async {
    if (merchant == null) {
      throw Exception("No merchant available");
    }
    setBusy(true);
    var formData = {
      "amount": double.parse(cashController.text),
      "branchId": merchant!.branch!.id
    };
    try {
      OpeningClosingBalance response =
          await _merchantService.createClosingBalance(formData);

      return response;
    } on DioError catch (error) {
      throw Exception(error.response!.data['message']);
    } finally {
      setBusy(false);
    }
  }
}
