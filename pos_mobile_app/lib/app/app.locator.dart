// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';

import '../client/dio_client.dart';
import '../services/admin.service.dart';
import '../services/authentication.service.dart';
import '../services/expense.service.dart';
import '../services/location.service.dart';
import '../services/merchant.service.dart';
import '../services/shared.service.dart';
import '../services/support.service.dart';
import '../services/transaction.service.dart';
import '../services/user.service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DioClient());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => MerchantService());
  locator.registerLazySingleton(() => AdminService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => TransactionService());
  locator.registerFactoryParam<LocationService, String?, dynamic>(
      (param1, param2) => LocationService(param1));
  locator.registerLazySingleton(() => SupportService());
  locator.registerLazySingleton(() => SharedService());
  locator.registerLazySingleton(() => ExpenseService());
}
