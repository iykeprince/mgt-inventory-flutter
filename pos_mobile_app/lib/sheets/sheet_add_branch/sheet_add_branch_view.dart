import 'package:flutter/material.dart';
import 'package:pos_mobile_app/sheets/sheet_add_branch/sheet_add_branch_view.form.dart';
import 'package:pos_mobile_app/sheets/sheet_add_branch/sheet_add_branch_view_model.dart';
import 'package:pos_mobile_app/ui/admin/dashboard/add_branch/add_branch_view_model.dart';
import 'package:pos_mobile_app/utils/helpers.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../ui/admin/dashboard/add_branch/add_branch_view.dart';

@FormView(fields: [
  FormTextField(name: 'branchName'),
  FormTextField(name: 'location'),
  FormTextField(name: 'numberOfMerchants'),
])
class SheetAddBranchBottomSheet extends StatelessWidget
    with $SheetAddBranchBottomSheet {
  final SheetRequest? request;
  final Function(SheetResponse)? completer;

  SheetAddBranchBottomSheet({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SheetAddBranchViewModel>.reactive(
      viewModelBuilder: () => SheetAddBranchViewModel(),
      onModelReady: (model) => listenToFormUpdated(model),
      onDispose: (_) => disposeForm(),
      builder: (context, model, child) => BottomSheetContainer(
        color: ColorManager.kWhiteColor,
        borderRadius: BorderRadius.circular(0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InputField(
                label: AppString.branchNameText,
                hintText: AppString.branchNamePlaceholderText,
                border: InputBorder.none,
                controller: branchNameController,
                focusnode: branchNameFocusNode,
              ),
              const SizedBox(height: AppSize.s12),
              InputField(
                label: AppString.locationText,
                hintText: AppString.locationPlaceholderText,
                border: InputBorder.none,
                controller: locationController,
                focusnode: locationFocusNode,
              ),
              const SizedBox(height: AppSize.s12),
              InputField(
                label: AppString.numberOfMerchantText,
                hintText: AppString.numberOfMerchantPlaceholderText,
                border: InputBorder.none,
                controller: numberOfMerchantsController,
                focusnode: numberOfMerchantsFocusNode,
                keyBoardType: TextInputType.number,
              ),
              // Alert.primary(
              //     text: AppString.numberOfMerchantManagingThisBranchText),
              const SizedBox(height: AppSize.s12),
              PosButton(
                onPressed: () async {
                  dismissKeyboard(context);
                  await model.createBranch(completer);
                },
                title: 'Add Branch',
                busy: model.isBusy,
                disabled: !model.isFormValid,
              )
            ],
          ),
        ),
      ),
    );
  }
}
