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
import 'package:pos_mobile_app/ui/merchant/merchant_home_view.dart';
import 'package:pos_mobile_app/ui/onboarding/onboarding_view.dart';
import 'package:pos_mobile_app/ui/splash/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: OnboardView),
    CupertinoRoute(page: AuthView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: CreateAdminView),
    MaterialRoute(page: RegisterMerchantView),
    MaterialRoute(page: VerifyAdminView),
    MaterialRoute(page: VerifyAdminSuccessView),
    MaterialRoute(page: CreateAdminBusinessView),
    MaterialRoute(page: CreateAccountSuccessView),
    MaterialRoute(page: VerifyMerchantView),
    MaterialRoute(page: VerifyMerchantSuccessView),
    MaterialRoute(page: CompeleteMerchantRegister),
    MaterialRoute(page: AdminHomeView),
    MaterialRoute(page: MerchantHomeView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DioClient),
    LazySingleton(classType: AuthenticationService),
  ],
  logger: StackedLogger(),
)
class App {}
