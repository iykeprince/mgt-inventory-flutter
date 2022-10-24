import 'package:pos_mobile_app/client/dio_client.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:pos_mobile_app/ui/admin/admin_home_view.dart';
import 'package:pos_mobile_app/ui/auth/auth_view.dart';
import 'package:pos_mobile_app/ui/auth/compeleteMerchantRegistration/compelete_merchant_register.dart';
import 'package:pos_mobile_app/ui/auth/createAccountSuccess/create_account_success_view.dart';
import 'package:pos_mobile_app/ui/auth/createAdmin/create_admin_view.dart';
import 'package:pos_mobile_app/ui/auth/createAdminBusiness/create_admin_business.dart';
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
import 'package:pos_mobile_app/ui/onboarding/onboarding_view.dart';
import 'package:pos_mobile_app/ui/splash/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/merchant.service.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: SplashView, initial: true),
    AdaptiveRoute(page: OnboardView),
    AdaptiveRoute(page: AuthView),
    AdaptiveRoute(page: LoginView),
    AdaptiveRoute(page: CreateAdminView),
    AdaptiveRoute(page: RegisterMerchantView),
    AdaptiveRoute(page: VerifyAdminView),
    AdaptiveRoute(page: VerifyAdminSuccessView),
    AdaptiveRoute(page: CreateAdminBusinessView),
    AdaptiveRoute(page: CreateAccountSuccessView),
    AdaptiveRoute(page: VerifyMerchantView),
    AdaptiveRoute(page: VerifyMerchantSuccessView),
    AdaptiveRoute(page: CompeleteMerchantRegister),
    AdaptiveRoute(page: AdminHomeView),
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
    LazySingleton(classType: MerchantService)
  ],
  logger: StackedLogger(),
)
class App {}
