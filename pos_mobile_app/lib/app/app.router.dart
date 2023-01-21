// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i36;
import 'package:flutter/material.dart';
import 'package:pos_mobile_app/models/branch.model.dart' as _i38;
import 'package:pos_mobile_app/models/merchant.model.dart' as _i37;
import 'package:pos_mobile_app/ui/admin/account_setting/account_setting_view.dart'
    as _i16;
import 'package:pos_mobile_app/ui/admin/account_setting/admin_branch_detail/admin_branch_detail_view.dart'
    as _i25;
import 'package:pos_mobile_app/ui/admin/account_setting/admin_change_password/admin_change_password_view.dart'
    as _i20;
import 'package:pos_mobile_app/ui/admin/account_setting/admin_delete_account/admin_delete_account_view.dart'
    as _i27;
import 'package:pos_mobile_app/ui/admin/account_setting/admin_edit_profile/admin_edit_profile_view.dart'
    as _i17;
import 'package:pos_mobile_app/ui/admin/account_setting/admin_howItWorks/admin_how_it_works_view.dart'
    as _i21;
import 'package:pos_mobile_app/ui/admin/account_setting/admin_manage_branch/admin_manage_branch_view.dart'
    as _i24;
import 'package:pos_mobile_app/ui/admin/account_setting/admin_manage_merchant_account/admin_manage_merchant_account_view.dart'
    as _i18;
import 'package:pos_mobile_app/ui/admin/account_setting/admin_manage_report_setting/admin_manage_report_setting_view.dart'
    as _i26;
import 'package:pos_mobile_app/ui/admin/account_setting/admin_merchant_detail/admin_merchant_detail_view.dart'
    as _i19;
import 'package:pos_mobile_app/ui/admin/admin_home_view.dart' as _i15;
import 'package:pos_mobile_app/ui/admin/dashboard/add_branch/add_branch_view.dart'
    as _i23;
import 'package:pos_mobile_app/ui/admin/dashboard/admin_transaction/admin_transaction_view.dart'
    as _i28;
import 'package:pos_mobile_app/ui/admin/dashboard/create_merchant_account/create_merchant_account_view.dart'
    as _i22;
import 'package:pos_mobile_app/ui/auth/auth_view.dart' as _i4;
import 'package:pos_mobile_app/ui/auth/compeleteMerchantRegistration/compelete_merchant_register.dart'
    as _i14;
import 'package:pos_mobile_app/ui/auth/createAccountSuccess/create_account_success_view.dart'
    as _i11;
import 'package:pos_mobile_app/ui/auth/createAdminBusiness/create_admin_business.dart'
    as _i10;
import 'package:pos_mobile_app/ui/auth/forgotPassword/forgot_password_view.dart'
    as _i6;
import 'package:pos_mobile_app/ui/auth/login/login_view.dart' as _i5;
import 'package:pos_mobile_app/ui/auth/registerMerchant/register_merchant_view.dart'
    as _i7;
import 'package:pos_mobile_app/ui/auth/verifyAdmin/verify_admin_view.dart'
    as _i8;
import 'package:pos_mobile_app/ui/auth/verifyAdminSuccess/verify_admin_success_view.dart'
    as _i9;
import 'package:pos_mobile_app/ui/auth/verifyMerchant/verify_merchant_view.dart'
    as _i12;
import 'package:pos_mobile_app/ui/auth/verifyMerchantSuccess/verify_merchant_success_view.dart'
    as _i13;
import 'package:pos_mobile_app/ui/merchant/dashboard/create_logs/new_expense/log_new_expense_view.dart'
    as _i34;
import 'package:pos_mobile_app/ui/merchant/dashboard/create_logs/new_transactions/log_new_transaction_view.dart'
    as _i35;
import 'package:pos_mobile_app/ui/merchant/merchant_home_view.dart' as _i30;
import 'package:pos_mobile_app/ui/merchant/profile/changepassword/change_password_view.dart'
    as _i33;
import 'package:pos_mobile_app/ui/merchant/profile/editprofile/edit_profile_view.dart'
    as _i31;
import 'package:pos_mobile_app/ui/merchant/profile/howItWorks/how_it_works_view.dart'
    as _i32;
import 'package:pos_mobile_app/ui/shared/contact_support/contact_support_view.dart'
    as _i29;
import 'package:pos_mobile_app/ui/shared/onboarding/onboarding_view.dart'
    as _i3;
import 'package:pos_mobile_app/ui/splash/splash_view.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i39;

class Routes {
  static const splashView = '/';

  static const onboardView = '/onboard-view';

  static const authView = '/auth-view';

  static const loginView = '/login-view';

  static const forgotPasswordView = '/forgot-password-view';

  static const registerMerchantView = '/register-merchant-view';

  static const verifyAdminView = '/verify-admin-view';

  static const verifyAdminSuccessView = '/verify-admin-success-view';

  static const createAdminBusinessView = '/create-admin-business-view';

  static const createAccountSuccessView = '/create-account-success-view';

  static const verifyMerchantView = '/verify-merchant-view';

  static const verifyMerchantSuccessView = '/verify-merchant-success-view';

  static const compeleteMerchantRegister = '/compelete-merchant-register';

  static const adminHomeView = '/admin-home-view';

  static const accountSettingView = '/account-setting-view';

  static const adminEditProfileView = '/admin-edit-profile-view';

  static const adminManageMerchantAccountView =
      '/admin-manage-merchant-account-view';

  static const adminMerchantDetailView = '/admin-merchant-detail-view';

  static const adminChangePasswordView = '/admin-change-password-view';

  static const adminHowItWorksView = '/admin-how-it-works-view';

  static const createMerchantAccountView = '/create-merchant-account-view';

  static const addBranchView = '/add-branch-view';

  static const adminManageBranchView = '/admin-manage-branch-view';

  static const adminBranchDetailView = '/admin-branch-detail-view';

  static const adminManageReportSettingView =
      '/admin-manage-report-setting-view';

  static const adminDeleteAccountView = '/admin-delete-account-view';

  static const adminTransactionView = '/admin-transaction-view';

  static const contactSupportView = '/contact-support-view';

  static const merchantHomeView = '/merchant-home-view';

  static const editProfileView = '/edit-profile-view';

  static const howItWorksView = '/how-it-works-view';

  static const changePasswordView = '/change-password-view';

  static const logNewExpenseView = '/log-new-expense-view';

  static const logNewTransactionView = '/log-new-transaction-view';

  static const all = <String>{
    splashView,
    onboardView,
    authView,
    loginView,
    forgotPasswordView,
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
    adminTransactionView,
    contactSupportView,
    merchantHomeView,
    editProfileView,
    howItWorksView,
    changePasswordView,
    logNewExpenseView,
    logNewTransactionView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.onboardView,
      page: _i3.OnboardView,
    ),
    _i1.RouteDef(
      Routes.authView,
      page: _i4.AuthView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i5.LoginView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i6.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.registerMerchantView,
      page: _i7.RegisterMerchantView,
    ),
    _i1.RouteDef(
      Routes.verifyAdminView,
      page: _i8.VerifyAdminView,
    ),
    _i1.RouteDef(
      Routes.verifyAdminSuccessView,
      page: _i9.VerifyAdminSuccessView,
    ),
    _i1.RouteDef(
      Routes.createAdminBusinessView,
      page: _i10.CreateAdminBusinessView,
    ),
    _i1.RouteDef(
      Routes.createAccountSuccessView,
      page: _i11.CreateAccountSuccessView,
    ),
    _i1.RouteDef(
      Routes.verifyMerchantView,
      page: _i12.VerifyMerchantView,
    ),
    _i1.RouteDef(
      Routes.verifyMerchantSuccessView,
      page: _i13.VerifyMerchantSuccessView,
    ),
    _i1.RouteDef(
      Routes.compeleteMerchantRegister,
      page: _i14.CompeleteMerchantRegister,
    ),
    _i1.RouteDef(
      Routes.adminHomeView,
      page: _i15.AdminHomeView,
    ),
    _i1.RouteDef(
      Routes.accountSettingView,
      page: _i16.AccountSettingView,
    ),
    _i1.RouteDef(
      Routes.adminEditProfileView,
      page: _i17.AdminEditProfileView,
    ),
    _i1.RouteDef(
      Routes.adminManageMerchantAccountView,
      page: _i18.AdminManageMerchantAccountView,
    ),
    _i1.RouteDef(
      Routes.adminMerchantDetailView,
      page: _i19.AdminMerchantDetailView,
    ),
    _i1.RouteDef(
      Routes.adminChangePasswordView,
      page: _i20.AdminChangePasswordView,
    ),
    _i1.RouteDef(
      Routes.adminHowItWorksView,
      page: _i21.AdminHowItWorksView,
    ),
    _i1.RouteDef(
      Routes.createMerchantAccountView,
      page: _i22.CreateMerchantAccountView,
    ),
    _i1.RouteDef(
      Routes.addBranchView,
      page: _i23.AddBranchView,
    ),
    _i1.RouteDef(
      Routes.adminManageBranchView,
      page: _i24.AdminManageBranchView,
    ),
    _i1.RouteDef(
      Routes.adminBranchDetailView,
      page: _i25.AdminBranchDetailView,
    ),
    _i1.RouteDef(
      Routes.adminManageReportSettingView,
      page: _i26.AdminManageReportSettingView,
    ),
    _i1.RouteDef(
      Routes.adminDeleteAccountView,
      page: _i27.AdminDeleteAccountView,
    ),
    _i1.RouteDef(
      Routes.adminTransactionView,
      page: _i28.AdminTransactionView,
    ),
    _i1.RouteDef(
      Routes.contactSupportView,
      page: _i29.ContactSupportView,
    ),
    _i1.RouteDef(
      Routes.merchantHomeView,
      page: _i30.MerchantHomeView,
    ),
    _i1.RouteDef(
      Routes.editProfileView,
      page: _i31.EditProfileView,
    ),
    _i1.RouteDef(
      Routes.howItWorksView,
      page: _i32.HowItWorksView,
    ),
    _i1.RouteDef(
      Routes.changePasswordView,
      page: _i33.ChangePasswordView,
    ),
    _i1.RouteDef(
      Routes.logNewExpenseView,
      page: _i34.LogNewExpenseView,
    ),
    _i1.RouteDef(
      Routes.logNewTransactionView,
      page: _i35.LogNewTransactionView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i2.SplashView(),
        settings: data,
      );
    },
    _i3.OnboardView: (data) {
      final args = data.getArgs<OnboardViewArguments>(
        orElse: () => const OnboardViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i3.OnboardView(key: args.key),
        settings: data,
      );
    },
    _i4.AuthView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i4.AuthView(),
        settings: data,
      );
    },
    _i5.LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => const LoginViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i5.LoginView(key: args.key),
        settings: data,
      );
    },
    _i6.ForgotPasswordView: (data) {
      final args = data.getArgs<ForgotPasswordViewArguments>(
        orElse: () => const ForgotPasswordViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i6.ForgotPasswordView(key: args.key),
        settings: data,
      );
    },
    _i7.RegisterMerchantView: (data) {
      final args = data.getArgs<RegisterMerchantViewArguments>(
        orElse: () => const RegisterMerchantViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i7.RegisterMerchantView(key: args.key),
        settings: data,
      );
    },
    _i8.VerifyAdminView: (data) {
      final args = data.getArgs<VerifyAdminViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i8.VerifyAdminView(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i9.VerifyAdminSuccessView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i9.VerifyAdminSuccessView(),
        settings: data,
      );
    },
    _i10.CreateAdminBusinessView: (data) {
      final args = data.getArgs<CreateAdminBusinessViewArguments>(
        orElse: () => const CreateAdminBusinessViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i10.CreateAdminBusinessView(key: args.key),
        settings: data,
      );
    },
    _i11.CreateAccountSuccessView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i11.CreateAccountSuccessView(),
        settings: data,
      );
    },
    _i12.VerifyMerchantView: (data) {
      final args = data.getArgs<VerifyMerchantViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i12.VerifyMerchantView(
            key: args.key, emailAddress: args.emailAddress),
        settings: data,
      );
    },
    _i13.VerifyMerchantSuccessView: (data) {
      final args =
          data.getArgs<VerifyMerchantSuccessViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i13.VerifyMerchantSuccessView(
            key: args.key, emailAddress: args.emailAddress),
        settings: data,
      );
    },
    _i14.CompeleteMerchantRegister: (data) {
      final args =
          data.getArgs<CompeleteMerchantRegisterArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i14.CompeleteMerchantRegister(
            key: args.key, emailAddress: args.emailAddress),
        settings: data,
      );
    },
    _i15.AdminHomeView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i15.AdminHomeView(),
        settings: data,
      );
    },
    _i16.AccountSettingView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i16.AccountSettingView(),
        settings: data,
      );
    },
    _i17.AdminEditProfileView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i17.AdminEditProfileView(),
        settings: data,
      );
    },
    _i18.AdminManageMerchantAccountView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i18.AdminManageMerchantAccountView(),
        settings: data,
      );
    },
    _i19.AdminMerchantDetailView: (data) {
      final args =
          data.getArgs<AdminMerchantDetailViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i19.AdminMerchantDetailView(
            key: args.key, merchant: args.merchant),
        settings: data,
      );
    },
    _i20.AdminChangePasswordView: (data) {
      final args = data.getArgs<AdminChangePasswordViewArguments>(
        orElse: () => const AdminChangePasswordViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i20.AdminChangePasswordView(key: args.key),
        settings: data,
      );
    },
    _i21.AdminHowItWorksView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i21.AdminHowItWorksView(),
        settings: data,
      );
    },
    _i22.CreateMerchantAccountView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i22.CreateMerchantAccountView(),
        settings: data,
      );
    },
    _i23.AddBranchView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i23.AddBranchView(),
        settings: data,
      );
    },
    _i24.AdminManageBranchView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i24.AdminManageBranchView(),
        settings: data,
      );
    },
    _i25.AdminBranchDetailView: (data) {
      final args = data.getArgs<AdminBranchDetailViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i25.AdminBranchDetailView(key: args.key, branch: args.branch),
        settings: data,
      );
    },
    _i26.AdminManageReportSettingView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i26.AdminManageReportSettingView(),
        settings: data,
      );
    },
    _i27.AdminDeleteAccountView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i27.AdminDeleteAccountView(),
        settings: data,
      );
    },
    _i28.AdminTransactionView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i28.AdminTransactionView(),
        settings: data,
      );
    },
    _i29.ContactSupportView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i29.ContactSupportView(),
        settings: data,
      );
    },
    _i30.MerchantHomeView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i30.MerchantHomeView(),
        settings: data,
      );
    },
    _i31.EditProfileView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i31.EditProfileView(),
        settings: data,
      );
    },
    _i32.HowItWorksView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i32.HowItWorksView(),
        settings: data,
      );
    },
    _i33.ChangePasswordView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i33.ChangePasswordView(),
        settings: data,
      );
    },
    _i34.LogNewExpenseView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i34.LogNewExpenseView(),
        settings: data,
      );
    },
    _i35.LogNewTransactionView: (data) {
      final args = data.getArgs<LogNewTransactionViewArguments>(
        orElse: () => const LogNewTransactionViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i35.LogNewTransactionView(key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class OnboardViewArguments {
  const OnboardViewArguments({this.key});

  final _i36.Key? key;
}

class LoginViewArguments {
  const LoginViewArguments({this.key});

  final _i36.Key? key;
}

class ForgotPasswordViewArguments {
  const ForgotPasswordViewArguments({this.key});

  final _i36.Key? key;
}

class RegisterMerchantViewArguments {
  const RegisterMerchantViewArguments({this.key});

  final _i36.Key? key;
}

class VerifyAdminViewArguments {
  const VerifyAdminViewArguments({
    this.key,
    required this.email,
  });

  final _i36.Key? key;

  final String email;
}

class CreateAdminBusinessViewArguments {
  const CreateAdminBusinessViewArguments({this.key});

  final _i36.Key? key;
}

class VerifyMerchantViewArguments {
  const VerifyMerchantViewArguments({
    this.key,
    required this.emailAddress,
  });

  final _i36.Key? key;

  final String emailAddress;
}

class VerifyMerchantSuccessViewArguments {
  const VerifyMerchantSuccessViewArguments({
    this.key,
    required this.emailAddress,
  });

  final _i36.Key? key;

  final String emailAddress;
}

class CompeleteMerchantRegisterArguments {
  const CompeleteMerchantRegisterArguments({
    this.key,
    required this.emailAddress,
  });

  final _i36.Key? key;

  final String emailAddress;
}

class AdminMerchantDetailViewArguments {
  const AdminMerchantDetailViewArguments({
    this.key,
    required this.merchant,
  });

  final _i36.Key? key;

  final _i37.Merchant merchant;
}

class AdminChangePasswordViewArguments {
  const AdminChangePasswordViewArguments({this.key});

  final _i36.Key? key;
}

class AdminBranchDetailViewArguments {
  const AdminBranchDetailViewArguments({
    this.key,
    required this.branch,
  });

  final _i36.Key? key;

  final _i38.Branch branch;
}

class LogNewTransactionViewArguments {
  const LogNewTransactionViewArguments({this.key});

  final _i36.Key? key;
}

extension NavigatorStateExtension on _i39.NavigationService {
  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.onboardView,
        arguments: OnboardViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAuthView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.authView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.forgotPasswordView,
        arguments: ForgotPasswordViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterMerchantView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.registerMerchantView,
        arguments: RegisterMerchantViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyAdminView({
    _i36.Key? key,
    required String email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.verifyAdminView,
        arguments: VerifyAdminViewArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyAdminSuccessView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.verifyAdminSuccessView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateAdminBusinessView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createAdminBusinessView,
        arguments: CreateAdminBusinessViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateAccountSuccessView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createAccountSuccessView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyMerchantView({
    _i36.Key? key,
    required String emailAddress,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.verifyMerchantView,
        arguments:
            VerifyMerchantViewArguments(key: key, emailAddress: emailAddress),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyMerchantSuccessView({
    _i36.Key? key,
    required String emailAddress,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.verifyMerchantSuccessView,
        arguments: VerifyMerchantSuccessViewArguments(
            key: key, emailAddress: emailAddress),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCompeleteMerchantRegister({
    _i36.Key? key,
    required String emailAddress,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.compeleteMerchantRegister,
        arguments: CompeleteMerchantRegisterArguments(
            key: key, emailAddress: emailAddress),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.adminHomeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAccountSettingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.accountSettingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminEditProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.adminEditProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminManageMerchantAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.adminManageMerchantAccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminMerchantDetailView({
    _i36.Key? key,
    required _i37.Merchant merchant,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.adminMerchantDetailView,
        arguments:
            AdminMerchantDetailViewArguments(key: key, merchant: merchant),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminChangePasswordView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.adminChangePasswordView,
        arguments: AdminChangePasswordViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminHowItWorksView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.adminHowItWorksView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateMerchantAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createMerchantAccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddBranchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addBranchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminManageBranchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.adminManageBranchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminBranchDetailView({
    _i36.Key? key,
    required _i38.Branch branch,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.adminBranchDetailView,
        arguments: AdminBranchDetailViewArguments(key: key, branch: branch),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminManageReportSettingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.adminManageReportSettingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminDeleteAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.adminDeleteAccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminTransactionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.adminTransactionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToContactSupportView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.contactSupportView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMerchantHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.merchantHomeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.editProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHowItWorksView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.howItWorksView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChangePasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.changePasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLogNewExpenseView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.logNewExpenseView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLogNewTransactionView({
    _i36.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.logNewTransactionView,
        arguments: LogNewTransactionViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
