import 'package:flutter/material.dart';
import 'package:pos_mobile_app/ui/merchant/dashboard/create_logs/new_expense/log_new_expense_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

class LogNewExpenseView extends StatelessWidget {
  const LogNewExpenseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LogNewExpenseViewModel>.reactive(
      viewModelBuilder: () => LogNewExpenseViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: Navbar(
            title: AppString.logNewExpenseText,
            onTap: () {},
            iconColor: ColorManager.kDarkCharcoal,
          ),
          backgroundColor: ColorManager.kWhiteColor,
          body: KeyboardAware(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: ScreenHorizontalSize,
                    vertical: ScreenVerticalSize),
                child: Column(children: [
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
                        color: ColorManager.kDarkCharcoal,
                        fontSize: FontSize.s14),
                    buttonDecoration:
                        const BoxDecoration(color: ColorManager.kInputBgColor),
                    onChanged: model.handleSelectedAccountDetails,
                    value: model.selectedAccountDetailValue,
                  ),
                  DatePicker(
                    label: AppString.date,
                    hintText: AppString.dateformat,
                    // controller: _issueDateController,
                    dateFormat: 'dd-MM-yyyy',
                    onSelected: model.handleSelectedDate,
                    lastDate: DateTime.now(),
                  ),
                  const SizedBox(height: AppSize.s16),
                  InputField(
                      label: AppString.expenseName,
                      hintText: AppString.enterExpenseName,
                      border: InputBorder.none,
                      labelStyle: getRegularStyle(
                          color: ColorManager.kDarkCharcoal,
                          fontSize: FontSize.s14),
                      controller: model.expenseNameController),
                  const SizedBox(height: AppSize.s16),
                  PosDropDownField(
                    label: AppString.expenseType,
                    hint: AppString.selectExpenseType,
                    dropdownItems: model.expenseTypes,
                    value: model.selectedExpenseType,
                    dropdownWidth: 350,
                    buttonWidth: double.infinity,
                    buttonHeight: 56.0,
                    dropdownPadding: EdgeInsets.zero,
                    labelStyle: getRegularStyle(
                        color: ColorManager.kDarkCharcoal,
                        fontSize: FontSize.s14),
                    buttonDecoration:
                        const BoxDecoration(color: ColorManager.kInputBgColor),
                    onChanged: model.handleSelectedExpenseType,
                  ),
                  const SizedBox(height: AppSize.s16),
                  InputField(
                    label: AppString.amount,
                    hintText: AppString.amount,
                    border: InputBorder.none,
                    labelStyle: getRegularStyle(
                        color: ColorManager.kDarkCharcoal,
                        fontSize: FontSize.s14),
                    controller: model.amountController,
                    keyBoardType: TextInputType.number,
                  ),
                  const SizedBox(height: AppSize.s16),
                  PosDropDownField(
                    label: AppString.paymentMethod,
                    hint: AppString.selectPaymentMethod,
                    dropdownItems: model.paymentMethods,
                    value: model.paymentMethod,
                    dropdownWidth: 350,
                    buttonWidth: double.infinity,
                    buttonHeight: 56.0,
                    labelStyle: getRegularStyle(
                        color: ColorManager.kDarkCharcoal,
                        fontSize: FontSize.s14),
                    buttonDecoration:
                        const BoxDecoration(color: ColorManager.kInputBgColor),
                    onChanged: model.handleSelctedPaymentMethod,
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
                        color: ColorManager.kDarkCharcoal,
                        fontSize: FontSize.s14),
                    controller: model.commentController,
                  ),
                  const SizedBox(height: AppSize.s40),
                  PosButton(
                    onPressed: model.createExpense,
                    title: AppString.logTransaction,
                    busy: model.isBusy,
                    disabled: model.isBusy,
                  )
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
