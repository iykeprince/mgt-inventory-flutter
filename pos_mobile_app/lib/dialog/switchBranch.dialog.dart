import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/services/admin.service.dart';
import 'package:pos_mobile_app/utils/pos_contants.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';
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
    return ViewModelBuilder<SwitchBranchViewModel>.reactive(
        viewModelBuilder: () => SwitchBranchViewModel(),
        builder: (context, model, child) {
          return ShowDialogContainer(
            title: '${dialogRequest!.title}',
            child: Column(
              children: [
                SizedBox(
                  height: 342,
                  child: ListView.builder(
                    itemCount:
                        (dialogRequest!.data[BRANCHES] as List<Branch>).length,
                    itemBuilder: (BuildContext context, int index) {
                      Branch branch = (dialogRequest!.data[BRANCHES]
                          as List<Branch>)[index];
                      return BranchCardItem(
                        item: branch,
                        selectedItem: model.selectedBranch ??
                            dialogRequest?.data[SELECTED_BRANCH],
                        onItemSelected: (branch) {
                          model.setSelectedBranch(branch);
                          onDialogTap!(
                              DialogResponse(data: branch, confirmed: true));
                        },
                      );
                    },
                  ),
                ),
                PosButton(
                  onPressed: () => onDialogTap!(
                    DialogResponse(confirmed: true, data: "ADD_NEW_BRANCH"),
                  ),
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
        });
  }

  // Widget BranchCardItem(BuildContext context,
  //     {required List<Widget> children,
  //     Color? bgColor,
  //     EdgeInsets? padding,
  //     EdgeInsets? margin}) {
  //   return ;
  // }
}

// ignore: must_be_immutable
class BranchCardItem extends StatefulWidget {
  BranchCardItem(
      {Key? key,
      this.bgColor,
      this.padding,
      this.margin,
      required this.item,
      this.selectedItem,
      this.onItemSelected})
      : super(key: key);
  Branch item;
  EdgeInsets? padding;
  EdgeInsets? margin;
  Color? bgColor;
  Function(Branch)? onItemSelected;
  Branch? selectedItem;
  @override
  State<BranchCardItem> createState() => _BranchCardItemState();
}

class _BranchCardItemState extends State<BranchCardItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selectedItem = widget.item;
        });
        widget.onItemSelected!(widget.item);
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.item.id == widget.selectedItem?.id
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
              widget.item.id == widget.selectedItem?.id
                  ? 'assets/images/whiteAvatar.svg'
                  : 'assets/images/greyAvatar.svg',
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            Text('${widget.item.name}',
                style: getBoldStyle(
                    color: widget.item.id == widget.selectedItem?.id
                        ? ColorManager.kWhiteColor
                        : ColorManager.kGrey1,
                    fontSize: FontSize.s20)),
            const SizedBox(
              height: AppSize.s8,
            ),
            Text(
              'Managed by ${widget.item.location}',
              style: getRegularStyle(
                  color: widget.item.id == widget.selectedItem?.id
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

class SwitchBranchViewModel extends BaseViewModel {
  final _adminService = locator<AdminService>();
  Branch? _selectedBranch;
  Branch? get selectedBranch => _selectedBranch;

  void setSelectedBranch(Branch branch) {
    _selectedBranch = branch;
    _adminService.setSelectedBranch(branch);
    notifyListeners();
  }
}
