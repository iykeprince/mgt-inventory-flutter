import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../models/account.model.dart';
import '../../../models/merchant.model.dart';
import '../../../services/shared.service.dart';

const String MERCHANT_FETCH_ADMIN_STAT = "MERCHANT_FETCH_ADMIN_STAT";

class HistoryViewModel extends BaseViewModel {
  final _sharedService = locator<SharedService>();
  final _authenticationService = locator<AuthenticationService>();

  Merchant? get merchant => _authenticationService.currentMerchantUser;

  Future<void> fetchAnalyticStat() async {
    // if (merchant == null) return;
    String branchId = merchant?.branchId ?? "";
    await runBusyFuture(
      _sharedService.getStat(branchId),
      busyObject: MERCHANT_FETCH_ADMIN_STAT,
    );
  }
}
