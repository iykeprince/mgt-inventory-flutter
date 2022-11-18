import 'package:flutter/gestures.dart';
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
            appBar: AppBar(
              title: Text(
                AppString.transactionHistory,
                style: getMediumStyle(
                  color: ColorManager.kPrimaryColor,
                  fontSize: FontSize.s20,
                ),
              ),
              backgroundColor: ColorManager.kWhiteColor,
              actions: [
                Container(
                  margin: EdgeInsets.only(
                    top: AppPadding.p8,
                    right: AppPadding.p10,
                  ),
                  child: PosDropDownField(
                    hint: 'PaySure POS',
                    dropdownItems: items,
                    value: selectedValue,
                    onChanged: model.handleSelectedValue,
                  ),
                ),
              ],
              automaticallyImplyLeading: false,
              elevation: .5,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 40.0, horizontal: 24.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppPadding.p16),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: ColorManager.kPrimaryColor,
                          ),
                        ),
                        child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Text('$index month');
                          },
                        ),
                      ),
                      SizedBox(height: AppPadding.p16),
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
