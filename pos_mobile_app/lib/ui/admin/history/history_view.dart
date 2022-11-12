import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pos_mobile_app/dummy.widget/listtile_widget.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import 'history_view_model.dart';

class AdminHistoryView extends StatelessWidget {
  AdminHistoryView({Key? key}) : super(key: key);
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminHistoryViewModel>.nonReactive(
        viewModelBuilder: () => AdminHistoryViewModel(),
        builder: (context, model, child) {
          final cardList = model.cardLists(context);
          return (Scaffold(
            appBar: Navbar(
              leadingText: AppString.welecome,
              leadingStyle: getMediumStyle(
                  color: ColorManager.kLightGray, fontSize: FontSize.s16),
              leadingBottomStyle: getBoldStyle(
                  color: ColorManager.kDarkCharcoal, fontSize: FontSize.s20),
              bottomLeadingText: AppString.businessNamePlaceholder,
              trailing: PosDropDownField(
                hint: 'Select Item',
                dropdownItems: items,
                value: selectedValue,
                onChanged: model.handleSelectedValue,
              ),
              automaticallyImplyLeading: false,
              statusBarBrightness: Brightness.light,
              statusBarColor: ColorManager.kDarkBlue,
              statusBarIconBrightness: Brightness.light,
              color: ColorManager.kWhiteColor,
              elevation: .5,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 40.0, horizontal: 24.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Today',
                          style: getSemiBoldStyle(
                              color: ColorManager.kOuterSpaceColor,
                              fontSize: FontSize.s20)),
                      const SizedBox(
                        height: AppSize.s12,
                      ),
                      Container(
                        padding: const EdgeInsets.all(AppSize.s24),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: ColorManager.kButtonTextNavyBlue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(AppSize.s4))),
                        child: RichText(
                          text: TextSpan(
                            text: 'Opening Cash : ',
                            style: getSemiBoldStyle(
                                color: ColorManager.kWhiteColor,
                                fontSize: FontSize.s12),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'NGN 20,0000000',
                                  style: getBoldStyle(
                                      color: ColorManager.kWhiteColor,
                                      fontSize: FontSize.s16)),
                            ],
                          ),
                        ),
                      ),
                      GridView.count(
                        primary: false,
                        padding: const EdgeInsets.only(
                            bottom: AppPadding.p40, top: AppPadding.p16),
                        crossAxisCount: 2,
                        crossAxisSpacing: AppSize.s8,
                        mainAxisSpacing: AppSize.s8,
                        shrinkWrap: true,
                        childAspectRatio: (1 / 0.9),
                        children: List.generate(cardList.length, (index) {
                          return ListTileWidget(
                            color: cardList[index].color,
                            child: cardList[index].child,
                          );
                        }),
                      ),
                    ]),
              ),
            ),
          ));
        });
  }
}
