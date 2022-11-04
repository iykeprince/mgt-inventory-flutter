import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/admin/dashboard/add_branch/add_branch_view_model.dart';
import 'package:pos_mobile_app/ui/admin/dashboard/create_merchant_account/create_merchant_account_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:pos_mobile_ui_package/widgets/appbar/appbar.dart';
import 'package:stacked/stacked.dart';

import '../../../../models/branch.model.dart';

class AddBranchView extends StatelessWidget {
  const AddBranchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddBranchViewModel>.reactive(
      viewModelBuilder: () => AddBranchViewModel(),
      onModelReady: (model) {
        model.initialiseForm();
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: ColorManager.kWhiteColor,
        appBar: Navbar(
          title: AppString.addBranchDetailsText,
          onTap: model.navigateBack,
          iconColor: ColorManager.kDarkCharcoal,
        ),
        body: KeyboardAware(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: AppSize.s12,
                ),
                Column(
                  children: model.createBranchForm.map((branch) {
                    return AddBranchExpandableView(
                      data: branch,
                    );
                  }).toList(),
                ),
                const SizedBox(height: AppSize.s20),
                //add the
                PosButton(
                  onPressed: model.addNewBranch,
                  title: AppString.addNewBranch,
                  borderRadius: 0,
                  leadingIcon: Icons.add,
                  leadingIconColor: ColorManager.kButtonTextNavyBlue,
                  buttonTextColor: ColorManager.kButtonTextNavyBlue,
                  fontWeight: FontWeightManager.medium,
                  buttonBgColor: ColorManager.kTransparent,
                  leadingIconSpace: AppSize.s24,
                ),
                const SizedBox(height: AppSize.s40),
                if (model.hasError)
                  Alert.primary(
                    text: '${model.modelError}',
                  ),
                const SizedBox(height: AppSize.s16),
                PosButton(
                  onPressed: model.saveBranchDetail,
                  title: AppString.saveBranchDetailText,
                  // buttonBgColor: ColorManager.kLightGreen1,
                  // buttonTextColor: ColorManager.kDarkCharcoal,
                  fontSize: FontSize.s16,
                  fontWeight: FontWeightManager.bold,
                  border: Border.all(
                    color: ColorManager.kBorderLightGreen,
                    width: 1,
                  ),
                  borderRadius: AppSize.s8,
                  busy: model.isBusy,
                ),
                const SizedBox(height: AppSize.s40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddBranchExpandableView extends StatelessWidget {
  const AddBranchExpandableView({Key? key, required this.data})
      : super(key: key);
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppSize.s4,
            horizontal: AppSize.s12,
          ),
          decoration: const BoxDecoration(
            color: ColorManager.kBackgroundolor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Branch ${data['idx']}',
                style: const TextStyle(
                  color: ColorManager.kPrimaryColor,
                  fontSize: AppSize.s16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.remove,
                  color: ColorManager.kPrimaryColor,
                  size: AppSize.s24,
                ),
              )
            ],
          ),
        ),
        AddBranchFormView(data: data)
      ],
    );
  }
}

class AddBranchFormView extends StatefulWidget {
  const AddBranchFormView({
    Key? key,
    this.data,
  }) : super(key: key);
  final Map<String, dynamic>? data;

  @override
  State<AddBranchFormView> createState() => _AddBranchFormViewState();
}

class _AddBranchFormViewState extends State<AddBranchFormView> {
  @override
  Widget build(BuildContext context) {
    print('number of merchants: ${widget.data?['numOfMerchants'] ?? 0}');
    return Padding(
      padding: const EdgeInsets.all(AppSize.s12),
      child: Column(
        children: [
          InputField(
            label: AppString.branchNameText,
            hintText: AppString.branchNamePlaceholderText,
            border: InputBorder.none,
            onChanged: (value) {
              setState(() {
                widget.data!['name'] = value;
              });
            },
            initialValue: widget.data?['name'] ?? '',
          ),
          const SizedBox(height: AppSize.s12),
          InputField(
            label: AppString.locationText,
            hintText: AppString.locationPlaceholderText,
            border: InputBorder.none,
            onChanged: (value) {
              setState(() {
                widget.data!['location'] = value;
              });
            },
            initialValue: widget.data?['location'] ?? '',
          ),
          const SizedBox(height: AppSize.s12),
          InputField(
            label: AppString.numberOfMerchantText,
            hintText: AppString.numberOfMerchantPlaceholderText,
            border: InputBorder.none,
            onChanged: (value) {
              setState(() {
                widget.data!['numOfMerchants'] = value;
              });
            },
            keyBoardType: TextInputType.number,
            initialValue: '${widget.data?['numOfMerchants'] ?? 0}',
          ),
          // Alert.primary(text: AppString.numberOfMerchantManagingThisBranchText),
          const SizedBox(height: AppSize.s12),
          InputField(
            label: AppString.posNameText,
            hintText: AppString.numOfBranchPlaceholder,
            border: InputBorder.none,
            onChanged: (value) {
              setState(() {
                widget.data!['posName'] = value;
              });
            },
            initialValue: widget.data?['posName'] ?? '',
            labelRightItem: GestureDetector(
              onTap: () {},
              child: const Text(
                'Add New POS',
                style: TextStyle(
                  color: ColorManager.kButtonTextNavyBlue,
                  fontSize: AppSize.s14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          // Alert.primary(text: AppString.posNameUsedInBranchText),
          const SizedBox(height: AppSize.s12),
          InputField(
            label: AppString.bankAccountDetailText,
            hintText: AppString.bankAccountDetailPlaceholderText,
            border: InputBorder.none,
            onChanged: (value) {
              setState(() {
                widget.data!['bankAccountDetail'] = value;
              });
            },
            initialValue: widget.data?['bankAccountDetail'] ?? '',
            labelRightItem: GestureDetector(
              onTap: () {},
              child: const Text(
                'Add New',
                style: TextStyle(
                  color: ColorManager.kButtonTextNavyBlue,
                  fontSize: AppSize.s14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          // Alert.primary(text: AppString.bankAccountRecommendedForPosText),
          const SizedBox(height: AppSize.s12),
        ],
      ),
    );
  }
}
