import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/dummy.widget/listtile_widget.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import '../../../models/transaction.model.dart';
import '../dashboard/dasboard_view.dart';
import 'history_view_model.dart';

class AdminHistoryView extends StatelessWidget {
  AdminHistoryView({Key? key}) : super(key: key);
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
    return ViewModelBuilder<AdminHistoryViewModel>.nonReactive(
        viewModelBuilder: () => AdminHistoryViewModel(),
        builder: (context, model, child) {
          final cardList = model.cardLists(context);
          return (Scaffold(
            appBar: AppBar(
              title: Text(
                AppString.transactionHistory,
                style: getMediumStyle(
                  color: ColorManager.kPrimaryColor,
                  fontSize: FontSize.s20,
                ),
              ),
              backgroundColor: ColorManager.kWhiteColor,
              actions: [
                Container(
                  margin: EdgeInsets.only(
                    top: AppPadding.p8,
                    right: AppPadding.p10,
                  ),
                  child: PosDropDownField(
                    hint: 'PaySure POS',
                    dropdownItems: items,
                    value: selectedValue,
                    onChanged: model.handleSelectedValue,
                  ),
                ),
              ],
              automaticallyImplyLeading: false,
              elevation: .5,
            ),
            body: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(color: ColorManager.kLightIndigoBg),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppPadding.p16),
                      FilterBoxWidget(),
                      SizedBox(height: AppPadding.p16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: HistoryAnalyticWidget(),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: ColorManager.kWhiteColor,
                        ),
                        child: Column(
                          children: [
                            PosDropDownField(
                              hint: 'All Transaction',
                              value: 'All',
                              dropdownItems: [],
                              onChanged: (value) {},
                            ),
                            //ssearch field
                            SizedBox(height: AppSize.s12),
                            Divider(),
                            SizedBox(height: AppSize.s12),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: model.transactions!.length,
                              itemBuilder: (BuildContext context, int index) {
                                Transaction transaction =
                                    model.transactions![index];
                                return TransactionSummaryListItem(
                                    transaction: transaction);
                              },
                            ),
                            SizedBox(height: AppSize.s12),
                            PosButton(
                              onPressed: () {},
                              title: 'See more',
                              buttonType: ButtonType.text,
                              buttonTextColor: ColorManager.kButtonTextNavyBlue,
                              fontWeight: FontWeightManager.bold,
                              fontSize: FontSize.s14,
                            )
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          ));
        });
  }
}

class FilterBoxWidget extends ViewModelWidget<AdminHistoryViewModel> {
  FilterBoxWidget({Key? key}) : super(key: key);

  final List<String> filterList = ['30 days', '3 month', '1 year'];

  @override
  Widget build(BuildContext context, AdminHistoryViewModel model) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(
          vertical: AppPadding.p10, horizontal: 24.0),
      child: ListView.builder(
        itemCount: filterList.length + 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          if (index == filterList.length) {
            return GestureDetector(
              onTap: () {
                print('hello tapped');
              },
              child: SvgPicture.asset(
                'assets/images/filter_icon.svg',
                fit: BoxFit.cover,
              ),
            );
          }
          String item = filterList[index];
          return HistoryFilterItem(
            item: item,
            onFilterSelected: (value) {
              print('selected: $value');
              model.setSelectedFilter(value!);
            },
            selectedValue: model.selectedFilter,
          );
        },
      ),
    );
  }
}

class HistoryAnalyticWidget extends ViewModelWidget<AdminHistoryViewModel> {
  const HistoryAnalyticWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AdminHistoryViewModel model) {
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
          color: ColorManager.kWhiteColor,
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
                    '1240000000',
                    maxLines: 1,
                    style: getThickStyle(
                        color: ColorManager.kPrimaryColor,
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
          color: ColorManager.kWhiteColor,
          child: Column(children: [
            SvgPicture.asset('assets/images/servicechargeicon.svg'),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Text(
                '1240000000',
                maxLines: 1,
                style: getThickStyle(
                    color: ColorManager.kPrimaryColor, fontSize: FontSize.s28),
              ),
            ),
            Text(
              'Amount Deposits',
              style: getRegularStyle(
                  color: ColorManager.kNavNonActiveColor,
                  fontSize: FontSize.s12),
            )
          ]),
        ),
        ListTileWidget(
          color: ColorManager.kWhiteColor,
          child: Column(children: [
            SvgPicture.asset('assets/images/expenseicon.svg'),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Text(
                '1240000000',
                maxLines: 1,
                style: getThickStyle(
                    color: ColorManager.kPrimaryColor, fontSize: FontSize.s28),
              ),
            ),
            Text(
              'Transfer Withdrawal',
              style: getRegularStyle(
                  color: ColorManager.kNavNonActiveColor,
                  fontSize: FontSize.s12),
            )
          ]),
        ),
        ListTileWidget(
          color: ColorManager.kWhiteColor,
          child: Column(children: [
            SvgPicture.asset('assets/images/Frame 6.svg'),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Text(
                '1240000000',
                maxLines: 1,
                style: getThickStyle(
                    color: ColorManager.kPrimaryColor, fontSize: FontSize.s28),
              ),
            ),
            Text(
              'Cash Withdrawal',
              style: getRegularStyle(
                  color: ColorManager.kNavNonActiveColor,
                  fontSize: FontSize.s12),
            )
          ]),
        ),
      ],
    );
  }
}

class HistoryFilterItem extends StatefulWidget {
  const HistoryFilterItem({
    Key? key,
    required this.item,
    this.selectedValue,
    this.onFilterSelected,
  }) : super(key: key);
  final String item;
  final String? selectedValue;
  final Function(String?)? onFilterSelected;

  @override
  State<HistoryFilterItem> createState() => _HistoryFilterItemState();
}

class _HistoryFilterItemState extends State<HistoryFilterItem> {
  @override
  Widget build(BuildContext context) {
    print(
        'selected value: ${widget.selectedValue} , widget.item: ${widget.item}');
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onFilterSelected!(widget.item);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p8,
          horizontal: AppPadding.p12,
        ),
        margin: const EdgeInsets.only(right: AppSize.s12),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(AppSize.s100),
          color: widget.selectedValue == widget.item
              ? ColorManager.kLightIndigo
              : Colors.transparent,
        ),
        child: Text(
          widget.item,
          style: TextStyle(
            color: widget.selectedValue == widget.item
                ? ColorManager.kPrimaryColor
                : ColorManager.kTurquoiseDarkColor,
            fontSize: FontSize.s14,
            fontWeight: widget.selectedValue == widget.item
                ? FontWeight.w500
                : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
