import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pos_mobile_app/models/suggestion.model.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/admin_branch_detail/admin_branch_detail_view_model.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/admin_manage_merchant_account/admin_manage_merchant_account_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../../../models/merchant.model.dart';
import '../../../../models/branch.model.dart';

class AdminBranchDetailView extends StatelessWidget {
  const AdminBranchDetailView({
    Key? key,
    required this.branch,
  }) : super(key: key);
  final Branch branch;

  static String _displayStringForOption(Suggestion option) =>
      option.description;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminBranchDetailViewModel>.reactive(
      viewModelBuilder: () => AdminBranchDetailViewModel(),
      onModelReady: (model) {
        model.fetchAccounts();
        model.locationController.text = branch.name!;
        model.updateBranchId(branch.id);
        model.updateBranchName(branch.name);
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: ColorManager.kWhiteColor,
        appBar: Navbar(
          title: branch.name,
          onTap: model.navigateBack,
          iconColor: ColorManager.kDarkCharcoal,
        ),
        body: KeyboardAware(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p24,
                vertical: AppPadding.p16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSize.s20),
                  BranchDetailItem(
                    label: 'Location',
                    content: model.isEditMode
                        ? Autocomplete<Suggestion>(
                            displayStringForOption: _displayStringForOption,
                            optionsBuilder:
                                (TextEditingValue textEditingValue) async {
                              if (textEditingValue.text == '') {
                                return const Iterable<Suggestion>.empty();
                              }
                              await model
                                  .handleSuggestion(textEditingValue.text);

                              return model.suggestions
                                  .where((Suggestion option) {
                                return option.description
                                    .toLowerCase()
                                    .contains(
                                        textEditingValue.text.toLowerCase());
                              });
                            },
                            onSelected: (Suggestion selection) {
                              debugPrint(
                                  'You just selected ${_displayStringForOption(selection)}');
                              model.updateLocation(
                                  _displayStringForOption(selection));
                            },
                            fieldViewBuilder: (context, textEditingController,
                                    focusNode, onFieldSubmitted) =>
                                InputField(
                              controller: textEditingController,
                              focusnode: focusNode,
                              onTap: onFieldSubmitted,
                            ),
                          )
                        : Text(
                            branch.location!,
                            style: const TextStyle(
                              color: ColorManager.kTurquoiseDarkColor,
                              fontSize: FontSize.s16,
                              fontWeight: FontWeightManager.regular,
                            ),
                          ),
                  ),
                  if (model.busy(LOCATION_SUGGESTION_REQUEST))
                    const LinearProgressIndicator(),
                  if (model.hasErrorForKey(LOCATION_SUGGESTION_REQUEST))
                    Alert.primary(
                      text: model.error(LOCATION_SUGGESTION_REQUEST).toString(),
                    ),
                  const SizedBox(height: AppSize.s20),
                  const Divider(),
                  const SizedBox(height: AppSize.s20),
                  BranchDetailItem(
                    label: "Merchants",
                    content: model.isEditMode
                        ? Row(
                            children: [
                              Expanded(
                                child: MultiselectDropdown(
                                  hintText: 'Merchant',
                                  items: model.merchants!
                                      .map((e) => e.name!)
                                      .toList(),
                                  onSelectItem: (value) {
                                    model.setSelectedMerchantItem(value);
                                  },
                                ),
                              ),
                              const SizedBox(width: AppSize.s12),
                              PosButton(
                                onPressed: () =>
                                    model.assignMerchantToBranch(branch.id!),
                                title: '',
                                leadingIcon: model
                                        .busy(ASSIGN_MERCHANT_TO_BRANCH_REQUEST)
                                    ? Icons.more_horiz
                                    : Icons.check,
                                paddingHorizontal: 0,
                                paddingVertical: 0,
                                buttonType: ButtonType.text,
                                buttonTextColor: ColorManager.kDarkColor,
                                busy: model
                                    .busy(ASSIGN_MERCHANT_TO_BRANCH_REQUEST),
                                busyColor: ColorManager.kDarkCharcoal,
                              )
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: model.merchants!
                                .where(
                                    (element) => element.branchId == branch.id)
                                .map(
                                  (e) => Container(
                                    margin: const EdgeInsets.only(
                                        bottom: AppSize.s8),
                                    child: Text(
                                      e.name!,
                                      style: const TextStyle(
                                        color: ColorManager.kTurquoiseDarkColor,
                                        fontSize: FontSize.s16,
                                        fontWeight: FontWeightManager.regular,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                  ),
                  model.hasErrorForKey(ASSIGN_MERCHANT_TO_BRANCH_REQUEST)
                      ? Text(model.error(ASSIGN_MERCHANT_TO_BRANCH_REQUEST))
                      : Container(),
                  const SizedBox(height: AppSize.s20),
                  const Divider(),
                  const SizedBox(height: AppSize.s20),
                  BranchDetailItem(
                    label: 'POS Name',
                    trailing: model.isEditMode
                        ? GestureDetector(
                            onTap: () {
                              model.showDialogCreatePOSAccount();
                            },
                            child: const Text(
                              'Add New',
                              style: TextStyle(
                                  color: ColorManager.kPrimaryColor,
                                  fontSize: FontSize.s14,
                                  fontWeight: FontWeightManager.medium),
                            ),
                          )
                        : Container(),
                    content: model.isEditMode
                        ? Row(
                            children: [
                              Expanded(
                                child: MultiselectDropdown(
                                  hintText: 'POS Accounts',
                                  items: model.accounts!
                                      .where((element) =>
                                          element.accountType == "POS")
                                      .map((e) => e.accountDetail!.accountName!)
                                      .toList(),
                                  onSelectItem: (value) {
                                    model.setSelectedPosAccount(value);
                                  },
                                ),
                              ),
                              const SizedBox(width: AppSize.s12),
                              PosButton(
                                onPressed: () =>
                                    model.assignPosAccountToBranch(branch.id!),
                                title: '',
                                leadingIcon: model.busy(
                                        ASSIGN_POS_ACCOUNT_TO_BRANCH_REQUEST)
                                    ? Icons.more_horiz
                                    : Icons.check,
                                paddingHorizontal: 0,
                                paddingVertical: 0,
                                buttonType: ButtonType.text,
                                buttonTextColor: ColorManager.kDarkColor,
                                busy: model
                                    .busy(ASSIGN_POS_ACCOUNT_TO_BRANCH_REQUEST),
                                busyColor: ColorManager.kDarkCharcoal,
                              )
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: model.accounts!
                                .where((element) =>
                                    element.accountType == "POS" &&
                                    element.branchId!.contains(branch.id))
                                .map(
                                  (e) => Container(
                                    margin: const EdgeInsets.only(
                                        bottom: AppSize.s8),
                                    child: Text(
                                      '${e.accountDetail!.accountName} ',
                                      style: const TextStyle(
                                        color: ColorManager.kTurquoiseDarkColor,
                                        fontSize: FontSize.s16,
                                        fontWeight: FontWeightManager.regular,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                  ),
                  model.hasErrorForKey(ASSIGN_POS_ACCOUNT_TO_BRANCH_REQUEST)
                      ? Text(model.error(ASSIGN_POS_ACCOUNT_TO_BRANCH_REQUEST))
                      : Container(),
                  const SizedBox(height: AppSize.s20),
                  const Divider(),
                  const SizedBox(height: AppSize.s20),
                  BranchDetailItem(
                    label: 'Bank Account Details',
                    trailing: model.isEditMode
                        ? GestureDetector(
                            onTap: () {
                              model.showDialogCreateBankAccount();
                            },
                            child: const Text(
                              'Add New',
                              style: TextStyle(
                                  color: ColorManager.kPrimaryColor,
                                  fontSize: FontSize.s14,
                                  fontWeight: FontWeightManager.medium),
                            ),
                          )
                        : Container(),
                    content: model.isEditMode
                        ? Row(
                            children: [
                              Expanded(
                                child: MultiselectDropdown(
                                  hintText: 'Bank Accounts',
                                  items: model.accounts!
                                      .where((element) =>
                                          element.accountType == "BANK")
                                      .map((e) =>
                                          '${e.accountDetail!.accountName!} - ${e.accountDetail!.serviceProviderName}')
                                      .toList(),
                                  onSelectItem: (value) {
                                    model.setSelectedBankAccount(value);
                                  },
                                ),
                              ),
                              PosButton(
                                onPressed: () =>
                                    model.assignBankAccountToBranch(branch.id!),
                                title: '',
                                leadingIcon: model.busy(
                                        ASSIGN_BANK_ACCOUNT_TO_BRANCH_REQUEST)
                                    ? Icons.more_horiz
                                    : Icons.check,
                                paddingHorizontal: 0,
                                paddingVertical: 0,
                                buttonType: ButtonType.text,
                                buttonTextColor: ColorManager.kDarkColor,
                                busy: model.busy(
                                    ASSIGN_BANK_ACCOUNT_TO_BRANCH_REQUEST),
                                busyColor: ColorManager.kDarkCharcoal,
                              )
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: model.accounts!
                                .where((element) =>
                                    element.accountType == "BANK" &&
                                    element.branchId!.contains(branch.id))
                                .map(
                                  (e) => Container(
                                    margin: const EdgeInsets.only(
                                        bottom: AppSize.s8),
                                    child: Text(
                                      '${e.accountDetail!.serviceProviderName} - ${e.accountDetail!.accountName!} - ${e.accountDetail!.accountNo!}',
                                      style: const TextStyle(
                                        color: ColorManager.kTurquoiseDarkColor,
                                        fontSize: FontSize.s16,
                                        fontWeight: FontWeightManager.regular,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                  ),
                  model.hasErrorForKey(ASSIGN_BANK_ACCOUNT_TO_BRANCH_REQUEST)
                      ? Text(model.error(ASSIGN_BANK_ACCOUNT_TO_BRANCH_REQUEST))
                      : Container(),
                  const SizedBox(height: AppSize.s40),
                  if (model.hasErrorForKey(UPDATE_FORM_REQUEST))
                    Alert.primary(
                        text: model.error(UPDATE_FORM_REQUEST).toString()),
                  PosButton(
                    onPressed: () {
                      if (!model.isEditMode) {
                        model.editForm();
                      } else {
                        model.updateForm();
                      }
                    },
                    title: !model.isEditMode
                        ? AppString.editBranchDetail
                        : AppString.updateBranchDetailText,
                    buttonBgColor: ColorManager.kLightGreen1,
                    buttonTextColor: ColorManager.kPrimaryColor,
                    fontSize: FontSize.s16,
                    fontWeight: FontWeightManager.bold,
                    border: Border.all(
                      color: ColorManager.kBorderLightGreen,
                      width: 1,
                    ),
                    leadingIcon: Icons.edit,
                    leadingIconSpace: AppSize.s12,
                    borderRadius: AppSize.s8,
                    busy: model.busy(UPDATE_FORM_REQUEST),
                  ),
                  const SizedBox(height: AppSize.s24),
                  PosButton(
                    onPressed: () => model.showDeleteBranchDialog(branch.id!),
                    title: AppString.deleteBranchText,
                    buttonBgColor: ColorManager.kTransparent,
                    buttonTextColor: ColorManager.kRed,
                    busy: model.isBusy,

                    // border: Border.all(width: 1.0, color: ColorManager.kGreyBtn),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BranchDetailItem extends StatelessWidget {
  const BranchDetailItem({
    Key? key,
    required this.label,
    required this.content,
    this.trailing,
  }) : super(key: key);
  final String label;
  final Widget content;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s14,
                      fontWeight: FontWeightManager.medium),
                ),
                if (trailing != null) trailing ?? Container(),
              ],
            ),
            SizedBox(height: AppSize.s8),
            content,
          ],
        ),
      ],
    );
  }
}
