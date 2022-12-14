import 'package:dio/dio.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/enums/bottom_sheet_type.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:pos_mobile_app/utils/http_exception.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../services/admin.service.dart';

const String REMOVE_ADMIN_ACCOUNT_REQUEST = "REMOVE_ADMIN_ACCOUNT_REQUEST";

class AdminDeleteAccountViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _authenticationService = locator<AuthenticationService>();
  final _adminService = locator<AdminService>();

  void navigateBack() => _navigationService.back();

  showFeedbackSurveySheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.feedbackSurvey,
      title: AppString.feedbackSurveyText,
      mainButtonTitle: "Submit Feedback",
    );
    if (response!.confirmed) {
      print('confirmed account deleted');
      //run the delete task
      runBusyFuture(deleteAdminRequest(),
          busyObject: REMOVE_ADMIN_ACCOUNT_REQUEST);
    }
  }

  Future<void> deleteAdminRequest() async {
    setBusyForObject(REMOVE_ADMIN_ACCOUNT_REQUEST, true);
    try {
      String id = _authenticationService.currentUser!.id!;
      await _adminService.deleteAdminAccount(id);
      await _dialogService.showDialog(
        title: "Account Deleted",
        description: "Your account has been successfully removed!",
        buttonTitle: "Ok",
      );
      await _authenticationService.logout();
      _navigationService.pushNamedAndRemoveUntil(Routes.authView);
    } on DioError catch (e) {
      throw HttpException(e.response!.data["message"]);
    } finally {
      setBusyForObject(REMOVE_ADMIN_ACCOUNT_REQUEST, false);
    }
  }
}
