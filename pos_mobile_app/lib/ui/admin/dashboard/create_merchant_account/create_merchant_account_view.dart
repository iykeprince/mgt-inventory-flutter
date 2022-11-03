import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/admin/dashboard/create_merchant_account/create_merchant_account_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:pos_mobile_ui_package/widgets/appbar/appbar.dart';
import 'package:stacked/stacked.dart';

class CreateMerchantAccountView extends StatelessWidget {
  const CreateMerchantAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateMerchantAccountViewModel>.nonReactive(
      viewModelBuilder: () => CreateMerchantAccountViewModel(),
      onModelReady: (model) {
        model.merchantNameController.text = "";
        model.emailController.text = "";
        model.branchController.text = "";
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: ColorManager.kWhiteColor,
        appBar: Navbar(
          title: AppString.createMerchantAccount,
          onTap: model.navigateBack,
          iconColor: ColorManager.kDarkCharcoal,
        ),
        body: KeyboardAware(
          child: SingleChildScrollView(
              child: Column(
            children: const [
              SizedBox(
                height: AppSize.s12,
              ),
              CreateMerchantAccountFormView()
            ],
          )),
        ),
      ),
    );
  }
}

class CreateMerchantAccountFormView
    extends ViewModelWidget<CreateMerchantAccountViewModel> {
  const CreateMerchantAccountFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CreateMerchantAccountViewModel model) {
    return SizedBox(
      height: screenHeightPercentage(context, percentage: 0.83),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
            child: Column(
              children: [
                const SizedBox(height: AppSize.s20),
                InputField(
                  label: AppString.merchantName,
                  hintText: '',
                  border: InputBorder.none,
                  labelStyle: getBoldStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s16),
                  controller: model.merchantNameController,
                ),
                const SizedBox(height: AppSize.s16),
                InputField(
                  label: AppString.emailAddress,
                  hintText: '',
                  border: InputBorder.none,
                  labelStyle: getBoldStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s16),
                  controller: model.emailController,
                ),
                const SizedBox(height: AppSize.s16),
                PosDropDownField(
                  hint: AppString.branchNameText,
                  value: model.selectedValue,
                  dropdownItems: model.branches!.map((e) => e.name!).toList(),
                  onChanged: (value) {
                    model.setBranch(value!);
                    print('value: $value');
                  },
                  label: AppString.branchNameText,
                  labelStyle: getBoldStyle(
                    color: ColorManager.kDarkCharcoal,
                    fontSize: FontSize.s16,
                  ),
                  buttonWidth: MediaQuery.of(context).size.width,
                  buttonHeight: AppSize.s56,
                  dropdownWidth: MediaQuery.of(context).size.width,
                ),
                const SizedBox(height: AppSize.s32),
                if (model.hasError)
                  Alert.primary(
                    text: '${model.modelError}',
                  ),
                if (model.hasMessage)
                  Alert.primary(text: '${model.modelMessage}'),
                if (model.hasError) const SizedBox(height: AppSize.s20),
                PosButton(
                  onPressed: model.createMerchantAccount,
                  title: AppString.createAccountText,
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
              ],
            ),
          ),

          // const SizedBox(height: AppSize.s4),
          Expanded(child: Container()),
          Container(
            padding: const EdgeInsets.all(AppPadding.p24),
            decoration: const BoxDecoration(
              color: ColorManager.kLightGrayishOrange,
            ),
            child: Column(
              children: [
                SvgPicture.asset('assets/images/bulb.svg'),
                const SizedBox(
                  height: AppSize.s12,
                ),
                Text(
                  'You will need to create or assign the merchant account to a newly created branch for it to be activated.',
                  style: getBoldStyle(
                    color: ColorManager.kGrey1,
                    fontSize: FontSize.s14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
