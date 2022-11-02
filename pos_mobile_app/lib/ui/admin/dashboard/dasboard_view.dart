import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/admin/dashboard/dashboard_view_model.dart';
import 'package:pos_mobile_app/ui/merchant/dashboard/dashboard_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:stacked/stacked.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminDashboardViewModel>.nonReactive(
        viewModelBuilder: () => AdminDashboardViewModel(),
        builder: (context, model, child) => Container(
              color: ColorManager.kBackgroundolor,
              padding: EdgeInsets.symmetric(
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
                            Text('John Doe Technologies',
                                style: getBoldStyle(
                                    color: ColorManager.kDarkCharcoal,
                                    fontSize: FontSize.s20))
                          ],
                        ),
                        // SvgPicture.asset('assets/images/usersAvatar.svg'),
                        Spacer(),
                        Image.asset(
                          'assets/images/userAvater.png',
                          width: AppSize.s48,
                          height: AppSize.s48,
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppSize.s32,
                    ),
                    SvgPicture.asset('assets/images/IllustrationNoMessage.svg'),
                    SizedBox(
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
                    SizedBox(
                      height: AppSize.s20,
                    ),
                    PosButton(
                      onPressed: model.createMerchantSheet,
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
            ));
  }
}
