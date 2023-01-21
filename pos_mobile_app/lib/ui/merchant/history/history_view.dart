import 'package:flutter/material.dart';
import 'package:pos_mobile_app/enums/role.enum.dart';
import 'package:pos_mobile_app/ui/merchant/history/history_view_model.dart';
import 'package:pos_mobile_app/ui/shared/components/account_dropdown/account_dropdown_view.dart';
import 'package:pos_mobile_app/ui/shared/components/pos_account_switcher/pos_account_switcher_view.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import '../../../sheets/merchant_transactions/merchant_transactions_sheet_view.dart';
import '../../shared/components/branch_dropdown/branch_dropdown_view.dart';
import '../../shared/components/filter_drawer/filter_drawer_view.dart';
import '../../shared/components/history_analytic/history_analytic_widget_view.dart';
import '../../shared/components/transaction_filter/transaction_filter_view.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HistoryViewModel>.reactive(
      viewModelBuilder: () => HistoryViewModel(),
      onModelReady: (model) async {
        await model.fetchAnalyticStat();
      },
      builder: (_, model, child) {
        return Scaffold(
          appBar: Navbar(
            title: AppString.transactionHistory,
            titleStyle: getMediumStyle(
              color: ColorManager.kDarkColor,
              fontSize: FontSize.s20,
            ),
            trailing: const AccountDropdownView(),
            automaticallyImplyLeading: false,
            statusBarBrightness: Brightness.light,
            statusBarColor: ColorManager.kDarkBlue,
            statusBarIconBrightness: Brightness.light,
            color: ColorManager.kWhiteColor,
            elevation: .5,
          ),
          endDrawer: FilterDrawer(),
          body: Container(
            decoration: const BoxDecoration(color: ColorManager.kLightIndigoBg),
            child: Stack(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  PosAccountSwitcherView(),
                  SizedBox(height: AppSize.s12),
                  Builder(builder: (context) {
                    return TransactionFilterView(
                      showDownload: false,
                      onDownloadClick: () {
                        print('download click');
                      },
                      onFilterIconClick: () =>
                          Scaffold.of(context).openEndDrawer(),
                      role: Role.MERCHANT,
                    );
                  }),
                  HistoryAnalyticWidgetView(),
                ]),
                MerchantTransactionsSheetView(
                  minChildSize: 0.3,
                  initialChildSize: 0.3,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
