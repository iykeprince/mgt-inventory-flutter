// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/admin/admin_home_view.dart';
import '../ui/auth/auth_view.dart';
import '../ui/auth/compeleteMerchantRegistration/compelete_merchant_register.dart';
import '../ui/auth/createAccountSuccess/create_account_success_view.dart';
import '../ui/auth/createAdmin/create_admin_view.dart';
import '../ui/auth/createAdminBusiness/create_admin_business.dart';
import '../ui/auth/login/login_view.dart';
import '../ui/auth/registerMerchant/register_merchant_view.dart';
import '../ui/auth/verifyAdmin/verify_admin_view.dart';
import '../ui/auth/verifyAdminSuccess/verify_admin_success_view.dart';
import '../ui/auth/verifyMerchant/verify_merchant_view.dart';
import '../ui/auth/verifyMerchantSuccess/verify_merchant_success_view.dart';
import '../ui/merchant/merchant_home_view.dart';
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
  static const String verifyAdminSuccessView = '/verify-admin-success-view';
  static const String createAdminBusinessView = '/create-admin-business-view';
  static const String createAccountSuccessView = '/create-account-success-view';
  static const String verifyMerchantView = '/verify-merchant-view';
  static const String verifyMerchantSuccessView =
      '/verify-merchant-success-view';
  static const String compeleteMerchantRegister =
      '/compelete-merchant-register';
  static const String adminHomeView = '/admin-home-view';
  static const String merchantHomeView = '/merchant-home-view';
  static const all = <String>{
    splashView,
    onboardView,
    authView,
    loginView,
    createAdminView,
    registerMerchantView,
    verifyAdminView,
    verifyAdminSuccessView,
    createAdminBusinessView,
    createAccountSuccessView,
    verifyMerchantView,
    verifyMerchantSuccessView,
    compeleteMerchantRegister,
    adminHomeView,
    merchantHomeView,
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
    RouteDef(Routes.verifyAdminSuccessView, page: VerifyAdminSuccessView),
    RouteDef(Routes.createAdminBusinessView, page: CreateAdminBusinessView),
    RouteDef(Routes.createAccountSuccessView, page: CreateAccountSuccessView),
    RouteDef(Routes.verifyMerchantView, page: VerifyMerchantView),
    RouteDef(Routes.verifyMerchantSuccessView, page: VerifyMerchantSuccessView),
    RouteDef(Routes.compeleteMerchantRegister, page: CompeleteMerchantRegister),
    RouteDef(Routes.adminHomeView, page: AdminHomeView),
    RouteDef(Routes.merchantHomeView, page: MerchantHomeView),
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
      var args = data.getArgs<VerifyAdminViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => VerifyAdminView(
          key: args.key,
          email: args.email,
        ),
        settings: data,
      );
    },
    VerifyAdminSuccessView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const VerifyAdminSuccessView(),
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
    VerifyMerchantView: (data) {
      var args = data.getArgs<VerifyMerchantViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => VerifyMerchantView(
          key: args.key,
          emailAddress: args.emailAddress,
        ),
        settings: data,
      );
    },
    VerifyMerchantSuccessView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const VerifyMerchantSuccessView(),
        settings: data,
      );
    },
    CompeleteMerchantRegister: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CompeleteMerchantRegister(),
        settings: data,
      );
    },
    AdminHomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AdminHomeView(),
        settings: data,
      );
    },
    MerchantHomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MerchantHomeView(),
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

/// VerifyAdminView arguments holder class
class VerifyAdminViewArguments {
  final Key? key;
  final String email;
  VerifyAdminViewArguments({this.key, required this.email});
}

/// VerifyMerchantView arguments holder class
class VerifyMerchantViewArguments {
  final Key? key;
  final String emailAddress;
  VerifyMerchantViewArguments({this.key, required this.emailAddress});
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
    Key? key,
    required String email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.verifyAdminView,
      arguments: VerifyAdminViewArguments(key: key, email: email),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToVerifyAdminSuccessView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.verifyAdminSuccessView,
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

  Future<dynamic> navigateToVerifyMerchantView({
    Key? key,
    required String emailAddress,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.verifyMerchantView,
      arguments:
          VerifyMerchantViewArguments(key: key, emailAddress: emailAddress),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToVerifyMerchantSuccessView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.verifyMerchantSuccessView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCompeleteMerchantRegister({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.compeleteMerchantRegister,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAdminHomeView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.adminHomeView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToMerchantHomeView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.merchantHomeView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
