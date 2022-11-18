import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AdminTransactionViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateBack() => _navigationService.back();
}
