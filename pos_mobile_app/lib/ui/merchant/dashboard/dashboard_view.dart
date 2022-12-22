import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/merchant/dashboard/dashboard_view_model.dart';
import 'package:pos_mobile_app/ui/shared/components/account_dropdown/account_dropdown_view.dart';
import 'package:pos_mobile_app/utils/card_items.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardItem = CardItems.items(context);
    return ViewModelBuilder<DashboardViewModel>.nonReactive(
        viewModelBuilder: () => DashboardViewModel(),
        onModelReady: (model) async {
          // await model.getCurrentOpeningBalance();
          // await model.getCurrentClosingBalance();
        },
        builder: (context, model, child) {
          return Scaffold(
            appBar: Navbar(
              leadingText: AppString.overview,
              trailing: AccountDropdownView(),
              automaticallyImplyLeading: false,
              statusBarBrightness: Brightness.light,
              statusBarColor: ColorManager.kDarkBlue,
              statusBarIconBrightness: Brightness.light,
              color: ColorManager.kWhiteColor,
            ),
            backgroundColor: ColorManager.kGreyBtn,
            body: Container(
              child: Stack(
                children: [
                  Column(
                    // mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const SizedBox(height: AppSize.s20),
                      SizedBox(
                        height: AppSize.s184,
                        child: PageView.builder(
                          controller: PageController(viewportFraction: 0.86),
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: cardItem.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = cardItem[index];
                            return CardWidget(
                                amount: item.amount,
                                bgColor: item.color,
                                imgUrl: item.imgUrl,
                                title: item.title,
                                amountColor: item.amountColor,
                                titleColor: item.titleColor,
                                noRightMargin: cardItem.length - 1 == index);
                          },
                        ),
                      ),
                      const SizedBox(height: AppSize.s12),
                      if (model.hasErrorForKey(OPENING_BALANCE))
                        Text(
                          '${model.error(OPENING_BALANCE)}',
                          style: getMediumStyle(
                            color: ColorManager.kDarkCharcoal,
                          ),
                        ),
                      BalanceWidget(),
                    ],
                  ),
                  TransactionLogHistoryWidget(),
                ],
              ),
            ),
          );
        });
  }
}

class BalanceWidget extends ViewModelWidget<DashboardViewModel> {
  const BalanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, DashboardViewModel model) {
    return model.openingBalance == null
        ? OpeningBalanceWidget()
        : OpeningAndClosingBalanceWidget();
  }
}

class OpeningBalanceWidget extends ViewModelWidget<DashboardViewModel> {
  const OpeningBalanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, DashboardViewModel model) {
    return InkWell(
      onTap: model.openSheet,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16, vertical: AppPadding.p24),
        margin: const EdgeInsets.symmetric(horizontal: ScreenHorizontalSize),
        decoration: BoxDecoration(
          color: ColorManager.kLightGreen1,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s8),
          ),
          border: Border.all(
            color: ColorManager.kBorderLightGreen,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                    'assets/images/MerchantDashboard/fontisto_wallet.svg'),
                const SizedBox(
                  width: AppSize.s8,
                ),
                Text(
                  AppString.enterOpeningBalanceText,
                  style: getMediumStyle(
                      color: ColorManager.kPrimaryColor,
                      fontSize: FontSize.s16),
                )
              ],
            ),
            Spacer(),
            model.isBusy
                ? SizedBox(
                    height: 40, width: 40, child: CircularProgressIndicator())
                : Icon(
                    Icons.arrow_forward,
                    color: ColorManager.kPrimaryColor,
                  )
          ],
        ),
      ),
    );
  }
}

class OpeningAndClosingBalanceWidget
    extends ViewModelWidget<DashboardViewModel> {
  const OpeningAndClosingBalanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, DashboardViewModel model) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                print('balance: ${model.openingBalance?.toJson()}');
                model.editOpeningBalance(
                  amount: model.openingBalance?.balance,
                  branchId: model.openingBalance?.branchId,
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p16,
                  vertical: AppPadding.p24,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.kLightGreen1,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(AppSize.s8),
                  ),
                  border: Border.all(
                    color: ColorManager.kBorderLightGreen,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/images/MerchantDashboard/fontisto_wallet.svg',
                    ),
                    const SizedBox(height: AppSize.s8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Edit opening balance',
                            style: getMediumStyle(
                              color: ColorManager.kPrimaryColor,
                              fontSize: FontSize.s16,
                            ),
                            softWrap: true,
                            maxLines: 2,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: ColorManager.kPrimaryColor,
                          size: AppSize.s18,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSize.s16),
          Expanded(
            child: GestureDetector(
              onTap: () {
                model.enterClosingBalance(
                  amount: model.closingBalance?.balance,
                  branchId: model.closingBalance?.branchId,
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p16,
                  vertical: AppPadding.p24,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.kLightBlue1,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(AppSize.s8),
                  ),
                  border: Border.all(
                    color: ColorManager.kLightBlue1,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/images/MerchantDashboard/fontisto_wallet.svg',
                      color: ColorManager.kButtonTextNavyBlue,
                    ),
                    const SizedBox(height: AppSize.s8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Enter closing balance',
                            style: getMediumStyle(
                              color: ColorManager.kButtonTextNavyBlue,
                              fontSize: FontSize.s16,
                            ),
                            softWrap: true,
                            maxLines: 2,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: ColorManager.kButtonTextNavyBlue,
                          size: AppSize.s18,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionLogHistoryWidget extends ViewModelWidget<DashboardViewModel> {
  const TransactionLogHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, DashboardViewModel model) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        constraints: BoxConstraints(minHeight: 350),
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
        decoration: const BoxDecoration(
            color: ColorManager.kWhiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.s16),
                topRight: Radius.circular(AppSize.s16))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSize.s40),
            Text(
              AppString.transactionLogHistoryText,
              style: getMediumStyle(
                color: ColorManager.kDarkCharcoal,
                fontSize: FontSize.s20,
              ),
            ),
            const SizedBox(height: AppSize.s24),
            Text(
              AppString.noEntryHasBeenMadeToday,
              style: getRegularStyle(
                color: ColorManager.kDarkCharcoal,
                fontSize: FontSize.s14,
              ),
            ),
            const SizedBox(height: AppSize.s20),
            const SizedBox(height: AppSize.s20),
          ],
        ),
      ),
    );
  }
}
