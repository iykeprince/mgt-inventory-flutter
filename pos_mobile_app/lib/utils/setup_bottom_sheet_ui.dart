import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/enums/bottom_sheet_type.dart';
import 'package:pos_mobile_app/sheets/create_logs.dart';
import 'package:pos_mobile_app/sheets/create_merchant.sheet.dart';
import 'package:pos_mobile_app/sheets/feedback_survey_sheet.dart';
import 'package:pos_mobile_app/sheets/open_balance.sheet.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';

import '../sheets/pos_bottom.sheet.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.normal: (context, sheetRequest, completer) =>
        PosBottomSheet(request: sheetRequest, completer: completer),
    BottomSheetType.openBalance: (context, sheetRequest, completer) =>
        OpenBalanceBottomSheet(request: sheetRequest, completer: completer),
    BottomSheetType.createLogs: (context, sheetRequest, completer) =>
        CreateLogsBottomSheet(request: sheetRequest, completer: completer),
    BottomSheetType.createMerchant: (context, sheetRequest, completer) =>
        CreateMerchantBottomSheet(request: sheetRequest, completer: completer),
    BottomSheetType.feedbackSurvey: (context, sheetRequest, completer) =>
        FeedbackSurveyBottomSheet(request: sheetRequest, completer: completer),
    // BottomSheetType.accountData: (context, sheetRequest, completer) =>
    //     Accpimt(request: sheetRequest, completer: completer),
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
