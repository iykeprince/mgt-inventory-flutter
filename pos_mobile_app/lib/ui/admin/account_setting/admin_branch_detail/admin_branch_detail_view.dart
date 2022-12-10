import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminBranchDetailViewModel>.reactive(
      viewModelBuilder: () => AdminBranchDetailViewModel(),
      onModelReady: (model) {
        model.fetchAccounts();
        model.locationController.text = branch.name!;
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
                        ? InputField(
                            hintText: 'Location',
                            controller: model.locationController,
                          )
                        : Text(
                            branch.name!,
                            style: const TextStyle(
                              color: ColorManager.kTurquoiseDarkColor,
                              fontSize: FontSize.s16,
                              fontWeight: FontWeightManager.regular,
                            ),
                          ),
                  ),
                  const SizedBox(height: AppSize.s20),
                  const Divider(),
                  const SizedBox(height: AppSize.s20),
                  BranchDetailItem(
                    label: "Merchants",
                    content: model.isEditMode
                        ? MultiselectDropdown(
                            hintText: 'Merchant',
                            items:
                                model.merchants!.map((e) => e.name!).toList(),
                            onSelectItem: (value) {
                              print(value);
                              // model.setSelectedMerchantItem(value);
                            },
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: model.merchants!
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
                        ? MultiselectDropdown(
                            hintText: 'POS Accounts',
                            items: model.accounts!
                                .where(
                                    (element) => element.accountType == "POS")
                                .map((e) => e.accountDetail!.accountName!)
                                .toList(),
                            onSelectItem: (value) {
                              print(value);
                              // model.setSelectedMerchantItem(value);
                            },
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: model.accounts!
                                .where(
                                    (element) => element.accountType == "POS")
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
                        ? MultiselectDropdown(
                            hintText: 'Bank Accounts',
                            items: model.accounts!
                                .where(
                                    (element) => element.accountType == "BANK")
                                .map((e) =>
                                    '${e.accountDetail!.accountName!} - ${e.accountDetail!.serviceProviderName}')
                                .toList(),
                            onSelectItem: (value) {
                              print(value);
                              // model.setSelectedMerchantItem(value);
                            },
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: model.accounts!
                                .where(
                                    (element) => element.accountType == "BANK")
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
                  const SizedBox(height: AppSize.s40),
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
                    busy: model.isBusy,
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
