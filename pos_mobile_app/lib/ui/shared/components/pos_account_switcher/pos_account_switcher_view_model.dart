import 'package:moment_dart/moment_dart.dart';
import 'package:pos_mobile_app/services/merchant.service.dart';
import 'package:pos_mobile_app/services/transaction.service.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../models/account.model.dart';
import '../../../../models/date-filter.model.dart';
import '../../../../services/shared.service.dart';

class PosAccountSwitcherViewModel extends BaseViewModel {
  final _merchantService = locator<MerchantService>();
  final _transactionService = locator<TransactionService>();
  final _sharedService = locator<SharedService>();
  List<Account>? get accounts => _sharedService.branchAccounts;
  Account? get selectedAccount =>
      (accounts != null && accounts!.isNotEmpty) ? accounts![0] : null;

  String? _selectedAccountDetailValue;
  String? get selectedAccountDetailValue => _selectedAccountDetailValue;
  Account? _selectedAccountDetail;
  Account? get selectedAccountDetail => _selectedAccountDetail;

  void handleSelectedAccount(String? value) async {
    _selectedAccountDetailValue = value;
    notifyListeners();
    String name = value!.split(' - ')[0];
    print('name of the selected account provider: $name');
    _selectedAccountDetail = accounts!.firstWhere((element) =>
        element.accountDetail!.serviceProviderName!.toLowerCase() ==
        name.toLowerCase());
    // fetch analytic report on that selected account
    await runBusyFuture(getMerchantTransaction());
  }

  Future getMerchantTransaction({
    DateFilter? df,
  }) async {
    DateTime startDate = df == null
        ? Moment.now().startOf(DurationUnit.day).toMoment()
        : Moment.now() -
            Duration(
                days: df.day ?? 0,
                hours: df.hour ?? 0,
                minutes: df.minute ?? 0,
                seconds: df.seconds ?? 0);

    DateTime endDate = DateTime.now();
    try {
      await _merchantService.getReportStat(start: startDate, end: endDate);
      await _transactionService.getMerchantTransactions(
        start: startDate,
        end: endDate,
        page: 0,
        pageSize: 50,
      );
    } catch (e) {}
  }
}
