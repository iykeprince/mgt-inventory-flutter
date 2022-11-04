import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/admin_manage_merchant_account/admin_manage_merchant_account_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import '../../../../models/merchant.model.dart';
import '../../../../models/user.model.dart';

class AdminManageMerchantAccountView extends StatelessWidget {
  const AdminManageMerchantAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminManageMerchantAccountViewModel>.reactive(
      viewModelBuilder: () => AdminManageMerchantAccountViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: ColorManager.kWhiteColor,
        appBar: Navbar(
          title: AppString.manageMerchantAccounts,
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
                  itemCount: model.merchants.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == model.merchants.length) {
                      return Padding(
                        padding: const EdgeInsets.all(AppSize.s24),
                        child: PosButton(
                          onPressed: model.navigateToCreateMerchant,
                          title: AppString.addNewMerchantAccount,
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
                      Merchant merchantItem = model.merchants[index];

                      if (!merchantItem.user!.isVerified!) {
                        return PendingMerchantAccountItem(
                          merchant: merchantItem,
                          onDelete: (merchant) {
                            model.showDeleteMerchantDialog(merchant);
                          },
                        );
                      }
                      return MerchantAccountItem(
                        merchant: merchantItem,
                        onDelete: (merchant) {
                          model.showDeleteMerchantDialog(merchant);
                        },
                        onTap: () {
                          model.navigateToMerchantDetails();
                        },
                      );
                    }
                  },
                ),
              ),
              const BottomStickyNote(
                text:
                    "Merchants within your organization can register their merchant account a merchant account with their email has been added here.\n\nYour list will be automatically updated once they’ve registered and verified their email.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MerchantAccountItem extends StatelessWidget {
  const MerchantAccountItem({
    Key? key,
    required this.merchant,
    this.onTap,
    this.onDelete,
  }) : super(key: key);
  final Merchant merchant;
  final Function()? onTap;
  final Function(Merchant)? onDelete;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: ListTile(
        onTap: onTap,
        horizontalTitleGap: 2,
        leading: Icon(
          Icons.account_circle_rounded,
          color: ColorManager.kPrimaryColor,
        ),
        title: Text(
          merchant.name!,
          style: TextStyle(
            fontSize: FontSize.s16,
            fontWeight: FontWeightManager.medium,
            color: ColorManager.kPrimaryColor,
          ),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '747',
              style: TextStyle(
                fontSize: FontSize.s16,
                fontWeight: FontWeightManager.bold,
              ),
            ),
            Text(
              'transactions today',
              style: TextStyle(
                fontSize: FontSize.s12,
                fontWeight: FontWeightManager.regular,
                color: ColorManager.kGrey1,
              ),
            ),
          ],
        ),
      ),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        extentRatio: 0.2,
        children: [
          SlidableAction(
            onPressed: (context) {
              onDelete!(merchant);
            },
            autoClose: true,
            backgroundColor: ColorManager.kRed,
            foregroundColor: Colors.white,
            icon: Icons.delete_forever,
            label: 'Delete',
          ),
        ],
      ),
    );
  }
}

class PendingMerchantAccountItem extends StatelessWidget {
  const PendingMerchantAccountItem({
    Key? key,
    required this.merchant,
    this.onDelete,
  }) : super(key: key);
  final Merchant merchant;
  final Function(Merchant)? onDelete;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: ListTile(
        horizontalTitleGap: 0,
        leading: Icon(
          Icons.account_circle_rounded,
          color: ColorManager.kTurquoiseDarkColor,
        ),
        title: Text(
          merchant.user?.email ?? '',
          style: TextStyle(
            fontSize: FontSize.s16,
            fontWeight: FontWeightManager.medium,
          ),
        ),
        trailing: PosBadge(
          text: "PENDING",
          bgColor: ColorManager.kBadgeBgColor,
          textColor: ColorManager.kBadgeTextColor,
        ),
      ),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        extentRatio: 0.2,
        children: [
          SlidableAction(
            onPressed: (context) {
              onDelete!(merchant);
            },
            autoClose: true,
            backgroundColor: ColorManager.kRed,
            foregroundColor: Colors.white,
            icon: Icons.delete_forever,
            label: 'Delete',
          ),
        ],
      ),
    );
  }
}

class PosBadge extends StatelessWidget {
  const PosBadge({
    Key? key,
    required this.text,
    this.bgColor = ColorManager.kPrimaryColor,
    this.textColor = ColorManager.kWhiteColor,
  }) : super(key: key);
  final String text;
  final Color? bgColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: BoxDecoration(color: bgColor),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: FontSize.s12,
          fontWeight: FontWeightManager.medium,
        ),
      ),
    );
  }
}
