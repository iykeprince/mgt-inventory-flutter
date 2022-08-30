import 'package:pos_mobile_app/client/dio_client.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:pos_mobile_app/ui/auth/auth_view.dart';
import 'package:pos_mobile_app/ui/onboarding/onboarding_view.dart';
import 'package:pos_mobile_app/ui/splash/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(
      page: SplashView,
      initial: true,
    ),
    MaterialRoute(page: OnboardView),
    CupertinoRoute(page: AuthView),
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
