import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/admin/dashboard/dasboard_view.dart';
import 'package:pos_mobile_app/ui/merchant/dashboard/dashboard_view.dart';

import 'package:pos_mobile_app/utils/colors.dart';
import 'package:pos_mobile_app/utils/custom_notch.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:stacked/stacked.dart';

import 'admin_home_view_model.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminHomeViewModel>.reactive(
      viewModelBuilder: () => AdminHomeViewModel(),
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

/**
 * Temi G. don't mind me o
 * just update the view
 * 
 */
  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return AdminDashboardView();
      case 1:
        return const Center(child: Text('Admin Analytics'));
      case 3:
        return const Center(child: Text('Admin Reports'));
      case 4:
        return const Center(child: Text('Admin Settings'));
      default:
        return const Center(child: Text('Admin Dashboard'));
    }
  }
}
