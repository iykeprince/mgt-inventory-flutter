import 'package:flutter/material.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/admin_manage_merchant_account/admin_manage_merchant_account_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

class AdminManageMerchantAccountView extends StatelessWidget {
  const AdminManageMerchantAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminManageMerchantAccountViewModel>.nonReactive(
      viewModelBuilder: () => AdminManageMerchantAccountViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: ColorManager.kWhiteColor,
        appBar: Navbar(
          title: AppString.manageMerchantAccounts,
          onTap: model.navigateBack,
          iconColor: ColorManager.kDarkCharcoal,
        ),
        body: KeyboardAware(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: Container(
                /**
               * 
               * CONTENT HERE
               */
                ),
          ),
        ),
      ),
    );
  }
}
