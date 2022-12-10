import 'package:flutter/material.dart';
import 'package:pos_mobile_app/dialog/delete_branch_dialog.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:pos_mobile_ui_package/utils/values_manager.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../dialog/confirm_dialog.dart';
import '../dialog/create_bank_account_dialog.dart';
import '../dialog/create_pos_account_dialog.dart';
import '../dialog/delete_merchant.dialog.dart';
import '../enums/dialog_type.dart';
import 'package:pos_mobile_app/dialog/switchBranch.dialog.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.DELETE_MERCHANT_ACCOUNT: (context, sheetRequest, completer) =>
        DeleteMerchantDialog(request: sheetRequest, completer: completer),
    DialogType.DELETE_BRANCH_ACCOUNT: (context, sheetRequest, completer) =>
        DeleteBranchDialog(request: sheetRequest, completer: completer),
    DialogType.SWITCH_BRANCH: (context, DialogRequest dialogRequest,
            Function(DialogResponse) completer) =>
        SwitchBranchDialog(
          dialogRequest: dialogRequest,
          onDialogTap: completer,
        ),
    DialogType.CREATE_BANK_ACCOUNT: (context, sheetRequest, completer) =>
        CreateBankAccountDialog(request: sheetRequest, completer: completer),
    DialogType.CREATE_POS_ACCOUNT: (context, sheetRequest, completer) =>
        CreatePosAccountDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
