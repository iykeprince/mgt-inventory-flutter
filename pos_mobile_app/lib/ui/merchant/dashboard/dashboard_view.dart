import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/utils/card_items.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
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
    final cardItem = CardItems.items(context);
    return Scaffold(
      appBar: Navbar(
        leadingText: AppString.overview,
        trailing: DropDownField(
          hint: 'Select Item',
          dropdownItems: items,
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
        ),
        automaticallyImplyLeading: false,
        statusBarBrightness: Brightness.light,
        statusBarColor: ColorManager.kDarkBlue,
        statusBarIconBrightness: Brightness.light,
        color: ColorManager.kWhiteColor,
      ),
      backgroundColor: ColorManager.kBackgroundolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p40,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: AppSize.s184,
                child: PageView.builder(
                    controller: PageController(viewportFraction: 0.86),
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: cardItem.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = cardItem[index];
                      return CardWidget(
                          amount: item.amount,
                          bgColor: item.color,
                          imgUrl: item.imgUrl,
                          title: item.title,
                          amountColor: item.amountColor,
                          titleColor: item.titleColor,
                          noRightMargin: cardItem.length - 1 == index);
                    }),
              ),
              const SizedBox(height: AppSize.s12),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p16, vertical: AppPadding.p24),
                  margin: const EdgeInsets.symmetric(
                      horizontal: ScreenHorizontalSize),
                  decoration: BoxDecoration(
                    color: ColorManager.kLightGreen1,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AppSize.s8),
                    ),
                    border: Border.all(
                      color: ColorManager.kBorderLightGreen,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                              'assets/images/MerchantDashboard/fontisto_wallet.svg'),
                          const SizedBox(
                            width: AppSize.s8,
                          ),
                          Text(
                            AppString.enterOpeningBalanceText,
                            style: getMediumStyle(
                                color: ColorManager.kPrimaryColor,
                                fontSize: FontSize.s16),
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: ColorManager.kPrimaryColor,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
