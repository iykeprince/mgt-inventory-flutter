import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/dummy.widget/listtile_widget.dart';
import 'package:pos_mobile_app/models/admin-stat.model.dart';
import 'package:pos_mobile_app/models/admin.model.dart';
import 'package:pos_mobile_app/services/admin.service.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:pos_mobile_app/services/transaction.service.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/font_styles.dart';
import 'package:pos_mobile_ui_package/utils/text_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../models/branch.model.dart';
import '../../../../models/transaction.model.dart';
import '../../../../utils/http_exception.dart';

const String TRANSACTION_REQUEST = 'TRANSACTION_REQUEST';

class AnalyticHomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _adminService = locator<AdminService>();
  final _authenticationService = locator<AuthenticationService>();
  final _transactionService = locator<TransactionService>();

  Admin? get admin => _authenticationService.currentAdminUser;
  String? _selectedValue = 'All';
  String? get selectedValue => _selectedValue;
  AdminStat? _stat;
  AdminStat? get stat => _stat;
  List<Transaction>? get transactions => _transactionService.transactions;
  List<Branch>? get branches => _adminService.branches;
  Branch? _selectedBranch;
  Branch? get selectedBranch => _selectedBranch;
  // Branch? get selectedBranch => _adminService.branches![0];

  navigateToTransactionPage() =>
      _navigationService.navigateTo(Routes.adminTransactionView);

  handleSelectedValue(String? value) async {
    print('value: $value');
    _selectedValue = value;
    notifyListeners();
    _selectedBranch = branches?.firstWhere(
      (element) => element.name?.toLowerCase() == value?.toLowerCase(),
    );
    await getStat();
  }

  getStat() async {
    runBusyFuture(getStatTask());
  }

  getTransactions() async {
    runBusyFuture(getTransactionsRequest(), busyObject: TRANSACTION_REQUEST);
  }

  Future<AdminStat?> getStatTask() async {
    try {
      setBusy(true);
      _stat = await _adminService.getStat(selectedBranch?.id);
      return stat;
    } on DioError catch (error) {
      throw HttpException(error.response!.data['message']);
    } finally {
      setBusy(false);
    }
  }

  Future getTransactionsRequest() async {
    try {
      setBusyForObject(TRANSACTION_REQUEST, true);
      await _transactionService.getTransactions(
        page: 1,
        pageSize: 20,
        branchId: selectedBranch?.id,
      );
    } on DioError catch (error) {
      throw HttpException(error.response!.data['message']);
    } finally {
      setBusyForObject(TRANSACTION_REQUEST, false);
    }
  }

  List<ListTileWidget> cardLists(BuildContext context) {
    return [];
  }
}
