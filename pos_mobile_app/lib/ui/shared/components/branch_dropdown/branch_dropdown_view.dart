import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/widgets/dropdown/dropdown.dart';
import 'package:stacked/stacked.dart';

import 'branch_dropdown_view_model.dart';

class BranchDropdownView extends StatelessWidget {
  const BranchDropdownView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BranchDropdownViewModel>.reactive(
      viewModelBuilder: () => BranchDropdownViewModel(),
      builder: (context, model, child) {
        return PosDropDownField(
          hint: 'Select item',
          dropdownItems: [
            'All',
            ...model.branches!.map((e) => e.name!).toList(),
          ],
          value: model.selectedValue!,
          onChanged: model.handleSelectedValue,
        );
      },
    );
  }
}
