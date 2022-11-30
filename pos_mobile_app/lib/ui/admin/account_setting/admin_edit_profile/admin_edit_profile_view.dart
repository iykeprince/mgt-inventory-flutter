import 'package:flutter/material.dart';
import 'package:pos_mobile_app/ui/merchant/profile/editprofile/edit_profile_view_model.dart';
import 'package:pos_mobile_app/utils/helpers.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import 'admin_edit_profile_view_model.dart';

class AdminEditProfileView extends StatelessWidget {
  const AdminEditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminEditProfileViewModel>.nonReactive(
      viewModelBuilder: () => AdminEditProfileViewModel(),
      onModelReady: (model) {
        model.businessNameController.text = model.admin?.businessName ?? "";
        model.emailController.text = model.admin?.businessEmail ?? "";
        model.homeAddressController.text = model.admin?.address ?? "";
        model.phoneController.text = model.admin?.contactPhone ?? "";

        print('admin profile: ${model.admin?.toJson()}');
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: ColorManager.kWhiteColor,
        appBar: Navbar(
          leadingText: AppString.editProfileDetailsText,
          leadingWidth: double.infinity,
          onTap: model.navigateBack,
          iconColor: ColorManager.kDarkCharcoal,
        ),
        body: KeyboardAware(
          child: SingleChildScrollView(
              child: Column(
            children: [
              const SizedBox(
                height: AppSize.s24,
              ),
              AvatarWidget(
                text: getInitials(model.admin?.businessName ?? ''),
                isEdit: true,
                color: ColorManager.kPrimaryColor,
                imgUrl: model.admin?.imgUrl,
                onClicked: model.handleImageSelect,
              ),
              const SizedBox(
                height: AppSize.s12,
              ),
              const AdminEditProfileFormView()
            ],
          )),
        ),
      ),
    );
  }
}

class AdminEditProfileFormView
    extends ViewModelWidget<AdminEditProfileViewModel> {
  const AdminEditProfileFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AdminEditProfileViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: AppSize.s40),
        InputField(
          label: AppString.businessNameText,
          hintText: AppString.businessNamePlaceholder,
          border: InputBorder.none,
          labelStyle: getBoldStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s16),
          controller: model.businessNameController,
          readOnly: !model.editProfile,
        ),
        const SizedBox(height: AppSize.s16),
        InputField(
          label: AppString.emailAddress,
          hintText: AppString.businessEmailAddressPlaceholder,
          border: InputBorder.none,
          labelStyle: getBoldStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s16),
          controller: model.emailController,
          readOnly: !model.editProfile,
        ),
        const SizedBox(height: AppSize.s16),
        InputField(
          label: AppString.contactNumberText,
          hintText: AppString.samplePhoneText,
          border: InputBorder.none,
          labelStyle: getBoldStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s16),
          controller: model.phoneController,
          readOnly: !model.editProfile,
        ),
        const SizedBox(height: AppSize.s16),
        // InputField(
        //   label: AppString.numOfBranchText,
        //   hintText: AppString.numOfBranchPlaceholder,
        //   border: InputBorder.none,
        //   labelStyle: getBoldStyle(
        //       color: ColorManager.kDarkCharcoal, fontSize: FontSize.s16),
        //   keyBoardType: TextInputType.number,
        //   controller: model.homeAddressController,
        //   readOnly: !model.editProfile,
        // ),
        InputField(
          label: AppString.addressText,
          hintText: AppString.sampleAddressText,
          border: InputBorder.none,
          labelStyle: getBoldStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s16),
          keyBoardType: TextInputType.text,
          controller: model.homeAddressController,
          readOnly: !model.editProfile,
        ),
        const SizedBox(height: AppSize.s32),
        if (model.hasError)
          Alert.primary(
            text: '${model.modelError}',
          ),
        if (model.hasError) const SizedBox(height: AppSize.s20),
        PosButton(
          onPressed: model.editProfile
              ? model.updateMerchant
              : model.handleEditProfile,
          disabled: !model.editProfile,
          title: !model.editProfile
              ? AppString.editProfileText
              : AppString.updateDetailsText,
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
        const SizedBox(height: AppSize.s20),
      ]),
    );
  }
}
