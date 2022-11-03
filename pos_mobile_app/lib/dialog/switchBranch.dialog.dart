import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked_services/stacked_services.dart';

import '../models/branch.model.dart';

class SwitchBranchDialog extends StatelessWidget {
  final DialogRequest? dialogRequest;
  final Function(DialogResponse<dynamic>)? onDialogTap;

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
        children: [
          SizedBox(
            height: 342,
            child: ListView.builder(
              itemCount: (dialogRequest!.data as List<Branch>).length,
              itemBuilder: (BuildContext context, int index) {
                Branch branch = (dialogRequest!.data as List<Branch>)[index];
                return BranchCardItem(
                  item: branch,
                  onItemSelected: (branch) {
                    DialogResponse(data: branch);
                    print('branch: $branch');
                  },
                );
              },
            ),
          ),
          PosButton(
            onPressed: () {},
            title: AppString.addNewBranch,
            borderRadius: 0,
            leadingIcon: Icons.add,
            leadingIconColor: ColorManager.kPrimaryColor,
            buttonTextColor: ColorManager.kPrimaryColor,
            fontWeight: FontWeightManager.extraBold,
            buttonBgColor: ColorManager.kLightGreen1,
            leadingIconSpace: AppSize.s24,
          )
        ],
      ),
      onPressed: () => onDialogTap!(
        DialogResponse(confirmed: true, data: true),
      ),
    );
  }

  // Widget BranchCardItem(BuildContext context,
  //     {required List<Widget> children,
  //     Color? bgColor,
  //     EdgeInsets? padding,
  //     EdgeInsets? margin}) {
  //   return ;
  // }
}

class BranchCardItem extends StatefulWidget {
  BranchCardItem(
      {Key? key,
      this.bgColor,
      this.padding,
      this.margin,
      required this.item,
      this.onItemSelected})
      : super(key: key);
  Branch item;
  EdgeInsets? padding;
  EdgeInsets? margin;
  Color? bgColor;
  Function(Branch)? onItemSelected;

  @override
  State<BranchCardItem> createState() => _BranchCardItemState();
}

class _BranchCardItemState extends State<BranchCardItem> {
  Branch? _selectedItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItem = widget.item;
        });
        widget.onItemSelected!(widget.item);
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.item.id == _selectedItem?.id
              ? ColorManager.kMidnightBlue
              : ColorManager.kWhiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        padding: const EdgeInsets.all(AppPadding.p24),
        margin: const EdgeInsets.symmetric(
          vertical: AppPadding.p8,
          horizontal: AppPadding.p12,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              widget.item.id == _selectedItem?.id
                  ? 'assets/images/whiteAvatar.svg'
                  : 'assets/images/greyAvatar.svg',
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            Text('${widget.item.name}',
                style: getBoldStyle(
                    color: widget.item.id == _selectedItem?.id
                        ? ColorManager.kWhiteColor
                        : ColorManager.kGrey1,
                    fontSize: FontSize.s20)),
            const SizedBox(
              height: AppSize.s8,
            ),
            Text(
              'Managed by ${widget.item.location}',
              style: getRegularStyle(
                  color: widget.item.id == _selectedItem?.id
                      ? ColorManager.kWhiteColor
                      : ColorManager.kGrey1,
                  fontSize: FontSize.s14),
            ),
          ],
        ),
      ),
    );
  }
}
/**
 * Column(
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
 */