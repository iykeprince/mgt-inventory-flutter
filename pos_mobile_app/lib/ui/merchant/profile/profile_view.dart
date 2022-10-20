import 'package:flutter/material.dart';
import 'package:pos_mobile_app/ui/merchant/profile/profile_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.nonReactive(
        viewModelBuilder: () => ProfileViewModel(),
        builder: (context, model, child) => Container(
              color: Colors.white,
              width: double.infinity,
              child: SafeArea(
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
                    Container(
                      color: ColorManager.kBackgroundolor,
                      padding: const EdgeInsets.all(AppPadding.p24),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AvatarWidget(
                            text: 'FK',
                            isEdit: false,
                            color: ColorManager.kPrimaryColor,
                            onClicked: () {},
                          ),
                          const SizedBox(
                            height: AppSize.s12,
                          ),
                          Text(
                            'Taiwo Kehinde',
                            style: getThickStyle(
                                color: ColorManager.kDarkCharcoal,
                                fontSize: FontSize.s20),
                          ),
                          const SizedBox(
                            height: AppSize.s4,
                          ),
                          Text(
                            'taiwokehinde@gmail.com',
                            style: getMediumStyle(
                                color: ColorManager.kGrey1,
                                fontSize: FontSize.s16),
                          ),
                          const SizedBox(
                            height: AppSize.s12,
                          ),
                          Text(AppString.merchant,
                              style: getBoldStyle(
                                  color: ColorManager.kPrimaryColor,
                                  fontSize: FontSize.s16)),
                        ],
                      ),
                    ),
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
                      title: AppString.changePasswordText,
                      onTap: () {},
                    ),
                    ProfileItem(
                      title: AppString.howItWorksText,
                      onTap: () {},
                    ),
                    ProfileItem(
                        title: AppString.needHelpText,
                        onTap: () {},
                        showBottomBorder: false),
                    const SizedBox(
                      height: AppSize.s32,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: ScreenHorizontalSize),
                      child: PosButton(
                        onPressed: () {},
                        title: AppString.logout,
                        buttonBgColor: ColorManager.kTransparent,
                        buttonTextColor: ColorManager.kRed,
                        border: Border.all(
                            width: 1.0, color: ColorManager.kGreyBtn),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
