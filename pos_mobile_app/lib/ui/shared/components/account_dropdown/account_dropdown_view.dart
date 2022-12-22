import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/widgets/dropdown/dropdown.dart';
import 'package:stacked/stacked.dart';

import 'account_dropdown_view_model.dart';

class AccountDropdownView extends StatelessWidget {
  const AccountDropdownView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountDropdownViewModel>.reactive(
      viewModelBuilder: () => AccountDropdownViewModel(),
      builder: (context, model, child) {
        return PosDropDownField(
          hint: 'Select item',
          dropdownItems: [
            'All POS',
            ...model.accounts!
                .map((e) => e.accountDetail!.serviceProviderName!)
                .toList(),
          ],
          value: model.selectedValue!,
          onChanged: model.handleSelectedValue,
        );
      },
    );
  }
}
