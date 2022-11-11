import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/string_manager.dart';
import 'package:pos_mobile_ui_package/utils/values_manager.dart';
import 'package:pos_mobile_ui_package/widgets/appbar/appbar.dart';
import 'package:pos_mobile_ui_package/widgets/keyboardAware/keyboard_aware.dart';
import 'package:stacked/stacked.dart';

import 'admin_manage_report_setting_view_model.dart';

class AdminManageReportSettingView extends StatelessWidget {
  const AdminManageReportSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminManageReportSettingViewModel>.nonReactive(
      viewModelBuilder: () => AdminManageReportSettingViewModel(),
      onModelReady: (model) {},
      builder: (context, model, child) => Scaffold(
        backgroundColor: ColorManager.kWhiteColor,
        appBar: Navbar(
          title: AppString.manageReportSettings,
          onTap: model.navigateBack,
          iconColor: ColorManager.kDarkCharcoal,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              ManageReportListItemView(
                title: AppString.automaticallySendMonthlyReportToEmail,
                onChanged: (value) {},
              ),
              ManageReportListItemView(
                title: AppString.automaticallySendQuaterlyReportToEmail,
                onChanged: (value) {},
              ),
              ManageReportListItemView(
                title: AppString.automaticallySendYearlyReportToEmail,
                onChanged: (value) {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Download all-time report',
                      style: TextStyle(
                        color: ColorManager.kPrimaryColor,
                      ),
                    ),
                    SvgPicture.asset('assets/images/downloadReportSetting.svg'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ManageReportListItemView extends StatefulWidget {
  ManageReportListItemView({
    Key? key,
    required this.title,
    this.margin,
    this.showBottomBorder = true,
    this.textColor,
    required this.onChanged,
  }) : super(key: key);

  final String title;
  final bool? showBottomBorder;
  final EdgeInsetsGeometry? margin;
  final Color? textColor;
  final Function(bool) onChanged;

  @override
  State<ManageReportListItemView> createState() =>
      _ManageReportListItemViewState();
}

class _ManageReportListItemViewState extends State<ManageReportListItemView> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: widget.margin ?? const EdgeInsets.only(top: AppMargin.m12),
      padding: const EdgeInsets.all(AppPadding.p12),
      decoration: widget.showBottomBorder!
          ? const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: ColorManager.kInputBgColor,
                  width: 1,
                ),
              ),
            )
          : null,
      child: SwitchListTile.adaptive(
        value: _selected,
        onChanged: (value) {
          setState(() {
            _selected = value;

            widget.onChanged(value);
          });
        },
        title: Text(
          widget.title,
          style: getMediumStyle(
            color: ColorManager.kDarkCharcoal,
            fontSize: FontSize.s16,
          ),
        ),
        // contentPadding: const EdgeInsets.all(AppPadding.p12),
        activeTrackColor: ColorManager.kPrimaryDarkColor,
        activeColor: ColorManager.kPrimaryDarkColor,
      ),
    );
  }
}
