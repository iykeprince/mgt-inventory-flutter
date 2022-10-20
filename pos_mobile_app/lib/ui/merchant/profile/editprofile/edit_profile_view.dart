import 'package:flutter/material.dart';
import 'package:pos_mobile_app/ui/merchant/profile/editprofile/edit_profile_view_model.dart';
import 'package:pos_mobile_app/utils/helpers.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditProfileViewModel>.nonReactive(
      viewModelBuilder: () => EditProfileViewModel(),
      onModelReady: (model) {
        model.fullnameController.text = model.merchant?.name ?? "";
        model.emailController.text = model.merchant?.user?.email ?? "";
        model.addressController.text = model.merchant?.address ?? "";
        model.phoneController.text = model.merchant?.contactPhone ?? "";

        print('merchnat profile: ${model.merchant?.toJson()}');
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
                text: getInitials(model.merchant?.name ?? ''),
                isEdit: true,
                color: ColorManager.kPrimaryColor,
                onClicked: () {},
              ),
              const SizedBox(
                height: AppSize.s12,
              ),
              const EditProfileFormView()
            ],
          )),
        ),
      ),
    );
  }
}

class EditProfileFormView extends ViewModelWidget<EditProfileViewModel> {
  const EditProfileFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, EditProfileViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: AppSize.s40),
        InputField(
          label: AppString.fullNameText,
          hintText: AppString.fullnamePlaceholderText,
          border: InputBorder.none,
          labelStyle: getBoldStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s16),
          controller: model.fullnameController,
        ),
        const SizedBox(height: AppSize.s16),
        InputField(
          label: AppString.emailAddress,
          hintText: AppString.emailAddressPlaceholder,
          border: InputBorder.none,
          labelStyle: getBoldStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s16),
          controller: model.emailController,
        ),
        const SizedBox(height: AppSize.s16),
        InputField(
          label: AppString.addressText,
          hintText: AppString.sampleAddressText,
          border: InputBorder.none,
          labelStyle: getBoldStyle(
            color: ColorManager.kDarkCharcoal,
            fontSize: FontSize.s16,
          ),
          controller: model.addressController,
        ),
        const SizedBox(height: AppSize.s16),
        InputField(
          label: AppString.contactNumberText,
          hintText: AppString.samplePhoneText,
          border: InputBorder.none,
          labelStyle: getBoldStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s16),
          controller: model.phoneController,
        ),
        const SizedBox(height: AppSize.s16),
        InputField(
          label: AppString.branchNameText,
          hintText:
              model.merchant?.branch?.name ?? AppString.samplebranchNameText,
          border: InputBorder.none,
          readOnly: true,
          fillColor: ColorManager.kGreyOpacity2,
          hintColor: ColorManager.kDarkCharcoal,
          labelStyle: getBoldStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s16),

          // onChanged: ,
        ),
        const SizedBox(height: AppSize.s32),
        if (model.hasError)
          Alert.primary(
            text: '${model.modelError}',
          ),
        if (model.hasError) const SizedBox(height: AppSize.s20),
        PosButton(
          onPressed: model.updateMerchant,
          title: AppString.updateDetailsText,
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
