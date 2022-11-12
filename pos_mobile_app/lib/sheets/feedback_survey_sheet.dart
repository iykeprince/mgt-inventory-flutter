import 'package:flutter/material.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
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
    return BottomSheetContainer(
      padding: const EdgeInsets.all(0),
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
                  '${request!.title}',
                  style: getSemiBoldStyle(
                      color: ColorManager.kDarkCharcoal,
                      fontSize: FontSize.s18),
                ),
              ),
              IconButton(
                  onPressed: () => completer!(SheetResponse(confirmed: true)),
                  icon: Icon(Icons.cancel, color: ColorManager.kPinkSwan)),
            ],
          ),

          // Text(
          //   AppString.feedbackSurveyText,
          //   style: getMediumStyle(
          //     color: ColorManager.kDarkCharcoal,
          //     fontSize: FontSize.s18,
          //   ),
          // ),
          // const SizedBox(height: AppSize.s40),
          Text(
            AppString.whyAreYouDeletingYourAccount,
            style: getMediumStyle(
              color: ColorManager.kTurquoiseDarkColor,
              fontSize: FontSize.s16,
            ),
          ),
          const SizedBox(height: AppSize.s40),
          // PosCheckBox(
          //   onChanged: (value) {},
          //   value: true,
          //   richText: Text(
          //     AppString.iNoLongerNeedYourServicesText,
          //     style: getMediumStyle(
          //       color: ColorManager.kDarkCharcoal,
          //       fontSize: FontSize.s16,
          //     ),
          //   ),
          // ),
          Expanded(
            child: Column(
              children: [
                ListTile(
                  leading: Checkbox(
                    value: true,
                    checkColor: ColorManager.kWhiteColor,
                    activeColor: ColorManager.kPrimaryColor,
                    onChanged: (value) {
                      // setState(() {
                      //   _value = !_value;
                      // });

                      // widget.onChanged(_value);
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
                  leading: Checkbox(
                    value: false,
                    checkColor: ColorManager.kWhiteColor,
                    activeColor: ColorManager.kPrimaryColor,
                    onChanged: (value) {
                      // setState(() {
                      //   _value = !_value;
                      // });

                      // widget.onChanged(_value);
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
                  minVerticalPadding: 0,
                ),
                ListTile(
                  leading: Checkbox(
                    value: true,
                    checkColor: ColorManager.kWhiteColor,
                    activeColor: ColorManager.kPrimaryColor,
                    onChanged: (value) {
                      // setState(() {
                      //   _value = !_value;
                      // });

                      // widget.onChanged(_value);
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
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
                vertical: AppPadding.p20,
              ),
              child: Column(
                children: [
                  // Text(
                  //   AppString.anyComplaintRequestSuggestionText,
                  //   style: getMediumStyle(
                  //     color: ColorManager.kTurquoiseDarkColor,
                  //     fontSize: FontSize.s16,
                  //   ),
                  // ),
                  // const SizedBox(height: AppSize.s8),
                  Textarea(
                    label: AppString.anyComplaintRequestSuggestionText,
                    message: "hello",
                    maxLines: 6,
                  ),
                  PosButton(
                    onPressed: () {},
                    title: AppString.submitFeedback,
                    busy: false,
                    buttonType: ButtonType.fill,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
