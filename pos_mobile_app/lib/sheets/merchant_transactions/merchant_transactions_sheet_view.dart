import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:pos_mobile_app/sheets/merchant_transactions/merchant_transactions_sheet_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../enums/transaction_status.dart';

class MerchantTransactionsSheetView extends StatelessWidget {
  const MerchantTransactionsSheetView({
    Key? key,
    this.request,
    this.completer,
    this.minChildSize,
    this.initialChildSize,
  }) : super(key: key);
  final double? minChildSize;
  final double? initialChildSize;
  final SheetRequest? request;
  final Function(SheetResponse)? completer;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MerchantTransactionsSheetViewModel>.reactive(
        viewModelBuilder: () => MerchantTransactionsSheetViewModel(),
        builder: (context, model, child) {
          return DraggableScrollableSheet(
            initialChildSize: initialChildSize ?? 0.52,
            minChildSize: minChildSize ?? 0.40,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  padding: EdgeInsets.all(AppPadding.p24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (!model.showSearch)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: PosDropDownField(
                                hint: 'All Transaction',
                                value: model.selectedTransactionType,
                                dropdownItems: model.transactionTypes,
                                onChanged: model.handleSelectedTransactionType,
                                // dropdownWidth: MediaQuery.of(context).size.width,
                                buttonHeight: 50,
                                buttonWidth: 200,
                                buttonElevation: 0,
                                valueAlignment: Alignment.center,
                                valueStyle: getBoldStyle(
                                  color: ColorManager.kPrimaryColor,
                                  fontSize: FontSize.s16,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: model.toggleSearch,
                              child: const Icon(
                                Icons.search,
                                color: ColorManager.kPrimaryColor,
                                size: AppSize.s24,
                              ),
                            ),
                          ],
                        ),
                      if (model.showSearch)
                        Row(
                          children: [
                            Expanded(
                              child: InputField(
                                enabled: true,
                                suffixIcon: Icon(
                                  Icons.search,
                                  size: AppSize.s24,
                                ),
                              ),
                            ),
                            SizedBox(width: AppSize.s12),
                            GestureDetector(
                              onTap: model.toggleSearch,
                              child: Container(
                                margin: EdgeInsets.only(top: AppPadding.p8),
                                child: const Icon(
                                  Icons.close,
                                  color: ColorManager.kPrimaryColor,
                                  size: AppSize.s24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      SizedBox(height: AppSize.s12),
                      model.isBusy
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: 20,
                              itemBuilder: (BuildContext context, int index) {
                                // Transaction transaction = model.transactions![index];
                                return MerchantTransactionItem(
                                  onTap: model.showTransactionDetail,
                                );
                              },
                            ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}

class MerchantTransactionItem extends StatelessWidget {
  const MerchantTransactionItem({
    Key? key,
    this.isDeduction = false,
    required this.onTap,
  }) : super(key: key);
  final bool isDeduction;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: isDeduction == false
          ? SvgPicture.asset(
              'assets/images/success_tranx_icon.svg',
              fit: BoxFit.cover,
            )
          : SvgPicture.asset(
              'assets/images/danger_tranx_icon.svg',
              fit: BoxFit.cover,
            ),
      title: Text(
        'Type',
        style: const TextStyle(
          fontSize: FontSize.s16,
          color: ColorManager.kTurquoiseDarkColor,
          fontWeight: FontWeightManager.medium,
        ),
      ),
      subtitle: Text(
        DateFormat("d/M/yyyy h:ma").format(DateTime.now()),
        style: const TextStyle(
          color: ColorManager.kNavNonActiveColor,
          fontSize: FontSize.s14,
          fontWeight: FontWeightManager.regular,
        ),
      ),
      trailing: Text(
        '2000',
        style: TextStyle(
          color: !isDeduction ? ColorManager.kGreen : ColorManager.kRed,
          fontSize: FontSize.s18,
          fontWeight: FontWeightManager.semiBold,
        ),
      ),
    );
  }
}
