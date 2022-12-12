import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/enums/bottom_sheet_type.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AdminDeleteAccountViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _authenticationService = locator<AuthenticationService>();

  void navigateBack() => _navigationService.back();

  showFeedbackSurveySheet() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.feedbackSurvey,
      title: AppString.feedbackSurveyText,
      mainButtonTitle: "Submit Feedback",
    );
    if (response!.confirmed) {
      print('confirmed account deleted');
      await _dialogService.showDialog(
        title: "Account Deleted",
        description: "Your account has been successfully removed!",
        buttonTitle: "Ok",
      );
      await _authenticationService.logout();
      _navigationService.pushNamedAndRemoveUntil(Routes.authView);
    }
  }
}
