import 'package:flutter/material.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POS App',
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: ColorManager.kPrimaryColor,
        ),
        fontFamily: 'U8',
      ),
    );
  }
}
