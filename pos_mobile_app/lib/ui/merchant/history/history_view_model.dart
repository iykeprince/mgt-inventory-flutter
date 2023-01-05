import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class HistoryViewModel extends BaseViewModel {
  void openEndDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
    print('why');
    notifyListeners();
  }
}
