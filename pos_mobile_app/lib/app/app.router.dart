// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../models/branch.model.dart';
import '../models/merchant.model.dart';
import '../ui/admin/account_setting/account_setting_view.dart';
import '../ui/admin/account_setting/admin_branch_detail/admin_branch_detail_view.dart';
import '../ui/admin/account_setting/admin_change_password/admin_change_password_view.dart';
import '../ui/admin/account_setting/admin_delete_account/admin_delete_account_view.dart';
import '../ui/admin/account_setting/admin_edit_profile/admin_edit_profile_view.dart';
import '../ui/admin/account_setting/admin_howItWorks/admin_how_it_works_view.dart';
import '../ui/admin/account_setting/admin_manage_branch/admin_manage_branch_view.dart';
import '../ui/admin/account_setting/admin_manage_merchant_account/admin_manage_merchant_account_view.dart';
import '../ui/admin/account_setting/admin_manage_report_setting/admin_manage_report_setting_view.dart';
import '../ui/admin/account_setting/admin_merchant_detail/admin_merchant_detail_view.dart';
import '../ui/admin/admin_home_view.dart';
import '../ui/admin/dashboard/add_branch/add_branch_view.dart';
import '../ui/admin/dashboard/create_merchant_account/create_merchant_account_view.dart';
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
import '../ui/merchant/dashboard/create_logs/new_expense/log_new_expense_view.dart';
import '../ui/merchant/dashboard/create_logs/new_transactions/log_new_transaction_view.dart';
import '../ui/merchant/merchant_home_view.dart';
import '../ui/merchant/profile/changepassword/change_password_view.dart';
import '../ui/merchant/profile/editprofile/edit_profile_view.dart';
import '../ui/merchant/profile/howItWorks/how_it_works_view.dart';
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
  static const String accountSettingView = '/account-setting-view';
  static const String adminEditProfileView = '/admin-edit-profile-view';
  static const String adminManageMerchantAccountView =
      '/admin-manage-merchant-account-view';
  static const String adminMerchantDetailView = '/admin-merchant-detail-view';
  static const String adminChangePasswordView = '/admin-change-password-view';
  static const String adminHowItWorksView = '/admin-how-it-works-view';
  static const String createMerchantAccountView =
      '/create-merchant-account-view';
  static const String addBranchView = '/add-branch-view';
  static const String adminManageBranchView = '/admin-manage-branch-view';
  static const String adminBranchDetailView = '/admin-branch-detail-view';
  static const String adminManageReportSettingView =
      '/admin-manage-report-setting-view';
  static const String adminDeleteAccountView = '/admin-delete-account-view';
  static const String merchantHomeView = '/merchant-home-view';
  static const String editProfileView = '/edit-profile-view';
  static const String howItWorksView = '/how-it-works-view';
  static const String changePasswordView = '/change-password-view';
  static const String logNewExpenseView = '/log-new-expense-view';
  static const String logNewTransactionView = '/log-new-transaction-view';
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
    accountSettingView,
    adminEditProfileView,
    adminManageMerchantAccountView,
    adminMerchantDetailView,
    adminChangePasswordView,
    adminHowItWorksView,
    createMerchantAccountView,
    addBranchView,
    adminManageBranchView,
    adminBranchDetailView,
    adminManageReportSettingView,
    adminDeleteAccountView,
    merchantHomeView,
    editProfileView,
    howItWorksView,
    changePasswordView,
    logNewExpenseView,
    logNewTransactionView,
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
    RouteDef(Routes.accountSettingView, page: AccountSettingView),
    RouteDef(Routes.adminEditProfileView, page: AdminEditProfileView),
    RouteDef(Routes.adminManageMerchantAccountView,
        page: AdminManageMerchantAccountView),
    RouteDef(Routes.adminMerchantDetailView, page: AdminMerchantDetailView),
    RouteDef(Routes.adminChangePasswordView, page: AdminChangePasswordView),
    RouteDef(Routes.adminHowItWorksView, page: AdminHowItWorksView),
    RouteDef(Routes.createMerchantAccountView, page: CreateMerchantAccountView),
    RouteDef(Routes.addBranchView, page: AddBranchView),
    RouteDef(Routes.adminManageBranchView, page: AdminManageBranchView),
    RouteDef(Routes.adminBranchDetailView, page: AdminBranchDetailView),
    RouteDef(Routes.adminManageReportSettingView,
        page: AdminManageReportSettingView),
    RouteDef(Routes.adminDeleteAccountView, page: AdminDeleteAccountView),
    RouteDef(Routes.merchantHomeView, page: MerchantHomeView),
    RouteDef(Routes.editProfileView, page: EditProfileView),
    RouteDef(Routes.howItWorksView, page: HowItWorksView),
    RouteDef(Routes.changePasswordView, page: ChangePasswordView),
    RouteDef(Routes.logNewExpenseView, page: LogNewExpenseView),
    RouteDef(Routes.logNewTransactionView, page: LogNewTransactionView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    OnboardView: (data) {
      var args = data.getArgs<OnboardViewArguments>(
        orElse: () => OnboardViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => OnboardView(key: args.key),
        settings: data,
      );
    },
    AuthView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const AuthView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    CreateAdminView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const CreateAdminView(),
        settings: data,
      );
    },
    RegisterMerchantView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const RegisterMerchantView(),
        settings: data,
      );
    },
    VerifyAdminView: (data) {
      var args = data.getArgs<VerifyAdminViewArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => VerifyAdminView(
          key: args.key,
          email: args.email,
        ),
        settings: data,
      );
    },
    VerifyAdminSuccessView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const VerifyAdminSuccessView(),
        settings: data,
      );
    },
    CreateAdminBusinessView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const CreateAdminBusinessView(),
        settings: data,
      );
    },
    CreateAccountSuccessView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const CreateAccountSuccessView(),
        settings: data,
      );
    },
    VerifyMerchantView: (data) {
      var args = data.getArgs<VerifyMerchantViewArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => VerifyMerchantView(
          key: args.key,
          emailAddress: args.emailAddress,
        ),
        settings: data,
      );
    },
    VerifyMerchantSuccessView: (data) {
      var args =
          data.getArgs<VerifyMerchantSuccessViewArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => VerifyMerchantSuccessView(
          key: args.key,
          emailAddress: args.emailAddress,
        ),
        settings: data,
      );
    },
    CompeleteMerchantRegister: (data) {
      var args =
          data.getArgs<CompeleteMerchantRegisterArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => CompeleteMerchantRegister(
          key: args.key,
          emailAddress: args.emailAddress,
        ),
        settings: data,
      );
    },
    AdminHomeView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const AdminHomeView(),
        settings: data,
      );
    },
    AccountSettingView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const AccountSettingView(),
        settings: data,
      );
    },
    AdminEditProfileView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const AdminEditProfileView(),
        settings: data,
      );
    },
    AdminManageMerchantAccountView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const AdminManageMerchantAccountView(),
        settings: data,
      );
    },
    AdminMerchantDetailView: (data) {
      var args = data.getArgs<AdminMerchantDetailViewArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => AdminMerchantDetailView(
          key: args.key,
          merchant: args.merchant,
        ),
        settings: data,
      );
    },
    AdminChangePasswordView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const AdminChangePasswordView(),
        settings: data,
      );
    },
    AdminHowItWorksView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const AdminHowItWorksView(),
        settings: data,
      );
    },
    CreateMerchantAccountView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const CreateMerchantAccountView(),
        settings: data,
      );
    },
    AddBranchView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const AddBranchView(),
        settings: data,
      );
    },
    AdminManageBranchView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const AdminManageBranchView(),
        settings: data,
      );
    },
    AdminBranchDetailView: (data) {
      var args = data.getArgs<AdminBranchDetailViewArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => AdminBranchDetailView(
          key: args.key,
          branch: args.branch,
        ),
        settings: data,
      );
    },
    AdminManageReportSettingView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const AdminManageReportSettingView(),
        settings: data,
      );
    },
    AdminDeleteAccountView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const AdminDeleteAccountView(),
        settings: data,
      );
    },
    MerchantHomeView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const MerchantHomeView(),
        settings: data,
      );
    },
    EditProfileView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const EditProfileView(),
        settings: data,
      );
    },
    HowItWorksView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const HowItWorksView(),
        settings: data,
      );
    },
    ChangePasswordView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const ChangePasswordView(),
        settings: data,
      );
    },
    LogNewExpenseView: (data) {
      var args = data.getArgs<LogNewExpenseViewArguments>(
        orElse: () => LogNewExpenseViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => LogNewExpenseView(key: args.key),
        settings: data,
      );
    },
    LogNewTransactionView: (data) {
      var args = data.getArgs<LogNewTransactionViewArguments>(
        orElse: () => LogNewTransactionViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => LogNewTransactionView(key: args.key),
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

/// VerifyMerchantSuccessView arguments holder class
class VerifyMerchantSuccessViewArguments {
  final Key? key;
  final String emailAddress;
  VerifyMerchantSuccessViewArguments({this.key, required this.emailAddress});
}

/// CompeleteMerchantRegister arguments holder class
class CompeleteMerchantRegisterArguments {
  final Key? key;
  final String emailAddress;
  CompeleteMerchantRegisterArguments({this.key, required this.emailAddress});
}

/// AdminMerchantDetailView arguments holder class
class AdminMerchantDetailViewArguments {
  final Key? key;
  final Merchant merchant;
  AdminMerchantDetailViewArguments({this.key, required this.merchant});
}

/// AdminBranchDetailView arguments holder class
class AdminBranchDetailViewArguments {
  final Key? key;
  final Branch branch;
  AdminBranchDetailViewArguments({this.key, required this.branch});
}

/// LogNewExpenseView arguments holder class
class LogNewExpenseViewArguments {
  final Key? key;
  LogNewExpenseViewArguments({this.key});
}

/// LogNewTransactionView arguments holder class
class LogNewTransactionViewArguments {
  final Key? key;
  LogNewTransactionViewArguments({this.key});
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
    Key? key,
    required String emailAddress,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.verifyMerchantSuccessView,
      arguments: VerifyMerchantSuccessViewArguments(
          key: key, emailAddress: emailAddress),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCompeleteMerchantRegister({
    Key? key,
    required String emailAddress,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.compeleteMerchantRegister,
      arguments: CompeleteMerchantRegisterArguments(
          key: key, emailAddress: emailAddress),
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

  Future<dynamic> navigateToAccountSettingView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.accountSettingView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAdminEditProfileView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.adminEditProfileView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAdminManageMerchantAccountView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.adminManageMerchantAccountView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAdminMerchantDetailView({
    Key? key,
    required Merchant merchant,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.adminMerchantDetailView,
      arguments: AdminMerchantDetailViewArguments(key: key, merchant: merchant),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAdminChangePasswordView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.adminChangePasswordView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAdminHowItWorksView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.adminHowItWorksView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCreateMerchantAccountView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.createMerchantAccountView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAddBranchView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.addBranchView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAdminManageBranchView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.adminManageBranchView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAdminBranchDetailView({
    Key? key,
    required Branch branch,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.adminBranchDetailView,
      arguments: AdminBranchDetailViewArguments(key: key, branch: branch),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAdminManageReportSettingView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.adminManageReportSettingView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAdminDeleteAccountView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.adminDeleteAccountView,
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

  Future<dynamic> navigateToEditProfileView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.editProfileView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToHowItWorksView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.howItWorksView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToChangePasswordView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.changePasswordView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToLogNewExpenseView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.logNewExpenseView,
      arguments: LogNewExpenseViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToLogNewTransactionView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.logNewTransactionView,
      arguments: LogNewTransactionViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
