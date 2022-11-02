import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/utils/pos_contants.dart';
import 'package:pos_mobile_ui_package/utils/values_manager.dart';
import './dashboard/dashboard_view.dart';
import './history/history_view.dart';
import './profile/profile_view.dart';
import './report/report_view.dart';
import 'package:pos_mobile_app/utils/colors.dart';
import 'package:pos_mobile_app/utils/custom_notch.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:stacked/stacked.dart';

import 'merchant_home_view_model.dart';

class MerchantHomeView extends StatelessWidget {
  const MerchantHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MerchantHomeViewModel>.reactive(
      viewModelBuilder: () => MerchantHomeViewModel(),
      onModelReady: (model) => model.getCurrentUser(),
      builder: (context, model, child) => Scaffold(
        extendBody: true,
        body: getViewForIndex(model.currentIndex),
        bottomNavigationBar: BottomAppBar(
          shape: const CustomNotchedRectangle(),
          notchMargin: 12,
          color: ColorManager.kNavDarkColor,
          elevation: 0,
          child: SizedBox(
            height: 50,
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 0.0,
                unselectedFontSize: 0.0,
                currentIndex: model.currentIndex,
                onTap: model.setIndex,
                elevation: 0,
                backgroundColor: ColorManager.kNavDarkColor.withAlpha(0),
                selectedItemColor: Theme.of(context).colorScheme.onSurface,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/home.svg',
                      color: ColorManager.kNavNonActiveColor,
                    ),
                    label: '',
                    activeIcon: SvgPicture.asset('assets/images/home.svg',
                        color: ColorManager.kWhiteColor),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/History.svg',
                      color: ColorManager.kNavNonActiveColor,
                    ),
                    label: '',
                    activeIcon: SvgPicture.asset('assets/images/History.svg',
                        color: ColorManager.kWhiteColor),
                  ),
                  BottomNavigationBarItem(
                      icon: Opacity(
                        opacity: 0,
                        child: SvgPicture.asset(
                          'assets/images/home.svg',
                          color: ColorManager.kNavNonActiveColor,
                        ),
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/Report.svg',
                      color: ColorManager.kNavNonActiveColor,
                    ),
                    label: '',
                    activeIcon: SvgPicture.asset('assets/images/Report.svg',
                        color: ColorManager.kWhiteColor),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/Person.svg',
                      color: ColorManager.kNavNonActiveColor,
                    ),
                    label: '',
                    activeIcon: SvgPicture.asset('assets/images/Person.svg',
                        color: ColorManager.kWhiteColor),
                  ),
                ]),
          ),
        ),
        floatingActionButton: HomeView(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case DASBHOARD_VIEW_INDEX:
        return DashboardView();
      case HISTORY_VIEW_INDEX:
        return HistoryView();
      case REPORT_VIEW_INDEX:
        return ReportView();
      case PROFILE_VIEW_INDEX:
        return ProfileView();
      default:
        return DashboardView();
    }
  }
}

class HomeView extends ViewModelWidget<MerchantHomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, MerchantHomeViewModel model) {
    return FloatingActionButton(
      onPressed: (model.triggerAction),
      child: Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [linearFrom, linearTo],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: getFabIcon(model.currentIndex, model),
      ),
      elevation: 0,
    );
  }

  Icon getFabIcon(int index, [MerchantHomeViewModel? model]) {
    switch (index) {
      case DASBHOARD_VIEW_INDEX:
        return model!.add ? Icon(Icons.add) : const Icon(Icons.close);
      case HISTORY_VIEW_INDEX:
        return const Icon(Icons.add);
      case REPORT_VIEW_INDEX:
      case PROFILE_VIEW_INDEX:
      default:
        return const Icon(Icons.house);
    }
  }
}
