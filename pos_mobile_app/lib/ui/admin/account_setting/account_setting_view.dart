import 'package:flutter/material.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/account_setting_view_model.dart';
import 'package:pos_mobile_app/ui/merchant/profile/profile_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import '../../../utils/helpers.dart';

class AccountSettingView extends StatelessWidget {
  const AccountSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountSettingViewModel>.nonReactive(
        viewModelBuilder: () => AccountSettingViewModel(),
        onModelReady: (model) {
          // print('Merchant profile: ${model.merchant?.toJson() ?? Null}');
        },
        builder: (context, model, child) => Container(
              color: Colors.white,
              width: double.infinity,
              child: SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TabHeader(
                        title: AppString.accountSettingsText,
                        margin: EdgeInsets.only(
                            bottom: AppMargin.m10, top: AppMargin.m10),
                      ),
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                      ProfileAvatarWidget(),
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                      ProfileItem(
                        title: AppString.editProfileDetailsText,
                        onTap: () {
                          model.navigateToEditProfile();
                        },
                      ),
                      ProfileItem(
                        title: AppString.manageMerchantAccounts,
                        onTap: model.navigateToManageMerchantAccount,
                      ),
                      ProfileItem(
                        title: AppString.manageBranches,
                        onTap: model.navigateToManageBranches,
                      ),
                      ProfileItem(
                        title: AppString.manageReportSettings,
                        onTap: model.navigateToManageReportSettings,
                      ),
                      ProfileItem(
                        title: AppString.changePasswordText,
                        onTap: model.navigateToChangePassword,
                      ),
                      ProfileItem(
                        title: AppString.howItWorksText,
                        onTap: model.navigateToHowItWorks,
                      ),
                      ProfileItem(
                        title: AppString.needHelpText,
                        onTap: model.navigateToContactSupport,
                      ),
                      ProfileItem(
                        title: AppString.termsOfUseAndPrivacyPolicy,
                        onTap: model.openTermsOfUseAndPrivacyPolicy,
                        showBottomBorder: false,
                      ),
                      ProfileItem(
                        title: AppString.deleteAccount,
                        onTap: model.navigateToDeleteAccount,
                        showBottomBorder: false,
                        textColor: ColorManager.kRed,
                      ),
                      const SizedBox(
                        height: AppSize.s32,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: ScreenHorizontalSize),
                        child: PosButton(
                          onPressed: model.logout,
                          title: AppString.logout,
                          buttonBgColor: ColorManager.kTransparent,
                          buttonTextColor: ColorManager.kRed,
                          border: Border.all(
                              width: 1.0, color: ColorManager.kGreyBtn),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s100,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}

class ProfileAvatarWidget extends ViewModelWidget<AccountSettingViewModel> {
  const ProfileAvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AccountSettingViewModel model) {
    return Column(
      children: [
        Container(
          color: ColorManager.kBackgroundolor,
          padding: const EdgeInsets.all(AppPadding.p24),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AvatarWidget(
                imgUrl: model.admin?.imgUrl,
                // onClicked: model.handleImageSelect,
                onGalleryClicked: model.handleGallerySelect,
                onCameraClicked: model.handleCameraSelect,
                onBrowseFileClicked: model.handleBrowseFileSelect,
                text: getInitials(model.admin?.businessName ?? ''),
                isEdit: false,
                color: ColorManager.kPrimaryColor,
              ),
              const SizedBox(
                height: AppSize.s12,
              ),
              Text(
                model.admin?.businessName ?? '',
                style: getThickStyle(
                    color: ColorManager.kDarkCharcoal, fontSize: FontSize.s20),
              ),
              const SizedBox(
                height: AppSize.s4,
              ),
              Text(
                model.admin?.businessEmail ?? '',
                style: getMediumStyle(
                    color: ColorManager.kGrey1, fontSize: FontSize.s16),
              ),
              const SizedBox(
                height: AppSize.s12,
              ),
              Text(AppString.admin,
                  style: getBoldStyle(
                      color: ColorManager.kPrimaryColor,
                      fontSize: FontSize.s16)),
            ],
          ),
        ),
        model.isBusy ? const LinearProgressIndicator() : Container(),
      ],
    );
  }
}
