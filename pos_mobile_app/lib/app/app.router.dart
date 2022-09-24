// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/auth/auth_view.dart';
import '../ui/auth/createAccountSuccess/create_account_success_view.dart';
import '../ui/auth/createAdmin/create_admin_view.dart';
import '../ui/auth/createAdminBusiness/create_admin_business.dart';
import '../ui/auth/login/login_view.dart';
import '../ui/auth/registerMerchant/register_merchant_view.dart';
import '../ui/auth/verifyAdmin/verify_admin_view.dart';
import '../ui/onboarding/onboarding_view.dart';
import '../ui/splash/splash_view.dart';

class Routes {
  static const String splashView = '/';
  static const String onboardView = '/onboard-view';
  static const String authView = '/auth-view';
  static const String loginView = '/login-view';
  static const String createAdminView = '/create-admin-view';
  static const String registerMerchantView = '/register-merchant-view';
  static const String verifyAdminView = '/verify-admin-view';
  static const String createAdminBusinessView = '/create-admin-business-view';
  static const String createAccountSuccessView = '/create-account-success-view';
  static const all = <String>{
    splashView,
    onboardView,
    authView,
    loginView,
    createAdminView,
    registerMerchantView,
    verifyAdminView,
    createAdminBusinessView,
    createAccountSuccessView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.onboardView, page: OnboardView),
    RouteDef(Routes.authView, page: AuthView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.createAdminView, page: CreateAdminView),
    RouteDef(Routes.registerMerchantView, page: RegisterMerchantView),
    RouteDef(Routes.verifyAdminView, page: VerifyAdminView),
    RouteDef(Routes.createAdminBusinessView, page: CreateAdminBusinessView),
    RouteDef(Routes.createAccountSuccessView, page: CreateAccountSuccessView),
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
    AuthView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const AuthView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    CreateAdminView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CreateAdminView(),
        settings: data,
      );
    },
    RegisterMerchantView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const RegisterMerchantView(),
        settings: data,
      );
    },
    VerifyAdminView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const VerifyAdminView(),
        settings: data,
      );
    },
    CreateAdminBusinessView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CreateAdminBusinessView(),
        settings: data,
      );
    },
    CreateAccountSuccessView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CreateAccountSuccessView(),
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

/// ************************************************************************
/// Extension for strongly typed navigation
/// *************************************************************************

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToSplashView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.splashView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToOnboardView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.onboardView,
      arguments: OnboardViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAuthView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.authView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToLoginView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.loginView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCreateAdminView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.createAdminView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToRegisterMerchantView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.registerMerchantView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToVerifyAdminView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.verifyAdminView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCreateAdminBusinessView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.createAdminBusinessView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCreateAccountSuccessView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.createAccountSuccessView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
