import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/admin_delete_account/admin_delete_account_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:stacked/stacked.dart';

class AdminDeleteAccountView extends StatelessWidget {
  const AdminDeleteAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminDeleteAccountViewModel>.nonReactive(
      viewModelBuilder: () => AdminDeleteAccountViewModel(),
      onModelReady: (model) {},
      builder: (context, model, child) => Scaffold(
        backgroundColor: ColorManager.kWhiteColor,
        appBar: Navbar(
          title: AppString.deleteAccount,
          onTap: model.navigateBack,
          iconColor: ColorManager.kDarkCharcoal,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/danger.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: AppSize.s28),
                      Text(
                        AppString.deleteAccountInstructionText,
                        style: getMediumStyle(
                          color: ColorManager.kDarkCharcoal,
                          fontSize: FontSize.s16,
                        ),
                      ),
                      const SizedBox(height: AppSize.s80),
                      Text(
                        AppString.beforeYouGoText,
                        style: getSemiBoldStyle(
                          color: ColorManager.kDarkCharcoal,
                          fontSize: FontSize.s18,
                        ),
                      ),
                      const SizedBox(height: AppSize.s16),
                      ListTile(
                        onTap: () {},
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          AppString.tellUsWhyYouAreLeaving,
                          style: getMediumStyle(
                            color: ColorManager.kPrimaryColor,
                            fontSize: FontSize.s16,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.question_mark_rounded,
                          color: ColorManager.kPrimaryDarkColor,
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          AppString.downloadYourData,
                          style: getMediumStyle(
                            color: ColorManager.kPrimaryColor,
                            fontSize: FontSize.s16,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.download_sharp,
                          color: ColorManager.kPrimaryDarkColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSize.s16),
                BottomStickyNote(
                  text: AppString.deleteAccountStickyText,
                  style: getRegularStyle(
                    color: ColorManager.kGrey1,
                    fontSize: FontSize.s14,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p24,
                    vertical: AppPadding.p24,
                  ),
                  child: PosButton(
                    title: 'Delete My Account',
                    buttonTextColor: ColorManager.kWhiteColor,
                    buttonBgColor: ColorManager.kRed,
                    onPressed: model.showFeedbackSurveySheet,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
