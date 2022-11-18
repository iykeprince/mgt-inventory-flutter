import 'package:flutter/material.dart';
import 'package:pos_mobile_app/ui/admin/dashboard/admin_transaction/admin_transaction_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import '../../../../models/transaction.model.dart';
import '../analytic_home/analytic_home_view.dart';
import '../dasboard_view.dart';

class AdminTransactionView extends StatelessWidget {
  const AdminTransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminTransactionViewModel>.nonReactive(
        viewModelBuilder: () => AdminTransactionViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: model.navigateBack,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: ColorManager.kDarkCharcoal,
                ),
              ),
              title: Text(
                AppString.transactions,
                style: getBoldStyle(
                  color: ColorManager.kDarkCharcoal,
                  fontSize: FontSize.s20,
                ),
              ),
              elevation: .5,
              backgroundColor: ColorManager.kWhiteColor,
              actions: [
                IconButton(
                  onPressed: () {
                    print('search');
                  },
                  icon: Icon(
                    Icons.search,
                    color: ColorManager.kDarkCharcoal,
                    size: AppSize.s32,
                  ),
                )
              ],
            ),
            backgroundColor: ColorManager.kWhiteColor,
            body: ListView.builder(
              itemCount: TRANSACTION_LIST.length,
              itemBuilder: (BuildContext context, int index) {
                Transaction transaction = TRANSACTION_LIST[index];
                return TransactionSummaryListItem(
                  transaction: transaction,
                  isContentPadding: false,
                );
              },
            ),
          );
        });
  }
}
