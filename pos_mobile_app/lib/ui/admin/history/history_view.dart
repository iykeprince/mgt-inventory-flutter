import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/dummy.widget/listtile_widget.dart';
import 'package:pos_mobile_app/ui/shared/components/branch_dropdown/branch_dropdown_view.dart';
import 'package:pos_mobile_app/ui/shared/components/transaction_filter/transaction_filter_view.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import '../../../models/transaction.model.dart';
import '../dashboard/dasboard_view.dart';
import 'history_view_model.dart';

class AdminHistoryView extends StatelessWidget {
  AdminHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminHistoryViewModel>.nonReactive(
        viewModelBuilder: () => AdminHistoryViewModel(),
        builder: (context, model, child) {
          return (Scaffold(
            appBar: Navbar(
              title: AppString.transactionHistory,
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
            body: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(color: ColorManager.kLightIndigoBg),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppSize.s12),
                      TransactionFilterView(),
                      HistoryAnalyticWidget(),
                      HistoryTransactionWidget(),
                    ]),
              ),
            ),
          ));
        });
  }
}

class HistoryAnalyticWidget extends ViewModelWidget<AdminHistoryViewModel> {
  const HistoryAnalyticWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AdminHistoryViewModel model) {
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

class HistoryTransactionWidget extends ViewModelWidget<AdminHistoryViewModel> {
  const HistoryTransactionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AdminHistoryViewModel model) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorManager.kWhiteColor,
      ),
      child: Column(
        children: [
          PosDropDownField(
            hint: 'All Transaction',
            value: model.selectedTransactionType,
            dropdownItems: model.transactionTypes,
            onChanged: model.handleSelectedTransactionType,
            // dropdownWidth: MediaQuery.of(context).size.width,
            buttonHeight: 50,
            buttonWidth: MediaQuery.of(context).size.width,
            buttonElevation: 1,
            valueAlignment: Alignment.center,
            valueStyle: getBoldStyle(
              color: ColorManager.kPrimaryColor,
              fontSize: FontSize.s16,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InputField(
                  keyBoardType: TextInputType.text,
                  suffixIcon: const Icon(
                    Icons.search,
                    size: AppSize.s24,
                    color: ColorManager.kNavNonActiveColor,
                  ),
                  onChanged: (value) {},
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: AppSize.s20),
                child: IconButton(
                    alignment: Alignment.center,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.download_sharp,
                      color: ColorManager.kPrimaryColor,
                      size: AppSize.s24,
                    )),
              )
            ],
          ),
          SizedBox(height: AppSize.s12),
          Divider(),
          SizedBox(height: AppSize.s12),
          model.isBusy
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: model.transactions!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Transaction transaction = model.transactions![index];
                    return TransactionSummaryListItem(transaction: transaction);
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
    );
  }
}
