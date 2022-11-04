import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/admin_manage_merchant_account/admin_manage_merchant_account_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import '../../../../models/merchant.model.dart';
import '../../../../models/user.model.dart';

class AdminMerchantDetailView extends StatelessWidget {
  const AdminMerchantDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminManageMerchantAccountViewModel>.nonReactive(
      viewModelBuilder: () => AdminManageMerchantAccountViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: ColorManager.kWhiteColor,
        appBar: Navbar(
          title: AppString.merchantDetails,
          onTap: model.navigateBack,
          iconColor: ColorManager.kDarkCharcoal,
        ),
        body: KeyboardAware(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: AppSize.s20),
                MerchantDetailItem(
                  label: 'Merchant Name',
                  content: Text(
                    'Taiwo Kehinde',
                    style: TextStyle(
                      color: ColorManager.kTurquoiseDarkColor,
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.regular,
                    ),
                  ),
                ),
                MerchantDetailItem(
                  label: 'Email Address',
                  content: Text(
                    'taiwokehinde@gmail.com',
                    style: TextStyle(
                      color: ColorManager.kTurquoiseDarkColor,
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.regular,
                    ),
                  ),
                ),
                MerchantDetailItem(
                  label: 'Transaction Today',
                  content: Text(
                    '797',
                    style: TextStyle(
                      color: ColorManager.kTurquoiseDarkColor,
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.regular,
                    ),
                  ),
                ),
                MerchantDetailItem(
                  label: 'Branch Name',
                  content: Text(
                    'Iyana-Itire Branch',
                    style: TextStyle(
                      color: ColorManager.kTurquoiseDarkColor,
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.regular,
                    ),
                  ),
                ),
                MerchantDetailItem(
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
                MerchantDetailItem(
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
                      SizedBox(height: AppSize.s8),
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
                SizedBox(height: AppSize.s24),
                PosButton(
                  onPressed: () {},
                  title: AppString.editMerchantDetail,
                  // buttonBgColor: ColorManager.kLightGreen1,
                  // buttonTextColor: ColorManager.kDarkCharcoal,
                  fontSize: FontSize.s16,
                  fontWeight: FontWeightManager.bold,
                  border: Border.all(
                    color: ColorManager.kBorderLightGreen,
                    width: 1,
                  ),
                  borderRadius: AppSize.s8,
                  busy: model.isBusy,
                ),
                const SizedBox(height: AppSize.s40),
                PosButton(
                  onPressed: () {},
                  title: AppString.revokeMerchantAccesss,
                  buttonBgColor: ColorManager.kTransparent,
                  buttonTextColor: ColorManager.kRed,
                  // border: Border.all(width: 1.0, color: ColorManager.kGreyBtn),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MerchantDetailItem extends StatelessWidget {
  const MerchantDetailItem(
      {Key? key, required this.label, required this.content})
      : super(key: key);
  final String label;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p24,
            vertical: AppPadding.p16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                    color: ColorManager.kDarkCharcoal,
                    fontSize: FontSize.s14,
                    fontWeight: FontWeightManager.medium),
              ),
              SizedBox(height: AppSize.s16),
              content,
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: AppSize.s1_5,
          color: ColorManager.kDividerLineDarkColor,
        ),
      ],
    );
  }
}
