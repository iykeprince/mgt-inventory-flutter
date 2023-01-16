import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/merchant/dashboard/create_logs/new_transactions/log_new_transaction_view.form.dart';
import 'package:pos_mobile_app/ui/merchant/dashboard/create_logs/new_transactions/log_new_transaction_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'amount'),
  FormTextField(name: 'bankCharge'),
  FormTextField(name: 'serviceCharge'),
  FormTextField(name: 'comment'),
  FormTextField(name: 'other'),
])
class LogNewTransactionView extends StatelessWidget
    with $LogNewTransactionView {
  LogNewTransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LogNewTransactionViewModel>.nonReactive(
        viewModelBuilder: () => LogNewTransactionViewModel(),
        onModelReady: (model) => listenToFormUpdated(model),
        onDispose: (model) => disposeForm(),
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
                child: LogNewTransactionFormView(
                  amountController: amountController,
                  bankChargeController: bankChargeController,
                  serviceChargeController: serviceChargeController,
                  commentController: commentController,
                  otherController: otherController,
                ),
              ),
            ),
          );
        });
  }
}

class LogNewTransactionFormView
    extends ViewModelWidget<LogNewTransactionViewModel> {
  LogNewTransactionFormView({
    Key? key,
    required this.amountController,
    required this.bankChargeController,
    required this.serviceChargeController,
    required this.commentController,
    required this.otherController,
  }) : super(key: key);

  TextEditingController amountController;
  TextEditingController bankChargeController;
  TextEditingController serviceChargeController;
  TextEditingController commentController;
  TextEditingController otherController;

  @override
  Widget build(BuildContext context, LogNewTransactionViewModel model) {
    print('nice seleced: ${model.selectedAccountDetailValue}');
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: ScreenHorizontalSize, vertical: ScreenVerticalSize),
      child: Column(children: [
        const SizedBox(height: AppSize.s16),
        PosDropDownField(
          label: AppString.accountDetails,
          hint: AppString.selectAccountDetails,
          dropdownItems: model.accounts!
              .map((e) =>
                  '${e.accountDetail!.serviceProviderName!} - ${e.accountDetail!.accountName} - ${e.accountDetail!.accountNo}')
              .toList(),
          dropdownWidth: double.infinity,
          buttonWidth: double.infinity,
          buttonHeight: 56.0,
          labelStyle: getRegularStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s14),
          buttonDecoration:
              const BoxDecoration(color: ColorManager.kInputBgColor),
          onChanged: model.handleSelectedAccountDetails,
          value: model.selectedAccountDetailValue,
        ),
        const SizedBox(height: AppSize.s16),
        DatePicker(
          label: AppString.date,
          hintText: AppString.dateformat,
          dateFormat: 'dd-MM-yyyy',
          onSelected: model.handleSelectedDate,
          lastDate: DateTime.now(),
        ),
        const SizedBox(height: AppSize.s16),
        PosDropDownField(
          label: AppString.transactionType,
          hint: AppString.selectTransactionType,
          dropdownItems: model.transactionTypes,
          value: model.selectedTransactionType,
          dropdownWidth: double.infinity,
          buttonWidth: double.infinity,
          buttonHeight: 56.0,
          labelStyle: getRegularStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s14),
          buttonDecoration:
              const BoxDecoration(color: ColorManager.kInputBgColor),
          onChanged: model.handleSelectedTransactionType,
        ),
        if (model.showOtherInput)
          InputField(
            label: AppString.otherTransactionType,
            hintText: AppString.otherTransactionType,
            border: InputBorder.none,
            labelStyle: getRegularStyle(
                color: ColorManager.kDarkCharcoal, fontSize: FontSize.s14),
            keyBoardType: TextInputType.text,
            controller: otherController,
          ),
        const SizedBox(height: AppSize.s16),
        InputField(
          label: AppString.amount,
          hintText: AppString.fullnamePlaceholderText,
          border: InputBorder.none,
          labelStyle: getRegularStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s14),
          prefixIcon: Container(
            decoration: BoxDecoration(
              color: ColorManager.kLightBlue,
            ),
            width: AppSize.s12,
            height: AppSize.s12,
            child: Image.asset('assets/images/naira.png'),
          ),
          keyBoardType: TextInputType.number,
          controller: amountController,
        ),
        const SizedBox(height: AppSize.s16),
        InputField(
          label: AppString.bankCharge,
          hintText: AppString.amountPlaceholder,
          border: InputBorder.none,
          labelStyle: getRegularStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s14),
          keyBoardType: TextInputType.number,
          controller: bankChargeController,
        ),
        const SizedBox(height: AppSize.s16),
        InputField(
          label: AppString.serviceCharge,
          hintText: AppString.amountPlaceholder,
          border: InputBorder.none,
          labelStyle: getRegularStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s14),
          keyBoardType: TextInputType.number,
          controller: serviceChargeController,
        ),
        const SizedBox(height: AppSize.s16),
        PosDropDownField(
          label: AppString.serviceChargePayment,
          hint: AppString.serviceChargePaymentMethod,
          dropdownItems: model.serviceChargePayments,
          value: model.serviceChargePaymentMethod,
          dropdownWidth: double.infinity,
          buttonWidth: double.infinity,
          buttonHeight: 56.0,
          labelStyle: getRegularStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s14),
          buttonDecoration: BoxDecoration(color: ColorManager.kInputBgColor),
          onChanged: model.handleSelctedServiceChargePaymentMethod,
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
          controller: commentController,
        ),
        const SizedBox(height: AppSize.s40),
        PosButton(
          onPressed: model.createTransaction,
          title: AppString.logTransaction,
          busy: model.isBusy,
          disabled: model.isBusy || !model.isFormValid,
        )
      ]),
    );
    ;
  }
}
