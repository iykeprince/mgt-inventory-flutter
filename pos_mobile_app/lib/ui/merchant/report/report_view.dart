import 'package:flutter/material.dart';
import 'package:pos_mobile_app/enums/role.enum.dart';
import 'package:pos_mobile_app/ui/merchant/report/report_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import '../../../sheets/merchant_transactions/merchant_transactions_sheet_view.dart';
import '../../shared/components/branch_dropdown/branch_dropdown_view.dart';
import '../../shared/components/history_analytic/history_analytic_widget_view.dart';
import '../../shared/components/transaction_filter/transaction_filter_view.dart';

class ReportView extends StatelessWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReportViewModel>.nonReactive(
      viewModelBuilder: () => ReportViewModel(),
      builder: (_, model, child) {
        return Scaffold(
          appBar: Navbar(
            title: AppString.report,
            titleStyle: getMediumStyle(
              color: ColorManager.kDarkColor,
              fontSize: FontSize.s20,
            ),
            trailing: const BranchDropdownView(),
            automaticallyImplyLeading: false,
            statusBarBrightness: Brightness.light,
            statusBarColor: ColorManager.kDarkBlue,
            statusBarIconBrightness: Brightness.light,
            color: ColorManager.kWhiteColor,
            elevation: .5,
          ),
          endDrawer: Drawer(
            backgroundColor: ColorManager.kWhiteColor,
            width: MediaQuery.of(context).size.width - 20,
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p24),
              child: ListView(children: [
                Align(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                      )),
                  alignment: Alignment.topRight,
                ),
                SizedBox(height: AppSize.s40),
                Center(
                  child: Text(
                    'Filter Date',
                    style: getMediumStyle(
                      color: ColorManager.kDarkColor,
                      fontSize: FontSize.s20,
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s40),
                DatePicker(
                  onSelected: (value) {},
                  label: 'From',
                  hintText: 'MM/DD/YYYY',
                ),
                SizedBox(height: AppSize.s40),
                DatePicker(
                  onSelected: (value) {},
                  label: 'To',
                  hintText: 'MM/DD/YYYY',
                ),
                SizedBox(height: AppSize.s40),
                PosButton(
                  onPressed: () {},
                  busy: false,
                  title: 'Show result',
                  buttonType: ButtonType.fill,
                  fontSize: FontSize.s16,
                )
              ]),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(color: ColorManager.kLightIndigoBg),
            child: Stack(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  PosDropDownField(
                    hint: 'Access NG - Lolade Rosemary Agbabiaka - 100014732',
                    valueStyle: getMediumStyle(
                      color: ColorManager.kDarkColor,
                      fontSize: FontSize.s16,
                    ),
                    buttonHeight: 70,
                    value: null,
                    dropdownItems: ['hello', 'wold'],
                    onChanged: (value) {},
                    buttonWidth: MediaQuery.of(context).size.width,
                    buttonDecoration: const BoxDecoration(
                      color: ColorManager.kLightBlue,
                    ),
                    buttonPadding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p24,
                      vertical: AppPadding.p8,
                    ),
                    dropdownWidth: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(height: AppSize.s12),
                  TransactionFilterView(
                    showDownload: false,
                    onDownloadClick: () {
                      print('download click');
                    },
                    onFilterIconClick: () {
                      Scaffold.of(context).openEndDrawer();
                      print('open end drawer');
                    },
                    role: Role.MERCHANT,
                  ),
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
