import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/enums/bottom_sheet_type.dart';
import 'package:pos_mobile_app/sheets/balance_sheet/close_balance.sheet.dart';
import 'package:pos_mobile_app/sheets/create_logs.dart';
import 'package:pos_mobile_app/sheets/create_merchant.sheet.dart';
import 'package:pos_mobile_app/sheets/feedback_survey_sheet.dart';
import 'package:pos_mobile_app/sheets/balance_sheet/open_balance.sheet.dart';
import 'package:pos_mobile_app/sheets/merchant_transaction_detail/merchant_transaction_detail_view.sheet.dart';
import 'package:pos_mobile_app/sheets/merchant_transactions/merchant_transactions_sheet_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';

import '../sheets/pos_bottom.sheet.dart';
import '../sheets/sheet_add_branch/sheet_add_branch_view.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.normal: (context, sheetRequest, completer) =>
        PosBottomSheet(request: sheetRequest, completer: completer),
    BottomSheetType.openBalance: (context, sheetRequest, completer) =>
        OpenBalanceBottomSheet(request: sheetRequest, completer: completer),
    BottomSheetType.closeBalance: (context, sheetRequest, completer) =>
        CloseBalanceBottomSheet(request: sheetRequest, completer: completer),
    BottomSheetType.createLogs: (context, sheetRequest, completer) =>
        CreateLogsBottomSheet(request: sheetRequest, completer: completer),
    BottomSheetType.createMerchant: (context, sheetRequest, completer) =>
        CreateMerchantBottomSheet(request: sheetRequest, completer: completer),
    BottomSheetType.feedbackSurvey: (context, sheetRequest, completer) =>
        FeedbackSurveyBottomSheet(request: sheetRequest, completer: completer),
    BottomSheetType.addBranch: (context, sheetRequest, completer) =>
        SheetAddBranchBottomSheet(request: sheetRequest, completer: completer),
    BottomSheetType.merchantTransactions: (context, sheetRequest, completer) =>
        MerchantTransactionsSheetView(
          request: sheetRequest,
          completer: completer,
        ),
    BottomSheetType.merchantTransactionDetail:
        (context, sheetRequest, completer) =>
            MerchantTransactionDetailSheetView(
              request: sheetRequest,
              completer: completer,
            ),
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
