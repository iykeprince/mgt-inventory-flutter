import 'package:flutter/material.dart';
import 'package:pos_mobile_app/ui/merchant/profile/editprofile/edit_profile_view_model.dart';
import 'package:pos_mobile_app/utils/helpers.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import 'admin_contact_support_view_model.dart';

class AdminContactSupportView extends StatelessWidget {
  const AdminContactSupportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminContactSupportViewModel>.nonReactive(
      viewModelBuilder: () => AdminContactSupportViewModel(),
      onModelReady: (model) {},
      builder: (context, model, child) => Scaffold(
        backgroundColor: ColorManager.kWhiteColor,
        appBar: Navbar(
          leadingText: AppString.contactSupportTeamText,
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
              const AdminContactSupportFormView()
            ],
          )),
        ),
      ),
    );
  }
}

class AdminContactSupportFormView
    extends ViewModelWidget<AdminContactSupportViewModel> {
  const AdminContactSupportFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AdminContactSupportViewModel model) {
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
          controller: model.fullNameController,
          keyBoardType: TextInputType.text,
          formError: model.hasErrorForKey(SUPPORT_FULLNAME_VALIDATOR)
              ? model.error(SUPPORT_FULLNAME_VALIDATOR)
              : null,
          validationCallback: (value) =>
              value!.isEmpty ? "Full name is required " : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        const SizedBox(height: AppSize.s16),
        InputField(
          label: AppString.emailAddress,
          hintText: AppString.businessEmailAddressPlaceholder,
          border: InputBorder.none,
          labelStyle: getBoldStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s16),
          controller: model.emailController,
          keyBoardType: TextInputType.emailAddress,
          formError: model.hasErrorForKey(SUPPORT_EMAIL_VALIDATOR)
              ? model.error(SUPPORT_EMAIL_VALIDATOR)
              : null,
          validationCallback: (value) =>
              value!.isEmpty ? "Email address is required " : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        const SizedBox(height: AppSize.s16),
        PosDropDownField(
          hint: "Select category",
          value: model.selectedCategory,
          dropdownItems: model.categories,
          onChanged: (String? value) {
            model.setSelectedCategory(value);
          },
          buttonWidth: MediaQuery.of(context).size.width,
          dropdownWidth: MediaQuery.of(context).size.width,
          buttonHeight: AppSize.s56,
          buttonDecoration: BoxDecoration(
            color: ColorManager.kInputBgColor,
            borderRadius: BorderRadius.circular(AppSize.s4),
          ),
        ),
        if (model.hasErrorForKey(SUPPORT_CATEGORY_VALIDATOR))
          Alert.primary(
              text: model.error(SUPPORT_CATEGORY_VALIDATOR).toString()),
        const SizedBox(height: AppSize.s16),
        InputField(
          label: AppString.titleText,
          hintText: AppString.titlePlaceholderText,
          border: InputBorder.none,
          labelStyle: getBoldStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s16),
          controller: model.titleController,
          keyBoardType: TextInputType.text,
          formError: model.hasErrorForKey(SUPPORT_TITLE_VALIDATOR)
              ? model.error(SUPPORT_TITLE_VALIDATOR)
              : null,
          validationCallback: (value) =>
              value!.isEmpty ? "Title is required " : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        const SizedBox(height: AppSize.s16),
        Textarea(
          label: AppString.messageText,
          hintText: AppString.messagePlaceholderText,
          border: InputBorder.none,
          labelStyle: getBoldStyle(
              color: ColorManager.kDarkCharcoal, fontSize: FontSize.s16),
          keyBoardType: TextInputType.text,
          controller: model.messageController,
          formError: model.hasErrorForKey(SUPPORT_MESSAGE_VALIDATOR)
              ? model.error(SUPPORT_MESSAGE_VALIDATOR)
              : null,
          validationCallback: (value) =>
              value!.isEmpty ? "Message is required " : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        const SizedBox(height: AppSize.s16),
        //attachement.s/
        AttachmentField(
          label: "Attachments",
          onTap: model.selectFile,
        ),
        const SizedBox(height: AppSize.s8),
        model.selectedFileAttachment != null
            ? Container(
                padding: const EdgeInsets.all(AppSize.s8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorManager.kPrimaryColor,
                    width: 1,
                  ),
                ),
                child: Text(
                  model.selectedFileAttachment!.path,
                  style: getMediumStyle(
                    color: ColorManager.kDarkCharcoal,
                    fontSize: FontSize.s12,
                  ),
                ))
            : Container(),
        const SizedBox(height: AppSize.s32),
        if (model.hasError)
          Alert.primary(
            text: '${model.modelError}',
          ),
        if (model.hasError) const SizedBox(height: AppSize.s20),
        if (model.isBusy)
          Text(
            model.progressData,
            style: getRegularStyle(
              color: ColorManager.kSecondaryColor,
              fontSize: FontSize.s10,
            ),
          ),
        PosButton(
          onPressed: model.handleSubmit,
          disabled: model.isBusy,
          title: AppString.submitText,
          buttonBgColor: ColorManager.kPrimaryColor,
          buttonTextColor: ColorManager.kWhiteColor,
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
