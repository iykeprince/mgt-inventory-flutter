import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked_services/stacked_services.dart';

class DeleteBranchDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const DeleteBranchDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      height: 290,
      child: Stack(
        children: [
          Positioned(
            top: AppSize.s4,
            right: AppSize.s4,
            child: GestureDetector(
              onTap: () {
                completer(DialogResponse(confirmed: false));
              },
              child: const Icon(
                Icons.cancel_sharp,
                color: ColorManager.kGrey,
                size: AppSize.s20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSize.s8),
            child: Column(
              children: [
                const SizedBox(height: AppSize.s20),
                Container(
                  child: const Center(
                    child: Text(
                      'Delete Branch',
                      style: TextStyle(
                        color: ColorManager.kRed,
                        fontSize: AppSize.s20,
                        fontWeight: FontWeightManager.medium,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSize.s14),
                Container(
                  width: double.infinity,
                  height: AppSize.s1_5,
                  color: ColorManager.kAzureishWhite,
                ),
                const SizedBox(height: AppSize.s24),
                const Text(
                  'This action is immediate and can not be undone. All your data and transactions on will be deleted permanently. Are you sure you want to continue?',
                  style: TextStyle(
                    color: ColorManager.kDarkCharcoal,
                    fontSize: AppSize.s14,
                    fontWeight: FontWeightManager.medium,
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
                        leadingIcon: Icons.delete_forever,
                        leadingIconColor: ColorManager.kWhiteColor,
                        onPressed: () {
                          completer(
                            DialogResponse(
                              confirmed: true,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: AppSize.s16),
                    Expanded(
                      child: PosButton(
                        title: 'Cancel',
                        buttonTextColor: ColorManager.kDarkCharcoal,
                        buttonBgColor: ColorManager.kBgSmokeWhite,
                        onPressed: () {
                          completer(DialogResponse(
                              confirmed: true, data: 'CANCELLED'));
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    )
        // ],
        // ),
        );
  }
}
