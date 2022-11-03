import 'package:flutter/material.dart';
import 'package:pos_mobile_app/ui/admin/dashboard/create_merchant_account/create_merchant_account_view_model.dart';
import 'package:stacked/stacked.dart';

class CreateMerchantAccountView extends StatelessWidget {
  const CreateMerchantAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateMerchantAccountViewModel>.nonReactive(
      viewModelBuilder: () => CreateMerchantAccountViewModel(),
      onModelReady: (model) {},
      builder: (context, model, child) => Scaffold(
        body: Text('Hello World'),
      ),
    );
  }
}
