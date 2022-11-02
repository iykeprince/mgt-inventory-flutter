import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/models/how_it_work.model.dart';
import 'package:pos_mobile_app/utils/how_it_works.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';
import 'package:timelines/timelines.dart';

import '../../../merchant/profile/howItWorks/how_it_works_view.dart';
import 'admin_how_it_works_view_model.dart';

class AdminHowItWorksView extends StatelessWidget {
  const AdminHowItWorksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminHowItWorksViewModel>.nonReactive(
      viewModelBuilder: () => AdminHowItWorksViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: ColorManager.kWhiteColor,
        appBar: Navbar(
          title: AppString.howItWorksText,
          onTap: model.navigateBack,
          iconColor: ColorManager.kDarkCharcoal,
        ),
        body: KeyboardAware(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              child: Column(
                children: [
                  const SizedBox(
                    height: AppSize.s24,
                  ),
                  PosToggleButton(
                    onItemSelected: (value) => model.handleItemSelected(value),
                  ),
                  const SizedBox(
                    height: AppSize.s32,
                  ),
                  const AdminHowItWorksContent()
                ],
              )),
        ),
      ),
    );
  }
}

class AdminHowItWorksContent extends ViewModelWidget<AdminHowItWorksViewModel> {
  const AdminHowItWorksContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AdminHowItWorksViewModel model) {
    return Expanded(
      child: ListView(
        children: getHowItWorks(model.selectedType ?? HowItWorksType.ADMIN_TYPE)
            .map(
              (item) => TimelineTile(
                contents: HowItWorksItem(
                  title: item.title,
                  content: item.content,
                ),
                nodeAlign: TimelineNodeAlign.start,
                // nodePosition: 0.0,

                node: const TimelineNode(
                  indicatorPosition: 0.09,
                  indicator: DotIndicator(color: ColorManager.kTimelineOrange),
                  startConnector:
                      SolidLineConnector(color: ColorManager.kTimelineBorder),
                  endConnector:
                      SolidLineConnector(color: ColorManager.kTimelineBorder),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  List<HowItWork> getHowItWorks(HowItWorksType type) {
    return type == HowItWorksType.ADMIN_TYPE
        ? ADMIN_HOW_IT_WORKS
        : MERCHANT_HOW_IT_WORKS;
  }
}
