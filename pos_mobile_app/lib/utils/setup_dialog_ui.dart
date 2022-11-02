import 'package:flutter/material.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/dialog/switchBranch.dialog.dart';
import 'package:pos_mobile_app/enums/dialog_type.dart';
import 'package:stacked_services/stacked_services.dart';

void setupDialogUi() {
  var dialogService = locator<DialogService>();

  var builders = {
    DialogType.switchBranch: (context, dialogRequest, completer) => Dialog(
          child: SwitchBranchDialog(
            dialogRequest: dialogRequest,
            onDialogTap: completer,
          ),
        ),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
