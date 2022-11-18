import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/admin/dashboard/analytic_home/analytic_home_view.dart';
import 'package:pos_mobile_app/ui/admin/dashboard/dashboard_view_model.dart';
import 'package:pos_mobile_app/ui/merchant/dashboard/dashboard_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:stacked/stacked.dart';

import '../../../enums/transaction_status.dart';
import '../../../models/transaction.model.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminDashboardViewModel>.nonReactive(
      viewModelBuilder: () => AdminDashboardViewModel(),
      builder: (context, model, child) =>
          model.branches!.isEmpty && model.merchants!.isEmpty
              ? EmptyDashboard()
              : AnalyticHomeView(),
    );
  }
}

class EmptyDashboard extends ViewModelWidget<AdminDashboardViewModel> {
  const EmptyDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AdminDashboardViewModel model) {
    return Container(
      color: ColorManager.kBackgroundolor,
      padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p16, horizontal: AppPadding.p24),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome,',
                        style: getRegularStyle(
                            color: ColorManager.kLightGray,
                            fontSize: FontSize.s16)),
                    Text(model.admin?.businessName ?? "",
                        style: getBoldStyle(
                            color: ColorManager.kDarkCharcoal,
                            fontSize: FontSize.s20))
                  ],
                ),
                // SvgPicture.asset('assets/images/usersAvatar.svg'),
                const Spacer(),
                Image.asset(
                  'assets/images/userAvater.png',
                  width: AppSize.s48,
                  height: AppSize.s48,
                )
              ],
            ),
            const SizedBox(
              height: AppSize.s32,
            ),
            SvgPicture.asset('assets/images/IllustrationNoMessage.svg'),
            const SizedBox(
              height: AppSize.s8,
            ),
            Text(
              'Your dashboard is empty. Let’s start by creating merchant accounts for each of your business branches.',
              style: getRegularStyle(
                color: ColorManager.kNavNonActiveColor,
                fontSize: FontSize.s18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            PosButton(
              onPressed: model.navigateToCreateMerchant,
              title: 'Create Merchant Account',
              fontWeight: FontWeightManager.bold,
              fontSize: FontSize.s16,
              leadingIcon: Icons.add_circle,
              leadingIconColor: ColorManager.kWhiteColor,
              leadingIconSpace: AppSize.s24,
            )
          ],
        ),
      ),
    );
  }
}

/**
 * cleanr up later
 */

class TransactionSummaryListItem extends StatelessWidget {
  const TransactionSummaryListItem({
    Key? key,
    required this.transaction,
    this.isContentPadding = true,
  }) : super(key: key);

  final Transaction transaction;
  final bool isContentPadding;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: isContentPadding ? EdgeInsets.zero : null,
      leading: transaction.status == TransactionStatus.CREDIT
          ? SvgPicture.asset(
              'assets/images/success_tranx_icon.svg',
              fit: BoxFit.cover,
            )
          : SvgPicture.asset(
              'assets/images/danger_tranx_icon.svg',
              fit: BoxFit.cover,
            ),
      title: Text(
        transaction.title,
        style: TextStyle(
          fontSize: FontSize.s16,
          color: ColorManager.kTurquoiseDarkColor,
          fontWeight: FontWeightManager.medium,
        ),
      ),
      subtitle: Text(
        transaction.date,
        style: TextStyle(
          color: ColorManager.kNavNonActiveColor,
          fontSize: FontSize.s14,
          fontWeight: FontWeightManager.regular,
        ),
      ),
      trailing: Text(
        transaction.amount,
        style: TextStyle(
          color: transaction.status == TransactionStatus.CREDIT
              ? ColorManager.kGreen
              : ColorManager.kRed,
          fontSize: FontSize.s18,
          fontWeight: FontWeightManager.semiBold,
        ),
      ),
    );
  }
}
