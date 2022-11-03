import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked_services/stacked_services.dart';

class SwitchBranchDialog extends StatelessWidget {
  final DialogRequest? dialogRequest;
  final Function(DialogResponse)? onDialogTap;

  const SwitchBranchDialog({
    Key? key,
    required this.dialogRequest,
    required this.onDialogTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowDialogContainer(
        title: '${dialogRequest!.title}',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            branchCard(context, bgColor: ColorManager.kMidnightBlue, children: [
              SvgPicture.asset('assets/images/whiteAvatar.svg'),
              const SizedBox(
                height: AppSize.s20,
              ),
              Text('Iyana-Itire Branch',
                  style: getBoldStyle(
                      color: ColorManager.kWhiteColor, fontSize: FontSize.s20)),
              const SizedBox(
                height: AppSize.s8,
              ),
              Text(
                'Managed by Taiwo Kehinde',
                style: getRegularStyle(
                    color: ColorManager.kWhiteColor, fontSize: FontSize.s14),
              ),
            ]),
            branchCard(context, bgColor: ColorManager.kWhiteColor, children: [
              SvgPicture.asset('assets/images/greyAvatar.svg'),
              const SizedBox(
                height: AppSize.s20,
              ),
              Text('Iyana-Itire Branch',
                  style: getMediumStyle(
                      color: ColorManager.kGrey1, fontSize: FontSize.s20)),
              const SizedBox(
                height: AppSize.s8,
              ),
              Text(
                'Managed by Taiwo Kehinde',
                style: getRegularStyle(
                    color: ColorManager.kGrey1, fontSize: FontSize.s14),
              ),
            ]),
          ],
        ),
        onPressed: () => onDialogTap!(DialogResponse(confirmed: true)));
  }

  Widget branchCard(BuildContext context,
      {required List<Widget> children,
      Color? bgColor,
      EdgeInsets? padding,
      EdgeInsets? margin}) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      padding: const EdgeInsets.all(AppPadding.p24),
      margin: const EdgeInsets.all(AppPadding.p24),
      child: Column(children: children),
    );
  }
}
