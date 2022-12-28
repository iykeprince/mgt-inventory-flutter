import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'open_close_balance_sheet_view_model.dart';

class OpenBalanceBottomSheet extends StatelessWidget {
  final SheetRequest? request;
  final Function(SheetResponse)? completer;

  const OpenBalanceBottomSheet({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OpeningClosingBalanceSheetViewModel>.reactive(
      viewModelBuilder: () => OpeningClosingBalanceSheetViewModel(),
      onModelReady: (model) {
        if (request?.data != null) {
          model.cashController.text = '${request!.data["amount"]}';
        }
      },
      builder: (context, model, child) {
        return KeyboardAware(
          child: BottomSheetContainer(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Opening Balance',
                    style: getMediumStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s18,
                    ),
                  ),
                  const SizedBox(height: AppSize.s24),
                  InputField(
                    label: 'Cash',
                    hintText: '0.00',
                    controller: model.cashController,
                    fillColor: ColorManager.kGreyBtn,
                  ),
                  const SizedBox(height: AppSize.s24),
                  //accounts inputfields
                  // Column(
                  //   children: model.accounts!.map((e) {
                  //     int index = model.accounts!.indexOf(e);
                  //     TextEditingController controller =
                  //         TextEditingController();
                  //     model.controllers.add(controller);
                  //     return Column(
                  //       children: [
                  //         InputField(
                  //           label: e.accountDetail!.serviceProviderName!,
                  //           hintText: '0.00',
                  //           controller: controller,
                  //           fillColor: ColorManager.kGreyBtn,
                  //         ),
                  //         const SizedBox(height: AppSize.s24),
                  //       ],
                  //     );
                  //   }).toList(),
                  // ),
                  if (model.hasError)
                    Alert.primary(
                      text: '${model.modelError}',
                      textColor: ColorManager.kRed,
                    ),
                  PosButton(
                    onPressed: () async {
                      await model.createOpeningBalance();
                      completer!(
                        SheetResponse(
                          confirmed: true,
                        ),
                      );
                    },
                    title: 'Submit',
                    busy: model.isBusy,
                  ),
                  const SizedBox(height: AppSize.s24),
                  PosButton(
                    onPressed: () {
                      completer!(
                        SheetResponse(
                          confirmed: false,
                        ),
                      );
                    },
                    title: 'Cancel',
                    busy: false,
                    buttonBgColor: ColorManager.kLightGreen1,
                    border: Border.all(
                      color: ColorManager.kHowItWorksTitle.withOpacity(.5),
                    ),
                    buttonTextColor: ColorManager.kTurquoiseDarkColor,
                    fontWeight: FontWeightManager.bold,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
