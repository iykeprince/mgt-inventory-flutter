import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/dummy.widget/listtile_widget.dart';
import 'package:pos_mobile_app/services/admin.service.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/font_styles.dart';
import 'package:pos_mobile_ui_package/utils/text_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AnalyticHomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _adminService = locator<AdminService>();
  String? _selectedValue;
  String? get selectedValue => _selectedValue;

  navigateToTransactionPage() =>
      _navigationService.navigateTo(Routes.adminTransactionView);

  handleSelectedValue(value) {
    _selectedValue = value;
    notifyListeners();
  }

  getStat() async {
    await runBusyFuture(getStatTask());
  }

  getStatTask() async {
    try {
      setBusy(true);
      return await _adminService.getStat();
    } on DioError catch (error) {
      throw Exception(error.response!.data['message']);
    } finally {
      setBusy(false);
    }
  }

  List<ListTileWidget> cardLists(BuildContext context) {
    return [
      ListTileWidget(
        color: ColorManager.klightYellowColor,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/Frame 3891.svg'),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: Text(
                  '1240000000',
                  maxLines: 1,
                  style: getThickStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s28),
                ),
              ),
              Text(
                'Total Withdrawl',
                style: getRegularStyle(
                    color: ColorManager.kNavNonActiveColor,
                    fontSize: FontSize.s12),
              )
            ]),
      ),
      ListTileWidget(
        color: ColorManager.kBackgroundolor,
        child: Column(children: [
          SvgPicture.asset('assets/images/servicechargeicon.svg'),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Text(
              '1240000000',
              maxLines: 1,
              style: getThickStyle(
                  color: ColorManager.kDarkCharcoal, fontSize: FontSize.s28),
            ),
          ),
          Text(
            'Total Withdrawl',
            style: getRegularStyle(
                color: ColorManager.kNavNonActiveColor, fontSize: FontSize.s12),
          )
        ]),
      ),
      ListTileWidget(
        color: ColorManager.kPinkishPurpleColor,
        child: Column(children: [
          SvgPicture.asset('assets/images/expenseicon.svg'),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Text(
              '1240000000',
              maxLines: 1,
              style: getThickStyle(
                  color: ColorManager.kDarkCharcoal, fontSize: FontSize.s28),
            ),
          ),
          Text(
            'Total Withdrawl',
            style: getRegularStyle(
                color: ColorManager.kNavNonActiveColor, fontSize: FontSize.s12),
          )
        ]),
      ),
      ListTileWidget(
        color: ColorManager.kLightGreen1,
        child: Column(children: [
          SvgPicture.asset('assets/images/Frame 6.svg'),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Text(
              '1240000000',
              maxLines: 1,
              style: getThickStyle(
                  color: ColorManager.kDarkCharcoal, fontSize: FontSize.s28),
            ),
          ),
          Text(
            'Total Withdrawl',
            style: getRegularStyle(
                color: ColorManager.kNavNonActiveColor, fontSize: FontSize.s12),
          )
        ]),
      ),
    ];
  }
}
