import 'package:flutter/material.dart';
import 'package:pos_mobile_app/ui/shared/components/filter_drawer/filter_drawer_view_model.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FilterDrawerViewModel>.reactive(
      viewModelBuilder: () => FilterDrawerViewModel(),
      builder: (context, model, child) => Drawer(
        backgroundColor: ColorManager.kWhiteColor,
        width: MediaQuery.of(context).size.width - 20,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p24),
          child: ListView(children: [
            Align(
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                  )),
              alignment: Alignment.topRight,
            ),
            const SizedBox(height: AppSize.s40),
            Center(
              child: Text(
                'Filter Date',
                style: getMediumStyle(
                  color: ColorManager.kDarkColor,
                  fontSize: FontSize.s20,
                ),
              ),
            ),
            SizedBox(height: AppSize.s40),
            DatePicker(
              onSelected: (value) => model.handleFromDate(value),
              label: 'From',
              hintText: 'MM/DD/YYYY',
            ),
            if (model.startDateError != null)
              Text(
                model.startDateError ?? "",
                style: getRegularStyle(
                  color: ColorManager.kRed,
                ),
              ),
            SizedBox(height: AppSize.s40),
            DatePicker(
              onSelected: (value) => model.handleToDate(value),
              label: 'To',
              hintText: 'MM/DD/YYYY',
            ),
            if (model.endDateError != null)
              Text(
                model.endDateError ?? "",
                style: getRegularStyle(
                  color: ColorManager.kRed,
                ),
              ),
            SizedBox(height: AppSize.s40),
            Builder(
              builder: ((context) => PosButton(
                    onPressed: () => model.showResult(context),
                    busy: model.isBusy,
                    title: 'Show result',
                    buttonType: ButtonType.fill,
                    fontSize: FontSize.s16,
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
