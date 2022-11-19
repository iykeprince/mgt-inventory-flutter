import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/dummy.widget/listtile_widget.dart';
import 'package:pos_mobile_app/ui/admin/report/report_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import '../../../models/transaction.model.dart';
import '../../../utils/helpers.dart';
import '../dashboard/dasboard_view.dart';

class AdminReportView extends StatelessWidget {
  AdminReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminReportViewModel>.nonReactive(
        viewModelBuilder: () => AdminReportViewModel(),
        builder: (context, model, child) {
          return (Scaffold(
            appBar: Navbar(
              title: AppString.report,
              titleStyle: getMediumStyle(
                color: ColorManager.kDarkColor,
                fontSize: FontSize.s20,
              ),
              trailing: const ReportBranchDropdown(),
              automaticallyImplyLeading: false,
              statusBarBrightness: Brightness.light,
              statusBarColor: ColorManager.kDarkBlue,
              statusBarIconBrightness: Brightness.light,
              color: ColorManager.kWhiteColor,
              elevation: .5,
            ),
            body: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(color: ColorManager.kLightIndigoBg),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppSize.s12),
                      ReportFilterBoxWidget(),
                      ReportAnalyticWidget(),
                      ReportTransactionSummaryView(),
                      ReportTransactionGraphView()
                    ]),
              ),
            ),
          ));
        });
  }
}

class ReportBranchDropdown extends ViewModelWidget<AdminReportViewModel> {
  const ReportBranchDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AdminReportViewModel model) {
    return PosDropDownField(
      hint: 'All',
      dropdownItems: [
        'All',
        ...model.branches!.map((e) => e.name!).toList(),
      ],
      value: model.selectedValue,
      valueStyle: getBoldStyle(
        color: ColorManager.kPrimaryColor,
      ),
      onChanged: model.handleSelectedValue,
    );
  }
}

class ReportFilterBoxWidget extends ViewModelWidget<AdminReportViewModel> {
  ReportFilterBoxWidget({Key? key}) : super(key: key);

  final List<String> filterList = ['30 days', '3 month', '1 year'];

  @override
  Widget build(BuildContext context, AdminReportViewModel model) {
    return Container(
      height: 36,
      margin: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
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

class ReportAnalyticWidget extends ViewModelWidget<AdminReportViewModel> {
  const ReportAnalyticWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AdminReportViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
      child: GridView.count(
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
                      '0',
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
                  '0',
                  maxLines: 1,
                  style: getThickStyle(
                      color: ColorManager.kPrimaryColor,
                      fontSize: FontSize.s28),
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
                  '0',
                  maxLines: 1,
                  style: getThickStyle(
                      color: ColorManager.kPrimaryColor,
                      fontSize: FontSize.s28),
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
                  '0',
                  maxLines: 1,
                  style: getThickStyle(
                      color: ColorManager.kPrimaryColor,
                      fontSize: FontSize.s28),
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
      ),
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
          borderRadius: BorderRadius.circular(AppSize.s100),
          color: widget.selectedValue == widget.item
              ? ColorManager.kLightIndigo
              : Colors.transparent,
        ),
        child: Center(
          child: Text(
            widget.item,
            style: TextStyle(
              color: widget.selectedValue == widget.item
                  ? ColorManager.kPrimaryColor
                  : ColorManager.kTurquoiseDarkColor,
              fontSize: FontSize.s14,
              fontWeight: widget.selectedValue == widget.item
                  ? FontWeight.bold
                  : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class ReportTransactionSummaryView
    extends ViewModelWidget<AdminReportViewModel> {
  const ReportTransactionSummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AdminReportViewModel model) {
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
              ReportTransactionSummaryItemBox(
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
                    child: ReportTransactionSummaryItemBox(
                      color: ColorManager.kDeepNavyBlue,
                      value: formatCurrency(model.stat?.serviceCharge ?? 0),
                      label: 'Service charge for all transactions',
                    ),
                  ),
                  Expanded(
                    child: ReportTransactionSummaryItemBox(
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

class ReportTransactionGraphView extends ViewModelWidget<AdminReportViewModel> {
  ReportTransactionGraphView({Key? key}) : super(key: key);

  final List<Color> gradientColors = [
    ColorManager.kGreen,
    const Color(0xffADFF87),
  ];

  @override
  Widget build(BuildContext context, AdminReportViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p24),
      child: Column(
        children: [
          Container(
            height: 300,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: false,
                  drawVerticalLine: true,
                  horizontalInterval: 1,
                  verticalInterval: 1,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: const Color(0xff37434d),
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: const Color(0xff37434d),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 1,
                      getTitlesWidget: bottomTitleWidgets,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: leftTitleWidgets,
                      reservedSize: 42,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                  border: Border.all(color: const Color(0xff37434d)),
                ),
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 3),
                      FlSpot(2.6, 2),
                      FlSpot(4.9, 5),
                      FlSpot(6.8, 3.1),
                      FlSpot(8, 4),
                      FlSpot(9.5, 3),
                      FlSpot(11, 4),
                      FlSpot(12, 2),
                    ],
                    isCurved: true,
                    gradient: LinearGradient(
                      colors: gradientColors,
                    ),
                    barWidth: 5,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: gradientColors
                            .map((color) => color.withOpacity(0.3))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
              swapAnimationDuration: Duration(milliseconds: 150), // Optional
              swapAnimationCurve: Curves.linear, // Optional
            ),
          ),
          SizedBox(height: AppSize.s32),
          Text(
            'This line chart representation shows the growth of transactions and profits per month within the last 1 year (12 months) on this account.',
            style: getRegularStyle(
              color: ColorManager.kDarkCharcoal,
              fontSize: FontSize.s14,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSize.s100),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: FontSize.s10,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Jan', style: style);
        break;
      case 2:
        text = const Text('Feb', style: style);
        break;
      case 3:
        text = const Text('Mar', style: style);
        break;
      case 4:
        text = const Text('Apr', style: style);
        break;
      case 5:
        text = const Text('May', style: style);
        break;
      case 6:
        text = const Text('Jun', style: style);
        break;
      case 7:
        text = const Text('Jul', style: style);
        break;
      case 8:
        text = const Text('Aug', style: style);
        break;
      case 9:
        text = const Text('Sep', style: style);
        break;
      case 10:
        text = const Text('Oct', style: style);
        break;
      case 11:
        text = const Text('Nov', style: style);
        break;
      case 12:
        text = const Text('Dec', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: FontSize.s10,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0%';
        break;
      case 1:
        text = '25%';
        break;
      case 3:
        text = '50%';
        break;
      case 4:
        text = '75%';
        break;
      case 5:
        text = '100%';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}

class ReportTransactionSummaryItemBox extends StatelessWidget {
  const ReportTransactionSummaryItemBox({
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
