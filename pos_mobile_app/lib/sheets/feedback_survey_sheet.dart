// ignore_for_file: avoid_renaming_method_parameters, constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FeedbackSurveyBottomSheet extends StatelessWidget {
  final SheetRequest? request;
  final Function(SheetResponse)? completer;

  const FeedbackSurveyBottomSheet({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedbackSurveySheetViewModel>.reactive(
        viewModelBuilder: () => FeedbackSurveySheetViewModel(),
        builder: (context, model, child) {
          return BottomSheetContainer(
            padding: const EdgeInsets.all(0),
            child: model.feedbackView == FeedbackView.SURVEY
                ? FeedbackSurveyWidget(completer: completer!)
                : AccountDataWidget(completer: completer!),
          );
        });
  }
}

class FeedbackSurveyWidget
    extends ViewModelWidget<FeedbackSurveySheetViewModel> {
  const FeedbackSurveyWidget({
    Key? key,
    required this.completer,
  }) : super(key: key);
  final Function(SheetResponse) completer;

  @override
  Widget build(BuildContext context, FeedbackSurveySheetViewModel model) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: AppMargin.m12),
              decoration: const BoxDecoration(
                color: ColorManager.kPinkSwan,
              ),
              width: AppSize.s64,
              height: AppSize.s4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Center(
                  child: Text(
                    'Feedback Survey',
                    style: getSemiBoldStyle(
                        color: ColorManager.kDarkCharcoal,
                        fontSize: FontSize.s18),
                  ),
                ),
                IconButton(
                    onPressed: () => completer(SheetResponse(confirmed: false)),
                    icon: const Icon(Icons.cancel,
                        color: ColorManager.kPinkSwan)),
              ],
            ),
            Text(
              AppString.whyAreYouDeletingYourAccount,
              style: getMediumStyle(
                color: ColorManager.kTurquoiseDarkColor,
                fontSize: FontSize.s16,
              ),
            ),
            const SizedBox(height: AppSize.s20),
            Column(
              children: [
                ListTile(
                  onTap: () {
                    model.handleIsServiceNotNeeded();
                  },
                  leading: Checkbox(
                    value: model.feedbackData["isServiceNotNeeded"],
                    checkColor: ColorManager.kWhiteColor,
                    activeColor: ColorManager.kPrimaryColor,
                    onChanged: (value) {
                      model.handleIsServiceNotNeeded();
                    },
                  ),
                  title: Text(
                    AppString.iNoLongerNeedYourServicesText,
                    style: getMediumStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s16,
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                ),
                ListTile(
                  onTap: () {
                    model.handleIsFoundBetterOption();
                  },
                  leading: Checkbox(
                    value: model.feedbackData["isFoundBetterOption"],
                    checkColor: ColorManager.kWhiteColor,
                    activeColor: ColorManager.kPrimaryColor,
                    onChanged: (value) {
                      model.handleIsFoundBetterOption();
                      // widget.onChanged(_value);
                    },
                  ),
                  title: Text(
                    "I found a better option",
                    style: getMediumStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s16,
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                  minVerticalPadding: 0,
                ),
                ListTile(
                  onTap: () {
                    model.handleIsPoorCustomerSupport();
                  },
                  leading: Checkbox(
                    value: model.feedbackData["isPoorCustomerSupport"],
                    checkColor: ColorManager.kWhiteColor,
                    activeColor: ColorManager.kPrimaryColor,
                    onChanged: (value) {
                      model.handleIsPoorCustomerSupport();
                    },
                  ),
                  title: Text(
                    "Customer support team is poor",
                    style: getMediumStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s16,
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                ),
                ListTile(
                  onTap: () {
                    model.handleIsOther();
                  },
                  leading: Checkbox(
                    value: model.feedbackData["other"],
                    checkColor: ColorManager.kWhiteColor,
                    activeColor: ColorManager.kPrimaryColor,
                    onChanged: (value) {
                      model.handleIsOther();
                    },
                  ),
                  title: Text(
                    "Other",
                    style: getMediumStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s16,
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                )
              ],
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
                vertical: AppPadding.p8,
              ),
              child: Column(
                children: [
                  Textarea(
                      label: AppString.anyComplaintRequestSuggestionText,
                      maxLines: 6,
                      controller: model.textController),
                  const SizedBox(height: AppSize.s12),
                  PosButton(
                    onPressed: () {
                      model.submitFeedback(completer);
                    },
                    title: AppString.submitFeedback,
                    busy: model.isBusy,
                    buttonType: ButtonType.fill,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountDataWidget extends ViewModelWidget<FeedbackSurveySheetViewModel> {
  const AccountDataWidget({
    Key? key,
    required this.completer,
  }) : super(key: key);
  final Function(SheetResponse) completer;

  @override
  Widget build(BuildContext context, FeedbackSurveySheetViewModel model) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: AppMargin.m12),
              decoration: const BoxDecoration(
                color: ColorManager.kPinkSwan,
              ),
              width: AppSize.s64,
              height: AppSize.s4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      model.setFeedView(FeedbackView.SURVEY);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: AppSize.s24,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Account Data',
                      style: getSemiBoldStyle(
                          color: ColorManager.kDarkCharcoal,
                          fontSize: FontSize.s18),
                    ),
                  ),
                  IconButton(
                      onPressed: () =>
                          completer(SheetResponse(confirmed: false)),
                      icon: const Icon(Icons.cancel,
                          color: ColorManager.kPinkSwan)),
                ],
              ),
            ),
            const SizedBox(height: AppSize.s20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s24),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      model.handleIsServiceNotNeeded();
                    },
                    title: Text(
                      "Send complete account data to my registered email address",
                      style: getMediumStyle(
                        color: ColorManager.kDarkCharcoal,
                        fontSize: FontSize.s16,
                      ),
                    ),
                    trailing: CupertinoSwitch(
                      value: model.accountData["isSendCompleteAccountData"],
                      onChanged: (value) =>
                          model.handleIsSendCompleteAccountData(),
                      activeColor: ColorManager.kPrimaryColor,
                    ),
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                  ),
                  ListTile(
                    onTap: () {
                      model.handleIsServiceNotNeeded();
                    },
                    title: Text(
                      "Download account data to my mobile device",
                      style: getMediumStyle(
                        color: ColorManager.kDarkCharcoal,
                        fontSize: FontSize.s16,
                      ),
                    ),
                    trailing: CupertinoSwitch(
                      value: model.accountData["isDownloadAccountDataToMobile"],
                      onChanged: (value) =>
                          model.handleIsDownloadAccountDataToMobile(),
                      activeColor: ColorManager.kPrimaryColor,
                    ),
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                  ),
                  const Divider(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
                vertical: AppPadding.p8,
              ),
              child: PosButton(
                onPressed: () {
                  model.deleteAccount(completer);
                },
                title: AppString.submitFeedback,
                busy: model.busy(DELETE_ACCOUNT),
                buttonType: ButtonType.fill,
                buttonBgColor: ColorManager.kRed,
                buttonTextColor: ColorManager.kWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum FeedbackView { SURVEY, ACCOUNT_DATA }

const String DELETE_ACCOUNT = "DELETE_ACCOUNT";

class FeedbackSurveySheetViewModel extends BaseViewModel {
  final logger = locator<Logger>();
  TextEditingController textController = TextEditingController();
  Map<String, dynamic> feedbackData = {
    "isServiceNotNeeded": false,
    "isFoundBetterOption": false,
    "isPoorCustomerSupport": false,
    "other": false,
    "text": "",
  };

  Map<String, dynamic> accountData = {
    "isSendCompleteAccountData": false,
    "isDownloadAccountDataToMobile": false,
  };

  FeedbackView _feedbackView = FeedbackView.SURVEY;
  FeedbackView get feedbackView => _feedbackView;

  submitFeedback(Function(SheetResponse)? completer) {
    var formData = {...feedbackData, "text": textController.text};
    setBusy(true);
    Future.delayed(const Duration(seconds: 2), () async {
      logger.i(formData);
      // completer!(
      //   SheetResponse(
      //     confirmed: true,
      //     data: feedbackData,
      //   ),
      // );
      _feedbackView = FeedbackView.ACCOUNT_DATA;
      setBusy(false);
      notifyListeners();
    });
  }

  void handleIsServiceNotNeeded() {
    feedbackData["isServiceNotNeeded"] = !feedbackData["isServiceNotNeeded"];
    notifyListeners();
  }

  void handleIsFoundBetterOption() {
    feedbackData["isFoundBetterOption"] = !feedbackData["isFoundBetterOption"];
    notifyListeners();
  }

  void handleIsPoorCustomerSupport() {
    feedbackData["isPoorCustomerSupport"] =
        !feedbackData["isPoorCustomerSupport"];
    notifyListeners();
  }

  void handleIsOther() {
    feedbackData["other"] = !feedbackData["other"];
    notifyListeners();
  }

  void setFeedView(FeedbackView survey) {
    _feedbackView = survey;
    notifyListeners();
  }

  void deleteAccount(Function(SheetResponse) completer) async {
    setBusyForObject(DELETE_ACCOUNT, true);
    Future.delayed(const Duration(seconds: 2), () {
      completer(SheetResponse(confirmed: true));
      setBusyForObject(DELETE_ACCOUNT, false);
    });
  }

  handleIsSendCompleteAccountData() {
    accountData["isSendCompleteAccountData"] =
        !accountData["isSendCompleteAccountData"];
    notifyListeners();
  }

  handleIsDownloadAccountDataToMobile() {
    accountData["isDownloadAccountDataToMobile"] =
        !accountData["isDownloadAccountDataToMobile"];
    notifyListeners();
  }
}
