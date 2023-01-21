import 'package:flutter/material.dart';
import 'package:pos_mobile_app/ui/shared/components/pos_account_switcher/pos_account_switcher_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

class PosAccountSwitcherView extends StatelessWidget {
  const PosAccountSwitcherView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PosAccountSwitcherViewModel>.reactive(
      viewModelBuilder: () => PosAccountSwitcherViewModel(),
      builder: (context, model, child) => PosDropDownField(
        hint: 'Select Account',
        valueStyle: getMediumStyle(
          color: ColorManager.kDarkColor,
          fontSize: FontSize.s16,
        ),
        buttonHeight: 70,
        value:
            '${model.selectedAccount?.accountDetail?.serviceProviderName!} - ${model.selectedAccount?.accountDetail?.accountName} - ${model.selectedAccount?.accountDetail?.accountNo}',
        dropdownItems: model.accounts!
            .map((e) =>
                '${e.accountDetail!.serviceProviderName!} - ${e.accountDetail!.accountName} - ${e.accountDetail!.accountNo}')
            .toList(),
        onChanged: model.handleSelectedAccount,
        buttonWidth: MediaQuery.of(context).size.width,
        buttonDecoration: const BoxDecoration(
          color: ColorManager.kLightBlue,
        ),
        buttonPadding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p24,
          vertical: AppPadding.p8,
        ),
        dropdownWidth: MediaQuery.of(context).size.width,
      ),
    );
  }
}
