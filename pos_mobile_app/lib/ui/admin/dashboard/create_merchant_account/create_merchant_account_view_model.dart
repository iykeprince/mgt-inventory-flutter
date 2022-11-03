import 'package:flutter/material.dart';
import 'package:pos_mobile_app/services/authentication.service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../models/branch.model.dart';
import '../../../../services/admin.service.dart';

class CreateMerchantAccountViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _adminService = locator<AdminService>();

  String? _selectedValue;
  String? get selectedValue => _selectedValue;

  navigateBack() => _navigationService.back();

  List<Branch>? get branches => _adminService.branches;

  TextEditingController merchantNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController branchController = TextEditingController();

  String? get merchantName => merchantNameController.text;
  String? get email => emailController.text;
  String? get branch => branchController.text;

  setBranch(String value) {
    _selectedValue = value;
    Map<String, dynamic> map = transformBranchListToMap(branches!);
    var branchObj = map[value];
    branchController.text = branchObj['id'];
    print('branch obj: $map');
    notifyListeners();
  }

  transformBranchListToMap(List<Branch> branches) {
    Map<String, dynamic> obj = {};
    for (var element in branches) {
      obj[element.name!] = element;
    }
    return obj;
  }

  createMerchantAccount() {
    var formData = {"name": merchantName, "email": email, "branchId": branch};
    print('form Data: $formData');
  }
}
