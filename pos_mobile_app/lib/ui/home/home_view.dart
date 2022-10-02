import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/dashboard/dashboard_view.dart';
import 'package:pos_mobile_app/ui/history/history_view.dart';
import 'package:pos_mobile_app/ui/home/home_view_model.dart';
import 'package:pos_mobile_app/ui/profile/profile_view.dart';
import 'package:pos_mobile_app/ui/report/report_view.dart';
import 'package:pos_mobile_app/utils/colors.dart';
import 'package:pos_mobile_app/utils/custom_notch.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
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
              child: const Icon(Icons.add)),
          elevation: 0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return DashboardView();
      case 1:
        return HistoryView();
      case 3:
        return ReportView();
      case 4:
        return ProfileView();
      default:
        return DashboardView();
    }
  }
}
