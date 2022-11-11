import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_ui_package/utils/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/ui/auth/compeleteMerchantRegistration/compelete_merchant_register_model.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../enums/bottom_sheet_type.dart';
import '../../../../models/admin.model.dart';
import '../../../../models/merchant.model.dart';
import '../../../../models/user.model.dart';
import '../../../../services/admin.service.dart';
import '../../../../services/authentication.service.dart';
import '../../../../services/merchant.service.dart';

const String UPDATE_ADMIN_PROFILE_TASK_OBJECT =
    'UPDATE_ADMIN_PROFILE_TASK_OBJECT';

class AdminEditProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();
  final _adminService = locator<AdminService>();

  bool _editProfile = false;

  bool get editProfile => _editProfile;

  User? get user => _authService.currentUser;
  Admin? get admin => _authService.currentAdminUser;

  navigateBack() => _navigationService.back();

  TextEditingController businessNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController homeAddressController = TextEditingController();

  String? get contactPhone => phoneController.text;
  String? get email => emailController.text;
  String? get address => homeAddressController.text;
  String? get businessName => businessNameController.text;

  handleEditProfile() {
    _editProfile = true;
    notifyListeners();
  }

  updateMerchant() {
    runBusyFuture(runUpdateAdmin(),
        busyObject: UPDATE_ADMIN_PROFILE_TASK_OBJECT);
  }

  Future runUpdateAdmin() async {
    var formData = {
      "businessName": businessName ?? admin?.businessName,
      "email": email ?? admin?.user?.email,
      "contactPhone": contactPhone ?? admin?.contactPhone,
      "homeAddress": address ?? admin?.address,
      // "branchId": merchant!.branchId
    };

    print(formData);
    setBusy(true);
    try {
      var response = await _adminService.updateAdmin(formData);
      Fluttertoast.showToast(
        msg: "Profile updated succesfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorManager.kDarkCharcoal,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return response;
    } on DioError catch (error) {
      print(error.response?.data["message"]);
      throw Exception(error.response?.data["message"]);
    } finally {
      setBusy(false);
      _editProfile = false;
    }
  }

// ignore: prefer_final_fields
  // BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  // Future<void> openSheet() async {
  //   var confirmationResponse = await _bottomSheetService.showCustomSheet(
  //     variant: BottomSheetType.openBalance,
  //     title: 'This is a floating bottom sheet',
  //     description:
  //         'This sheet is a custom built bottom sheet UI that allows you to show it from any service or viewmodel.',
  //     mainButtonTitle: 'Awesome!',
  //     secondaryButtonTitle: 'This is cool',
  //   );
  // }
}
