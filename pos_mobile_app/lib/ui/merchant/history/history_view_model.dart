import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../models/account.model.dart';
import '../../../services/shared.service.dart';

class HistoryViewModel extends BaseViewModel {
  final _sharedService = locator<SharedService>();

  List<Account>? get accounts => _sharedService.branchAccounts;

  void openEndDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
    print('why');
    notifyListeners();
  }
}
