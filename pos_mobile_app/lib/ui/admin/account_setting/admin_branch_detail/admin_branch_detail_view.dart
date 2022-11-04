import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/admin_branch_detail/admin_branch_detail_view_model.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/admin_manage_merchant_account/admin_manage_merchant_account_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

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
    return ViewModelBuilder<AdminBranchDetailViewModel>.nonReactive(
      viewModelBuilder: () => AdminBranchDetailViewModel(),
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
                  SizedBox(height: AppSize.s20),
                  BranchDetailItem(
                    label: 'Location',
                    content: Text(
                      branch.name!,
                      style: TextStyle(
                        color: ColorManager.kTurquoiseDarkColor,
                        fontSize: FontSize.s16,
                        fontWeight: FontWeightManager.regular,
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s48),
                  BranchDetailItem(
                    label: "Merchants",
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Taiwo Kehinde',
                          style: TextStyle(
                            color: ColorManager.kTurquoiseDarkColor,
                            fontSize: FontSize.s16,
                            fontWeight: FontWeightManager.regular,
                          ),
                        ),
                        SizedBox(height: AppSize.s8),
                        Text(
                          'Kehinde Taiwo',
                          style: TextStyle(
                            color: ColorManager.kTurquoiseDarkColor,
                            fontSize: FontSize.s16,
                            fontWeight: FontWeightManager.regular,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.s48),
                  BranchDetailItem(
                    label: 'POS Name',
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PaySure POS',
                          style: TextStyle(
                            color: ColorManager.kTurquoiseDarkColor,
                            fontSize: FontSize.s16,
                            fontWeight: FontWeightManager.regular,
                          ),
                        ),
                        SizedBox(height: AppSize.s8),
                        Text(
                          'Calculator-Like POS',
                          style: TextStyle(
                            color: ColorManager.kTurquoiseDarkColor,
                            fontSize: FontSize.s16,
                            fontWeight: FontWeightManager.regular,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.s48),
                  BranchDetailItem(
                    label: 'Bank Account Details',
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wema ALAT - Lolade Rosemary Agbabiaka - 100017475',
                          style: TextStyle(
                            color: ColorManager.kTurquoiseDarkColor,
                            fontSize: FontSize.s16,
                            fontWeight: FontWeightManager.regular,
                          ),
                        ),
                        SizedBox(height: AppSize.s48),
                        Text(
                          'Wema ALAT - Lolade Rosemary Agbabiaka - 100017475',
                          style: TextStyle(
                            color: ColorManager.kTurquoiseDarkColor,
                            fontSize: FontSize.s16,
                            fontWeight: FontWeightManager.regular,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.s40),
                  PosButton(
                    onPressed: () {},
                    title: AppString.editBranchDetail,
                    buttonBgColor: ColorManager.kLightGreen1,
                    buttonTextColor: ColorManager.kPrimaryColor,
                    fontSize: FontSize.s16,
                    fontWeight: FontWeightManager.bold,
                    border: Border.all(
                      color: ColorManager.kBorderLightGreen,
                      width: 1,
                    ),
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
  const BranchDetailItem({Key? key, required this.label, required this.content})
      : super(key: key);
  final String label;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                  color: ColorManager.kDarkCharcoal,
                  fontSize: FontSize.s14,
                  fontWeight: FontWeightManager.medium),
            ),
            SizedBox(height: AppSize.s8),
            content,
          ],
        ),
      ],
    );
  }
}
