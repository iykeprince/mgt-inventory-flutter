import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateMerchantBottomSheet extends StatelessWidget {
  final SheetRequest? request;
  final Function(SheetResponse)? completer;

  const CreateMerchantBottomSheet({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: AppMargin.m12),
              decoration: const BoxDecoration(
                color: ColorManager.kPinkSwan,
              ),
              width: AppSize.s64,
              height: AppSize.s4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                IconButton(
                    onPressed: () => completer!(SheetResponse(confirmed: true)),
                    icon: Icon(Icons.cancel, color: ColorManager.kPinkSwan)),
              ],
            ),
            Text('${request!.title}',
                style: getSemiBoldStyle(
                    color: ColorManager.kDarkCharcoal, fontSize: FontSize.s18)),
            SizedBox(
              height: AppSize.s20,
            ),
            Container(
              padding: EdgeInsets.all(AppPadding.p24),
              decoration: BoxDecoration(
                color: ColorManager.kLightGrayishOrange,
              ),
              child: Column(
                children: [
                  SvgPicture.asset('assets/images/bulb.svg'),
                  SizedBox(
                    height: AppSize.s12,
                  ),
                  Text(
                    'You haven’t added branch details to your account yet.',
                    style: getBoldStyle(
                      color: ColorManager.kGoldenAmber,
                      fontSize: FontSize.s18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: AppSize.s32,
                  ),
                  Text(
                    'You need to add branch details in order to be able to register your merchants accounts.',
                    style: getRegularStyle(
                        color: ColorManager.kDarkCharcoal,
                        fontSize: FontSize.s18),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: AppSize.s40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
              child: PosButton(
                onPressed: () {
                  completer!(SheetResponse(confirmed: true));
                  request!.customData();
                },
                title: 'Add Branch Details',
                leadingIcon: Icons.add_circle,
                leadingIconColor: ColorManager.kPrimaryColor,
                buttonTextColor: ColorManager.kPrimaryColor,
                fontWeight: FontWeightManager.medium,
                buttonBgColor: ColorManager.kLightGreen1,
                leadingIconSpace: AppSize.s24,
                border: Border.all(
                  color: ColorManager.kBorderLightGreen,
                  width: 1,
                ),
              ),
            )
          ],
        ));
  }
}
