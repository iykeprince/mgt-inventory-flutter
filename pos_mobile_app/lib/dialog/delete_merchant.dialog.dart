import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked_services/stacked_services.dart';

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
    // return ShowDialogContainer(
    //   title: '${request!.title}',
    //   onPressed: () {
    //     completer(DialogResponse(confirmed: true, data: 'CANCELLED'));
    //   },
    //   child: Column(
    //     children: [
    //       const SizedBox(height: AppSize.s20),
    //       const Text(
    //         'This action is immediate and can not be undone. All transactions carried out by the merchant will be deleted permanently. Are you sure you want to continue?',
    //         style: TextStyle(
    //           color: ColorManager.kDarkCharcoal,
    //           fontSize: AppSize.s16,
    //           fontWeight: FontWeight.w500,
    //         ),
    //         textAlign: TextAlign.center,
    //       ),
    //       const SizedBox(height: AppSize.s24),
    //       Row(
    //         children: [
    //           Expanded(
    //             child: PosButton(
    //               title: 'Delete',
    //               buttonTextColor: ColorManager.kWhiteColor,
    //               buttonBgColor: ColorManager.kRed,
    //               leadingIcon: Icons.delete,
    //               leadingIconColor: ColorManager.kWhiteColor,
    //               onPressed: () {
    //                 completer(DialogResponse(
    //                     confirmed: true, data: 'DELETE_MERCHANT'));
    //               },
    //             ),
    //           ),
    //           const SizedBox(width: AppSize.s16),
    //           Expanded(
    //             child: PosButton(
    //               title: 'Cancel',
    //               buttonTextColor: ColorManager.kDarkCharcoal,
    //               buttonBgColor: ColorManager.kBgSmokeWhite,
    //               onPressed: () {
    //                 completer(
    //                     DialogResponse(confirmed: true, data: 'CANCELLED'));
    //               },
    //             ),
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    // );
    return Dialog(
        child: Container(
      height: 290,
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
          Padding(
            padding: const EdgeInsets.all(AppSize.s8),
            child: Column(
              children: [
                const SizedBox(height: AppSize.s20),
                Container(
                  child: const Center(
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
                const SizedBox(height: AppSize.s14),
                Container(
                  width: double.infinity,
                  height: AppSize.s1_5,
                  color: ColorManager.kAzureishWhite,
                ),
                const SizedBox(height: AppSize.s24),
                const Text(
                  'This action is immediate and can not be undone. All transactions carried out by the merchant will be deleted permanently. Are you sure you want to continue?',
                  style: TextStyle(
                    color: ColorManager.kDarkCharcoal,
                    fontSize: AppSize.s14,
                    fontWeight: FontWeightManager.bold,
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
                          completer(DialogResponse(
                              confirmed: true, data: 'DELETE_MERCHANT'));
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
