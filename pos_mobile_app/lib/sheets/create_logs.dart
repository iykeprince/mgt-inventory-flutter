import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateLogsBottomSheet extends StatelessWidget {
  final SheetRequest? request;
  final Function(SheetResponse)? completer;

  const CreateLogsBottomSheet({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
        color: const Color.fromRGBO(0, 0, 0, 0.01),
        borderRadius: BorderRadius.circular(0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PosButton(
                buttonBgColor: ColorManager.kBackgroundolor,
                buttonTextColor: ColorManager.kPrimaryColor,
                leadingIcon: Icons.add_circle,
                leadingIconSpace: AppSize.s12,
                onPressed: () => request!.customData(),
                title: '${request!.mainButtonTitle}'),
            const SizedBox(
              height: AppSize.s12,
            ),
            PosButton(
                leadingIcon: Icons.add_circle,
                leadingIconSpace: AppSize.s12,
                leadingIconColor: ColorManager.kWhiteColor,
                onPressed: () => request!.data(),
                // onPressed: () => completer!(SheetResponse(confirmed: true)),
                title: '${request!.secondaryButtonTitle}'),
            const SizedBox(
              height: AppSize.s100,
            ),
          ],
        ));
  }
}
