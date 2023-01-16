import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/shared/components/history_analytic/history_analytic_widget_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import '../../../../dummy.widget/listtile_widget.dart';
import '../../../../utils/helpers.dart';

class HistoryAnalyticWidgetView extends StatelessWidget {
  const HistoryAnalyticWidgetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HistoryAnalyticWidgetViewModel>.reactive(
        viewModelBuilder: () => HistoryAnalyticWidgetViewModel(),
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.only(
                  bottom: AppPadding.p40, top: AppPadding.p16),
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
                            formatCurrency(model.reportStat?.expenses ?? 0),
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
                        formatCurrency(model.reportStat?.deposits ?? 0),
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
                        formatCurrency(
                            model.reportStat?.transferWithdrawal ?? 0),
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
                        formatCurrency(model.reportStat?.cardWithdrawal ?? 0),
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
        });
  }
}
