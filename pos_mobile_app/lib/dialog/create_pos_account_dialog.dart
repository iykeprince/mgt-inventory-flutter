import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/admin/account_setting/admin_branch_detail/admin_branch_detail_view_model.dart';

class CreatePosAccountDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const CreatePosAccountDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminBranchDetailViewModel>.reactive(
        viewModelBuilder: () => AdminBranchDetailViewModel(),
        builder: (context, model, child) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Create Bank Account",
                    style: getMediumStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s18,
                    ),
                  ),
                  InputField(
                    hintText: "Provider name",
                    onChanged: model.handleProviderName,
                  ),
                  InputField(
                    hintText: "Account name",
                    onChanged: model.handleAccountName,
                  ),
                  InputField(
                    hintText: "Account no.",
                    onChanged: model.handleAccountNumber,
                  ),
                  const SizedBox(height: AppSize.s16),
                  Row(
                    children: [
                      Expanded(
                        child: PosButton(
                            onPressed: () =>
                                completer(DialogResponse(confirmed: true)),
                            title: "Cancel"),
                      ),
                      const SizedBox(width: AppSize.s8),
                      Expanded(
                        child: PosButton(
                            busy: model.busy(CREATE_ACCOUNT_REQUEST),
                            onPressed: () async {
                              await model.createAccount("POS", completer);
                            },
                            title: "Proceed"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
