import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pos_mobile_app/ui/merchant/dashboard/create_logs/new_transactions/log_new_transaction_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

class LogNewTransactionView extends StatelessWidget {
  LogNewTransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => LogNewTransactionViewModel(),
        onModelReady: (model) {},
        builder: (context, model, child) {
          return Scaffold(
            appBar: Navbar(
              title: AppString.logNewTranscationText,
              // leadingWidth: double.infinity,
              onTap: () {},
              iconColor: ColorManager.kDarkCharcoal,
            ),
            backgroundColor: ColorManager.kWhiteColor,
            body: KeyboardAware(
              child: SingleChildScrollView(
                child: LogNewTransactionFormView(),
              ),
            ),
          );
        });
  }
}

class LogNewTransactionFormView
    extends ViewModelWidget<LogNewTransactionViewModel> {
  LogNewTransactionFormView({Key? key}) : super(key: key);

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context, LogNewTransactionViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: ScreenHorizontalSize, vertical: ScreenVerticalSize),
      child: Column(children: [
        InputField(
          label: AppString.iD,
          hintText: "15342",
          border: InputBorder.none,
          readOnly: true,
          fillColor: ColorManager.kGreyOpacity2,
          hintColor: ColorManager.kDarkCharcoal,
          labelStyle: getRegularStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s14),
        ),
        const SizedBox(height: AppSize.s16),
        // DropDownField(
        //   label: AppString.accountDetails,
        //   hint: AppString.selectAccountDetails,
        //   dropdownItems: items,
        //   value: selectedValue,
        //   buttonWidth: double.infinity,
        //   buttonHeight: 56.0,
        //   labelStyle: getRegularStyle(
        //       color: ColorManager.kDarkCharcoal, fontSize: FontSize.s14),
        //   buttonDecoration:
        //       const BoxDecoration(color: ColorManager.kInputBgColor),
        //   onChanged: (value) => print(value),
        // ),
        // const SizedBox(height: AppSize.s16),
        DatePicker(
          label: AppString.date,
          hintText: AppString.dateformat,
          // controller: _issueDateController,
          dateFormat: 'dd-MM-yyyy',
          onSelected: (datePicked) {
            print(datePicked);
          },
          lastDate: DateTime.now(),
        ),
        const SizedBox(height: AppSize.s16),
        InputField(
          label: AppString.transactionType,
          hintText: AppString.selectTransactionType,
          border: InputBorder.none,
          labelStyle: getRegularStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s14),
          // controller: model.fullnameController,
        ),
        const SizedBox(height: AppSize.s16),
        PosDropDownField(
          label: AppString.expenseType,
          hint: AppString.selectExpenseType,
          dropdownItems: items,
          value: selectedValue,
          buttonWidth: double.infinity,
          buttonHeight: 56.0,
          labelStyle: getRegularStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s14),
          buttonDecoration:
              const BoxDecoration(color: ColorManager.kInputBgColor),
          onChanged: (value) => print(value),
        ),
        const SizedBox(height: AppSize.s16),
        InputField(
          label: AppString.amount,
          hintText: AppString.fullnamePlaceholderText,
          border: InputBorder.none,
          labelStyle: getRegularStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s14),
          // controller: model.fullnameController,
        ),
        const SizedBox(height: AppSize.s16),
        InputField(
          label: AppString.bankCharge,
          hintText: AppString.amountPlaceholder,
          border: InputBorder.none,
          labelStyle: getRegularStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s14),
          // controller: model.fullnameController,
        ),
        const SizedBox(height: AppSize.s16),
        InputField(
          label: AppString.serviceCharge,
          hintText: AppString.amountPlaceholder,
          border: InputBorder.none,
          labelStyle: getRegularStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s14),
          // controller: model.fullnameController,
        ),
        const SizedBox(height: AppSize.s16),
        PosDropDownField(
          label: AppString.serviceChargePayment,
          hint: AppString.serviceChargePaymentMethod,
          dropdownItems: items,
          value: selectedValue,
          buttonWidth: double.infinity,
          buttonHeight: 56.0,
          labelStyle: getRegularStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s14),
          buttonDecoration: BoxDecoration(color: ColorManager.kInputBgColor),
          onChanged: (value) => print(value),
        ),
        const SizedBox(height: AppSize.s16),
        Textarea(
          label: AppString.comment,
          maxLines: 8,
          maxLength: 1000,
          keyBoardType: TextInputType.multiline,
          hintText: AppString.additionalInfo,
          border: InputBorder.none,
          labelStyle: getRegularStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s14),
          // controller: model.fullnameController,
        ),
        const SizedBox(height: AppSize.s40),
        PosButton(onPressed: () {}, title: AppString.logTransaction)
      ]),
    );
    ;
  }
}
