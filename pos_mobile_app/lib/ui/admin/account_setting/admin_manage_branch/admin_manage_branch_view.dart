import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/admin_manage_merchant_account/admin_manage_merchant_account_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import '../../../../models/branch.model.dart';
import '../../../../models/merchant.model.dart';
import '../../../../models/user.model.dart';
import 'admin_manage_branch_view_model.dart';

class AdminManageBranchView extends StatelessWidget {
  const AdminManageBranchView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminManageBranchViewModel>.reactive(
      viewModelBuilder: () => AdminManageBranchViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: ColorManager.kWhiteColor,
        appBar: Navbar(
          title: AppString.manageBranch,
          onTap: model.navigateBack,
          iconColor: ColorManager.kDarkCharcoal,
        ),
        body: KeyboardAware(
          child: Column(
            children: [
              if (model.isBusy) const LinearProgressIndicator(),
              const SizedBox(
                height: AppSize.s12,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: model.branches!.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == model.branches!.length) {
                      return Padding(
                        padding: const EdgeInsets.all(AppSize.s24),
                        child: PosButton(
                          onPressed: model.navigateToCreateBranch,
                          title: AppString.addNewBranch,
                          borderRadius: 0,
                          leadingIcon: Icons.add,
                          leadingIconColor: ColorManager.kPrimaryColor,
                          buttonTextColor: ColorManager.kPrimaryColor,
                          fontWeight: FontWeightManager.extraBold,
                          buttonBgColor: ColorManager.kLightGreen1,
                          leadingIconSpace: AppSize.s24,
                        ),
                      );
                    } else {
                      Branch branchItem = model.branches![index];

                      return BranchItem(
                        branch: branchItem,
                        onDelete: (branch) {
                          model.showDeleteBranchDialog(branch);
                        },
                        onTap: () {
                          model.navigateToBranchDetail(branchItem);
                        },
                      );
                    }
                  },
                ),
              ),
              const BottomStickyNote(
                text:
                    "You will need to create or assign the merchant account to a newly created branch for it to be activated.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BranchItem extends StatelessWidget {
  const BranchItem({
    Key? key,
    required this.branch,
    this.onTap,
    this.onDelete,
  }) : super(key: key);
  final Branch branch;
  final Function()? onTap;
  final Function(Branch)? onDelete;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: ListTile(
        onTap: onTap,
        horizontalTitleGap: 2,
        leading: const Icon(
          Icons.account_circle_rounded,
          color: ColorManager.kPrimaryColor,
        ),
        title: Text(
          branch.name!,
          style: const TextStyle(
            fontSize: FontSize.s16,
            fontWeight: FontWeightManager.medium,
            color: ColorManager.kPrimaryColor,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: ColorManager.kDarkCharcoal,
          size: AppSize.s12,
        ),
      ),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        extentRatio: 0.2,
        children: [
          SlidableAction(
            onPressed: (context) {
              onDelete!(branch);
            },
            autoClose: true,
            backgroundColor: ColorManager.kRed,
            foregroundColor: Colors.white,
            icon: Icons.delete_forever,
            // label: 'Delete',
          ),
        ],
      ),
    );
  }
}
