import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/dummy.widget/listtile_widget.dart';
import 'package:pos_mobile_app/ui/shared/components/branch_dropdown/branch_dropdown_view.dart';
import 'package:pos_mobile_app/utils/helpers.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import '../../../../models/transaction.model.dart';
import '../dasboard_view.dart';
import 'analytic_home_view_model.dart';

class AnalyticHomeView extends StatelessWidget {
  AnalyticHomeView({Key? key}) : super(key: key);

  List<String> branchNameList = [
    'All',
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AnalyticHomeViewModel>.nonReactive(
        onModelReady: (model) {
          model.getStat();
          model.getTransactions();
        },
        viewModelBuilder: () => AnalyticHomeViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: ColorManager.kWhiteColor,
            appBar: Navbar(
              leadingText: AppString.welecome,
              leadingStyle: getMediumStyle(
                  color: ColorManager.kLightGray, fontSize: FontSize.s16),
              leadingBottomStyle: getBoldStyle(
                  color: ColorManager.kDarkCharcoal, fontSize: FontSize.s20),
              bottomLeadingText: model.admin?.businessName ?? "",
              trailing: const BranchDropdownView(),
              automaticallyImplyLeading: false,
              statusBarBrightness: Brightness.light,
              statusBarColor: ColorManager.kDarkBlue,
              statusBarIconBrightness: Brightness.light,
              color: ColorManager.kWhiteColor,
              elevation: .5,
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                await model.getStat();
                await model.getTransactions();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                        left: 24.0,
                        right: 24.0,
                        bottom: 0,
                      ),
                      decoration: const BoxDecoration(
                        color: ColorManager.kWhiteColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              model.navigateToTransactionPage();
                            },
                            child: Text('Today',
                                style: getSemiBoldStyle(
                                    color: ColorManager.kOuterSpaceColor,
                                    fontSize: FontSize.s20)),
                          ),
                          const SizedBox(
                            height: AppSize.s12,
                          ),
                          const OpeningBalanceWidget(),
                          const AnalyticStatWidget(),
                        ],
                      ),
                    ),
                    const TransactionSummaryView(),
                    const TransactionSummaryList()
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class OpeningBalanceWidget extends ViewModelWidget<AnalyticHomeViewModel> {
  const OpeningBalanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AnalyticHomeViewModel model) {
    return Container(
      padding: const EdgeInsets.all(AppSize.s24),
      width: double.infinity,
      decoration: const BoxDecoration(
          color: ColorManager.kButtonTextNavyBlue,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s4))),
      child: RichText(
        text: TextSpan(
          text: 'Opening Cash : ',
          style: getSemiBoldStyle(
              color: ColorManager.kWhiteColor, fontSize: FontSize.s12),
          children: <TextSpan>[
            TextSpan(
                text: 'NGN ${formatCurrency(model.stat?.openingBalance ?? 0)}',
                style: getBoldStyle(
                    color: ColorManager.kWhiteColor, fontSize: FontSize.s16)),
          ],
        ),
      ),
    );
  }
}

class AnalyticStatWidget extends ViewModelWidget<AnalyticHomeViewModel> {
  const AnalyticStatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AnalyticHomeViewModel model) {
    return GridView.count(
        primary: false,
        padding:
            const EdgeInsets.only(bottom: AppPadding.p40, top: AppPadding.p16),
        crossAxisCount: 2,
        crossAxisSpacing: AppSize.s8,
        mainAxisSpacing: AppSize.s8,
        shrinkWrap: true,
        childAspectRatio: (1 / 0.9),
        children: [
          ListTileWidget(
            color: ColorManager.klightYellowColor,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/Frame_3891.svg'),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: Text(
                      '${model.stat != null ? calculateTotalWithdrawal(model.stat!.cardWithdrawal!, model.stat!.transferWithdrawal!) : 0}',
                      maxLines: 1,
                      style: getThickStyle(
                          color: ColorManager.kDarkCharcoal,
                          fontSize: FontSize.s28),
                    ),
                  ),
                  Text(
                    'Total Withdrawal',
                    style: getRegularStyle(
                        color: ColorManager.kNavNonActiveColor,
                        fontSize: FontSize.s12),
                  )
                ]),
          ),
          ListTileWidget(
            color: ColorManager.kBackgroundolor,
            child: Column(children: [
              SvgPicture.asset('assets/images/servicechargeicon.svg'),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: Text(
                  formatCurrency(model.stat?.serviceCharge ?? 0.0),
                  maxLines: 1,
                  style: getThickStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s28),
                ),
              ),
              Text(
                'Service Charges',
                style: getRegularStyle(
                    color: ColorManager.kNavNonActiveColor,
                    fontSize: FontSize.s12),
              )
            ]),
          ),
          ListTileWidget(
            color: ColorManager.kPinkishPurpleColor,
            child: Column(children: [
              SvgPicture.asset('assets/images/expenseicon.svg'),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: Text(
                  formatCurrency(model.stat?.expenses ?? 0),
                  maxLines: 1,
                  style: getThickStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s28),
                ),
              ),
              Text(
                'Expenses',
                style: getRegularStyle(
                    color: ColorManager.kNavNonActiveColor,
                    fontSize: FontSize.s12),
              )
            ]),
          ),
          ListTileWidget(
            color: ColorManager.kLightGreen1,
            child: Column(children: [
              SvgPicture.asset('assets/images/Frame 6.svg'),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: Text(
                  '${model.stat?.balance ?? 0}',
                  maxLines: 1,
                  style: getThickStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s28),
                ),
              ),
              Text(
                'Total Balance(Bank)',
                style: getRegularStyle(
                    color: ColorManager.kNavNonActiveColor,
                    fontSize: FontSize.s12),
              )
            ]),
          )
        ]);
  }
}

class TransactionSummaryView extends ViewModelWidget<AnalyticHomeViewModel> {
  const TransactionSummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AnalyticHomeViewModel model) {
    print('stat: ${model.stat?.toJson()}');
    double serviceCharges = model.stat?.serviceCharge ?? 0;

    double expenses = model.stat?.expenses ?? 0;
    double withdrawals = (model.stat?.cardWithdrawal ?? 0) +
        (model.stat?.transferWithdrawal ?? 0);
    double pieChartTotal = serviceCharges + expenses + withdrawals;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSize.s40,
        horizontal: AppSize.s24,
      ),
      decoration: BoxDecoration(
        color: ColorManager.kLightBlue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Transaction Summary',
              style: getMediumStyle(
                color: ColorManager.kDarkColor,
                fontSize: FontSize.s20,
              ),
            ),
          ),
          SizedBox(height: AppSize.s40),
          Container(
            height: 200,
            child: PieChart(
              PieChartData(
                // read about it in the PieChartData section
                sections: [
                  PieChartSectionData(
                    value: pieChartCalculate(pieChartTotal, withdrawals),
                    color: ColorManager.kBadgeTextColor,
                    showTitle: false,
                    radius: AppSize.s24,
                  ),
                  PieChartSectionData(
                    value: pieChartCalculate(pieChartTotal, serviceCharges),
                    color: ColorManager.kDeepNavyBlue,
                    showTitle: false,
                    radius: AppSize.s24,
                  ),
                  PieChartSectionData(
                    value: pieChartCalculate(pieChartTotal, expenses),
                    color: ColorManager.kDeepViolet,
                    showTitle: false,
                    radius: AppSize.s24,
                  ),
                ],
              ),
              swapAnimationDuration: Duration(milliseconds: 150), // Optional
              swapAnimationCurve: Curves.linear, // Optional
            ),
          ), //chart,
          const SizedBox(height: AppSize.s40),
          Column(
            children: [
              TransactionSummaryItemBox(
                color: ColorManager.kBadgeTextColor,
                value: model.stat != null
                    ? calculateTotalWithdrawal(model.stat!.cardWithdrawal!,
                        model.stat!.transferWithdrawal!)
                    : '0',
                label: 'Total cash withdrawal',
              ),
              const SizedBox(height: AppSize.s40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TransactionSummaryItemBox(
                      color: ColorManager.kDeepNavyBlue,
                      value: formatCurrency(model.stat?.serviceCharge ?? 0),
                      label: 'Service charge for all transactions',
                    ),
                  ),
                  Expanded(
                    child: TransactionSummaryItemBox(
                      color: ColorManager.kDeepViolet,
                      value: formatCurrency(model.stat?.expenses ?? 0),
                      label: 'Business expenses recorded',
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TransactionSummaryItemBox extends StatelessWidget {
  const TransactionSummaryItemBox({
    Key? key,
    required this.value,
    required this.label,
    required this.color,
  }) : super(key: key);

  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: AppSize.s24,
          height: AppSize.s24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppSize.s4),
          ),
        ),
        const SizedBox(height: AppSize.s24),
        Text(
          value,
          style: getBoldStyle(
            color: ColorManager.kDarkCharcoal,
            fontSize: FontSize.s20,
          ),
        ),
        const SizedBox(height: AppSize.s8),
        Text(
          label,
          style: getRegularStyle(
            color: ColorManager.kNavNonActiveColor,
            fontSize: FontSize.s14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class TransactionSummaryList extends ViewModelWidget<AnalyticHomeViewModel> {
  const TransactionSummaryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AnalyticHomeViewModel model) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p24),
      decoration: const BoxDecoration(color: ColorManager.kWhiteColor),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transactions',
                style: getRegularStyle(
                  color: ColorManager.kDarkCharcoal,
                  fontSize: FontSize.s20,
                ),
              ),
              GestureDetector(
                onTap: () {
                  model.navigateToTransactionPage();
                },
                child: Text(
                  'See all',
                  style: getMediumStyle(
                    color: ColorManager.kPrimaryColor,
                    fontSize: FontSize.s20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.s12),
          Divider(),
          SizedBox(height: AppSize.s12),
          ListView.builder(
            shrinkWrap: true,
            itemCount: model.transactions!.length,
            itemBuilder: (BuildContext context, int index) {
              Transaction transaction = model.transactions![index];
              return TransactionSummaryListItem(transaction: transaction);
            },
          ),
        ],
      ),
    );
  }
}
