import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pos_mobile_app/dummy.widget/listtile_widget.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import 'analytic_home_view_model.dart';

List<Transaction> TRANSACTION_LIST = [
  Transaction(id: '1', title: 'POS 1'),
  Transaction(id: '2', title: 'POS 2'),
  Transaction(id: '3', title: 'POS 3'),
  Transaction(id: '4', title: 'POS 4'),
  Transaction(id: '5', title: 'POS 5'),
];

class AnalyticHomeView extends StatelessWidget {
  AnalyticHomeView({Key? key}) : super(key: key);
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AnalyticHomeViewModel>.nonReactive(
        viewModelBuilder: () => AnalyticHomeViewModel(),
        builder: (context, model, child) {
          final cardList = model.cardLists(context);
          return Scaffold(
            appBar: Navbar(
              leadingText: AppString.welecome,
              leadingStyle: getMediumStyle(
                  color: ColorManager.kLightGray, fontSize: FontSize.s16),
              leadingBottomStyle: getBoldStyle(
                  color: ColorManager.kDarkCharcoal, fontSize: FontSize.s20),
              bottomLeadingText: AppString.businessNamePlaceholder,
              trailing: PosDropDownField(
                hint: 'Select Item',
                dropdownItems: items,
                value: selectedValue,
                onChanged: model.handleSelectedValue,
              ),
              automaticallyImplyLeading: false,
              statusBarBrightness: Brightness.light,
              statusBarColor: ColorManager.kDarkBlue,
              statusBarIconBrightness: Brightness.light,
              color: ColorManager.kWhiteColor,
              elevation: .5,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 40.0,
                      left: 24.0,
                      right: 24.0,
                      bottom: 0,
                    ),
                    decoration: BoxDecoration(
                      color: ColorManager.kWhiteColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Today',
                            style: getSemiBoldStyle(
                                color: ColorManager.kOuterSpaceColor,
                                fontSize: FontSize.s20)),
                        const SizedBox(
                          height: AppSize.s12,
                        ),
                        Container(
                          padding: const EdgeInsets.all(AppSize.s24),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: ColorManager.kButtonTextNavyBlue,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(AppSize.s4))),
                          child: RichText(
                            text: TextSpan(
                              text: 'Opening Cash : ',
                              style: getSemiBoldStyle(
                                  color: ColorManager.kWhiteColor,
                                  fontSize: FontSize.s12),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'NGN 20,0000000',
                                    style: getBoldStyle(
                                        color: ColorManager.kWhiteColor,
                                        fontSize: FontSize.s16)),
                              ],
                            ),
                          ),
                        ),
                        GridView.count(
                          primary: false,
                          padding: const EdgeInsets.only(
                              bottom: AppPadding.p40, top: AppPadding.p16),
                          crossAxisCount: 2,
                          crossAxisSpacing: AppSize.s8,
                          mainAxisSpacing: AppSize.s8,
                          shrinkWrap: true,
                          childAspectRatio: (1 / 0.9),
                          children: List.generate(cardList.length, (index) {
                            return ListTileWidget(
                              color: cardList[index].color,
                              child: cardList[index].child,
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  TransactionSummaryView(),
                  TransactionSummaryList()
                ],
              ),
            ),
          );
        });
  }
}

class TransactionSummaryView extends ViewModelWidget<AnalyticHomeViewModel> {
  const TransactionSummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AnalyticHomeViewModel model) {
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
          Container(
            height: 200,
            child: Center(
                child: Text(
              'Graph',
              style: getBoldStyle(
                color: ColorManager.kDarkCharcoal,
              ),
            )),
          ), //chart,
          const SizedBox(height: AppSize.s20),
          Column(
            children: [
              TransactionSummaryItemBox(
                color: ColorManager.kBadgeTextColor,
                value: '1,450,000',
                label: 'Total cash withdrawal',
              ),
              const SizedBox(height: AppSize.s40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TransactionSummaryItemBox(
                      color: ColorManager.kDeepNavyBlue,
                      value: '26,000',
                      label: 'Service charge for all transactions',
                    ),
                  ),
                  Expanded(
                    child: TransactionSummaryItemBox(
                      color: ColorManager.kDeepViolet,
                      value: '4,8000',
                      label: 'Total cash withdrawal',
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

class TransactionSummaryList extends StatelessWidget {
  const TransactionSummaryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Text(
                'See All',
                style: getRegularStyle(
                  color: ColorManager.kDarkCharcoal,
                  fontSize: FontSize.s20,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.s12),
          Divider(),
          SizedBox(height: AppSize.s12),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return TransactionSummaryListItem(
                transaction: TRANSACTION_LIST[index],
              );
            },
          ),
        ],
      ),
    );
  }
}

class TransactionSummaryListItem extends StatelessWidget {
  const TransactionSummaryListItem({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.add),
      title: Text('Card Withdrawal'),
      subtitle: Text("10 July '22"),
      trailing: Text('45,000'),
    );
  }
}

class Transaction {
  String id;
  String title;

  Transaction({required this.id, required this.title});
}
