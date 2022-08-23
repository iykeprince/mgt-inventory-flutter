// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/onboarding/onboarding_view.dart';
import '../ui/splash/splash_view.dart';

class Routes {
  static const String splashView = '/';
  static const String onboardView = '/onboard-view';
  static const all = <String>{
    splashView,
    onboardView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.onboardView, page: OnboardView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    OnboardView: (data) {
      var args = data.getArgs<OnboardViewArguments>(
        orElse: () => OnboardViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => OnboardView(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// OnboardView arguments holder class
class OnboardViewArguments {
  final Key? key;
  OnboardViewArguments({this.key});
}
