import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'merchant_transaction_detail_view_model.sheet.dart';

class MerchantTransactionDetailSheetView extends StatelessWidget {
  const MerchantTransactionDetailSheetView({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  final SheetRequest? request;
  final Function(SheetResponse)? completer;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MerchantTransactionDetailSheetViewModel>.reactive(
        viewModelBuilder: () => MerchantTransactionDetailSheetViewModel(),
        builder: (context, model, child) {
          return BottomSheetContainer(
            padding: EdgeInsets.all(AppPadding.p24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Transaction Details'),
                  SizedBox(height: AppSize.s40),
                  Row(
                    children: [
                      SizedBox(width: 150, child: Text('ID')),
                      SizedBox(width: 16),
                      Text('A525668')
                    ],
                  ),
                  SizedBox(height: AppSize.s32),
                  Row(
                    children: [
                      SizedBox(width: 150, child: Text('Date')),
                      SizedBox(width: 16),
                      Text('10 July, 2022')
                    ],
                  ),
                  SizedBox(height: AppSize.s32),
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text('Transaction Type'),
                      ),
                      SizedBox(width: 16),
                      Text('Card Withdrawal')
                    ],
                  ),
                  SizedBox(height: AppSize.s32),
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text('Amount'),
                      ),
                      SizedBox(width: 16),
                      Text('45,000')
                    ],
                  ),
                  SizedBox(height: AppSize.s32),
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text('Paid Into:'),
                      ),
                      SizedBox(width: 16),
                      Flexible(
                          child:
                              Text('Wema ALAT - Lolade Rosemary - 10000100112'))
                    ],
                  ),
                  SizedBox(height: AppSize.s32),
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text('Bank Charge'),
                      ),
                      SizedBox(width: 16),
                      Text('16.02')
                    ],
                  ),
                  SizedBox(height: AppSize.s32),
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text('Service Charge'),
                      ),
                      SizedBox(width: 16),
                      Text('400')
                    ],
                  ),
                  SizedBox(height: AppSize.s32),
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text('Service Charge Payment Type'),
                      ),
                      SizedBox(width: 16),
                      Text('Cash')
                    ],
                  ),
                  SizedBox(height: AppSize.s32),
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text('Comment'),
                      ),
                      SizedBox(width: 16),
                      Text('NIL')
                    ],
                  ),
                  SizedBox(height: AppSize.s40),
                  Row(
                    children: [
                      Expanded(
                        child: PosButton(
                          onPressed: () {},
                          title: 'Delete',
                          leadingIcon: Icons.delete_sharp,
                          leadingIconColor: ColorManager.kRed,
                          buttonBgColor: ColorManager.kErrorBgColor,
                          buttonTextColor: ColorManager.kErrorTextColor,
                        ),
                      ),
                      SizedBox(width: AppSize.s24),
                      Expanded(
                        child: PosButton(
                          onPressed: () {},
                          title: 'Edit',
                          buttonBgColor: ColorManager.kPrimaryColor,
                          buttonTextColor: ColorManager.kWhiteColor,
                          leadingIcon: Icons.edit,
                          leadingIconColor: ColorManager.kWhiteColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
