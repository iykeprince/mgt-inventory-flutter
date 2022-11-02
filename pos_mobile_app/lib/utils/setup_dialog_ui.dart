import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:pos_mobile_ui_package/utils/values_manager.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../enums/dialog_type.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.DELETE_MERCHANT_ACCOUNT: (context, sheetRequest, completer) =>
        DeleteMerchantDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

class DeleteMerchantDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const DeleteMerchantDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      height: 280,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            const Positioned(
              top: AppSize.s4,
              right: AppSize.s4,
              child: Icon(
                Icons.cancel_sharp,
                color: ColorManager.kGrey,
                size: AppSize.s20,
              ),
            ),
            Column(
              children: [
                const SizedBox(height: AppSize.s20),
                Container(
                  child: Center(
                    child: Text(
                      'Delete Merchant Account',
                      style: TextStyle(
                        color: ColorManager.kRed,
                        fontSize: AppSize.s20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSize.s24),
                const Text(
                  'This action is immediate and can not be undone. All transactions carried out by the merchant will be deleted permanently. Are you sure you want to continue?',
                  style: TextStyle(
                    color: ColorManager.kDarkCharcoal,
                    fontSize: AppSize.s16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSize.s24),
                Row(
                  children: [
                    Expanded(
                      child: PosButton(
                        title: 'Delete',
                        buttonTextColor: ColorManager.kWhiteColor,
                        buttonBgColor: ColorManager.kRed,
                        leadingIcon: Icons.delete,
                        leadingIconColor: ColorManager.kWhiteColor,
                        onPressed: () {
                          completer(DialogResponse(confirmed: true));
                        },
                      ),
                    ),
                    const SizedBox(width: AppSize.s16),
                    Expanded(
                      child: PosButton(
                        title: 'Cancel',
                        buttonTextColor: ColorManager.kDarkCharcoal,
                        buttonBgColor: ColorManager.kBgSmokeWhite,
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    )
        // ],
        // ),
        );
  }
}
