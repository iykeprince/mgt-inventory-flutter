import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/enums/bottom_sheet_type.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AdminDeleteAccountViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  void navigateBack() => _navigationService.back();

  showFeedbackSurveySheet() async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.feedbackSurvey,
      title: AppString.feedbackSurveyText,
      mainButtonTitle: "Submit Feedback",
    );
  }
}
