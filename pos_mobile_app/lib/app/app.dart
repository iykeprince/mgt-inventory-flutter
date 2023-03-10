import 'package:pos_mobile_app/client/dio_client.dart';
import 'package:pos_mobile_app/services/admin.service.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:pos_mobile_app/services/expense.service.dart';
import 'package:pos_mobile_app/services/location.service.dart';
import 'package:pos_mobile_app/services/transaction.service.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/account_setting_view.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/admin_branch_detail/admin_branch_detail_view.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/admin_change_password/admin_change_password_view.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/admin_delete_account/admin_delete_account_view.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/admin_edit_profile/admin_edit_profile_view.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/admin_howItWorks/admin_how_it_works_view.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/admin_manage_branch/admin_manage_branch_view.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/admin_manage_merchant_account/admin_manage_merchant_account_view.dart';
import 'package:pos_mobile_app/ui/admin/account_setting/admin_merchant_detail/admin_merchant_detail_view.dart';
import 'package:pos_mobile_app/ui/admin/admin_home_view.dart';
import 'package:pos_mobile_app/ui/admin/dashboard/add_branch/add_branch_view.dart';
import 'package:pos_mobile_app/ui/admin/dashboard/admin_transaction/admin_transaction_view.dart';
import 'package:pos_mobile_app/ui/admin/dashboard/create_merchant_account/create_merchant_account_view.dart';
import 'package:pos_mobile_app/ui/auth/auth_view.dart';
import 'package:pos_mobile_app/ui/auth/compeleteMerchantRegistration/compelete_merchant_register.dart';
import 'package:pos_mobile_app/ui/auth/createAccountSuccess/create_account_success_view.dart';
import 'package:pos_mobile_app/ui/auth/createAdminBusiness/create_admin_business.dart';
import 'package:pos_mobile_app/ui/auth/forgotPassword/forgot_password_view.dart';
import 'package:pos_mobile_app/ui/auth/login/login_view.dart';
import 'package:pos_mobile_app/ui/auth/registerMerchant/register_merchant_view.dart';
import 'package:pos_mobile_app/ui/auth/verifyAdmin/verify_admin_view.dart';
import 'package:pos_mobile_app/ui/auth/verifyAdminSuccess/verify_admin_success_view.dart';
import 'package:pos_mobile_app/ui/auth/verifyMerchant/verify_merchant_view.dart';
import 'package:pos_mobile_app/ui/auth/verifyMerchantSuccess/verify_merchant_success_view.dart';
import 'package:pos_mobile_app/ui/merchant/dashboard/create_logs/new_expense/log_new_expense_view.dart';
import 'package:pos_mobile_app/ui/merchant/dashboard/create_logs/new_transactions/log_new_transaction_view.dart';
import 'package:pos_mobile_app/ui/merchant/merchant_home_view.dart';
import 'package:pos_mobile_app/ui/merchant/profile/changepassword/change_password_view.dart';
import 'package:pos_mobile_app/ui/merchant/profile/editprofile/edit_profile_view.dart';
import 'package:pos_mobile_app/ui/merchant/profile/howItWorks/how_it_works_view.dart';
import 'package:pos_mobile_app/ui/splash/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/merchant.service.dart';
import '../services/shared.service.dart';
import '../services/support.service.dart';
import '../services/user.service.dart';
import '../ui/admin/account_setting/admin_manage_report_setting/admin_manage_report_setting_view.dart';
import '../ui/shared/contact_support/contact_support_view.dart';
import '../ui/shared/onboarding/onboarding_view.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: SplashView, initial: true),
    AdaptiveRoute(page: OnboardView),
    AdaptiveRoute(page: AuthView),
    AdaptiveRoute(page: LoginView),
    AdaptiveRoute(page: ForgotPasswordView),
    AdaptiveRoute(page: RegisterMerchantView),
    AdaptiveRoute(page: VerifyAdminView),
    AdaptiveRoute(page: VerifyAdminSuccessView),
    AdaptiveRoute(page: CreateAdminBusinessView),
    AdaptiveRoute(page: CreateAccountSuccessView),
    AdaptiveRoute(page: VerifyMerchantView),
    AdaptiveRoute(page: VerifyMerchantSuccessView),
    AdaptiveRoute(page: CompeleteMerchantRegister),

    /**Admin journey to be refactored */
    AdaptiveRoute(page: AdminHomeView),
    AdaptiveRoute(page: AccountSettingView),
    AdaptiveRoute(page: AdminEditProfileView),
    AdaptiveRoute(page: AdminManageMerchantAccountView),
    AdaptiveRoute(page: AdminMerchantDetailView),
    AdaptiveRoute(page: AdminChangePasswordView),
    AdaptiveRoute(page: AdminHowItWorksView),
    AdaptiveRoute(page: CreateMerchantAccountView),
    AdaptiveRoute(page: AddBranchView),
    AdaptiveRoute(page: AdminManageBranchView),
    AdaptiveRoute(page: AdminBranchDetailView),
    AdaptiveRoute(page: AdminManageReportSettingView),
    AdaptiveRoute(page: AdminDeleteAccountView),
    AdaptiveRoute(page: AdminTransactionView),
    AdaptiveRoute(page: ContactSupportView),

    /**Merchant Journey to be refactored */
    AdaptiveRoute(page: MerchantHomeView),
    AdaptiveRoute(page: EditProfileView),
    AdaptiveRoute(page: HowItWorksView),
    AdaptiveRoute(page: ChangePasswordView),
    AdaptiveRoute(page: LogNewExpenseView),
    AdaptiveRoute(page: LogNewTransactionView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DioClient),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: MerchantService),
    LazySingleton(classType: AdminService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: TransactionService),
    FactoryWithParam(classType: LocationService),
    LazySingleton(classType: SupportService),
    LazySingleton(classType: SharedService),
    LazySingleton(classType: ExpenseService),
  ],
  logger: StackedLogger(),
)
class App {}
