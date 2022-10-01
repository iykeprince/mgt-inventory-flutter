import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pos_mobile_app/ui/home/home_view_model.dart';
import 'package:pos_mobile_app/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const placeholder = Opacity(
      opacity: 0,
      child: IconButton(onPressed: null, icon: Icon(Icons.no_cell)),
    );
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        extendBody: true,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          // clipBehavior: Clip.antiAlias,
          // shape: const CircularNotchedRectangle(),

          notchMargin: 12,
          color: ColorManager.kNavDarkColor,
          elevation: 0,
          child: SizedBox(
            height: 50,
            child: BottomNavigationBar(
              selectedFontSize: 0.0,
              unselectedFontSize: 0.0,
              elevation: 0,
              backgroundColor: ColorManager.kNavDarkColor.withAlpha(0),
              selectedItemColor: Theme.of(context).colorScheme.onSurface,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.ac_unit_outlined,
                        size: 40,
                        color: Theme.of(context).colorScheme.onBackground),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Icons.access_alarm,
                        size: 40,
                        color: Theme.of(context).colorScheme.onBackground),
                    label: '')
              ],
            ),
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
              child: Icon(Icons.add)),
          elevation: 0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget buildTab({required int index, required Icon icon}) {
    return IconButton(onPressed: () {}, icon: icon);
  }
}
