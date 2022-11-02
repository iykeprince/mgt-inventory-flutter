import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/merchant/profile/howItWorks/how_it_works_view_model.dart';
import 'package:pos_mobile_app/utils/how_it_works.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';
import 'package:timelines/timelines.dart';

class HowItWorksView extends StatelessWidget {
  const HowItWorksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HowItWorksViewModel>.nonReactive(
      viewModelBuilder: () => HowItWorksViewModel(),
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
            child: ListView(
              children: MERCHANT_HOW_IT_WORKS
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
                        indicator:
                            DotIndicator(color: ColorManager.kTimelineOrange),
                        startConnector: SolidLineConnector(
                            color: ColorManager.kTimelineBorder),
                        endConnector: SolidLineConnector(
                            color: ColorManager.kTimelineBorder),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
