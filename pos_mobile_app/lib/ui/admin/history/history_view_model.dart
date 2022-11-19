import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/dummy.widget/listtile_widget.dart';
import 'package:pos_mobile_app/services/transaction.service.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:pos_mobile_ui_package/utils/font_styles.dart';
import 'package:pos_mobile_ui_package/utils/text_styles.dart';
import 'package:stacked/stacked.dart';

import '../../../models/transaction.model.dart';

class AdminHistoryViewModel extends BaseViewModel {
  String? _selectedValue;
  String? _selectedFilter;
  String? get selectedValue => _selectedValue;
  String? get selectedFilter => _selectedFilter;

  List<Transaction>? get transactions => [];

  handleSelectedValue(value) {
    _selectedValue = value;
    notifyListeners();
  }

  setSelectedFilter(String filter) {
    _selectedFilter = filter;
    notifyListeners();
  }

  List<ListTileWidget> cardLists(BuildContext context) {
    return [];
  }
}
