import 'package:flutter/material.dart';
import 'package:pos_mobile_app/ui/auth/createAccountSuccess/create_account_success_view_model.dart';
import 'package:pos_mobile_app/utils/colors.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

class CreateAccountSuccessView extends StatelessWidget {
  const CreateAccountSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAccountSuccessViewModel>.reactive(
      viewModelBuilder: () => CreateAccountSuccessViewModel(),
      // onModelReady: ,
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [linearFrom, linearTo],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/auth/cone.png',
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Text(
                    AppString.welcomeToPosCaption,
                    style: getBoldStyle(
                        color: ColorManager.kWhiteColor,
                        fontSize: FontSize.s28),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: AppSize.s12,
                  ),
                  Text(
                    AppString.welcomeToPosCaptionSubtitle,
                    style: getMediumStyle(
                        color: ColorManager.kWhiteColor,
                        fontSize: FontSize.s14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  PosButton(
                    onPressed: () {},
                    title: AppString.addBranchDetailsText,
                    buttonBgColor: ColorManager.kLightGreen,
                    buttonTextColor: ColorManager.kDarkBlue,
                    trailingIcon: Icons.arrow_forward,
                    trailingIconColor: ColorManager.kDarkBlue,
                    trailingIconSpace: AppSize.s28,
                  ),
                  PosButton(
                    onPressed: () {},
                    title: AppString.skip,
                    buttonType: ButtonType.text,
                    buttonTextColor: ColorManager.kWhiteColor,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
