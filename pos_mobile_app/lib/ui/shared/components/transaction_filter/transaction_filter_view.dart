import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/ui/shared/components/transaction_filter/transaction_filter_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

import '../../../../models/date-filter.model.dart';

final List<DateFilter> DATE_FILTER_LIST = [
  DateFilter(day: 30, text: '30 days'),
  DateFilter(day: 90, text: '3 months'),
  DateFilter(day: 365, text: '1 year')
];

class TransactionFilterView extends StatelessWidget {
  const TransactionFilterView({
    Key? key,
    this.showDownload = false,
    this.onDownloadClick,
  }) : super(key: key);
  final bool? showDownload;
  final Function()? onDownloadClick;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransactionFilterViewModel>.reactive(
      viewModelBuilder: () => TransactionFilterViewModel(),
      builder: (context, model, child) {
        return Container(
          height: 36,
          margin: const EdgeInsets.symmetric(
            horizontal: AppPadding.p24,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: DATE_FILTER_LIST.length + 1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == DATE_FILTER_LIST.length) {
                      return GestureDetector(
                        onTap: () {
                          print('hello tapped');
                        },
                        child: SvgPicture.asset(
                          'assets/images/filter_icon.svg',
                          fit: BoxFit.cover,
                        ),
                      );
                    }
                    DateFilter item = DATE_FILTER_LIST[index];
                    return HistoryFilterItem(
                      item: item,
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: onDownloadClick,
                child: const Icon(
                  Icons.download,
                  color: ColorManager.kPrimaryColor,
                  size: AppSize.s24,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class HistoryFilterItem extends ViewModelWidget<TransactionFilterViewModel> {
  const HistoryFilterItem({
    Key? key,
    required this.item,
  }) : super(key: key);
  final DateFilter item;

  @override
  Widget build(BuildContext context, TransactionFilterViewModel model) {
    return GestureDetector(
      onTap: () {
        model.setSelectedFilter(item);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p8,
          horizontal: AppPadding.p12,
        ),
        margin: const EdgeInsets.only(right: AppSize.s12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s100),
          color: model.selectedFilter == item
              ? ColorManager.kLightIndigo
              : Colors.transparent,
        ),
        child: Center(
          child: Text(
            item.text,
            style: TextStyle(
              color: model.selectedFilter == item
                  ? ColorManager.kPrimaryColor
                  : ColorManager.kTurquoiseDarkColor,
              fontSize: FontSize.s14,
              fontWeight: model.selectedFilter == item
                  ? FontWeight.bold
                  : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
