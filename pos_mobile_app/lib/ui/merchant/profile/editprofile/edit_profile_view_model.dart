import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/ui/auth/compeleteMerchantRegistration/compelete_merchant_register_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../enums/bottom_sheet_type.dart';
import '../../../../models/merchant.model.dart';
import '../../../../models/user.model.dart';
import '../../../../services/authentication.service.dart';
import '../../../../services/merchant.service.dart';

class EditProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();
  final _merchantService = locator<MerchantService>();

  User? get user => _authService.currentUser;
  Merchant? get merchant => _authService.currentMerchantUser;

  navigateBack() => _navigationService.back();

  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String? _contactPhone;
  String? _email;
  String? _address;
  String? _fullname;

  String? get contactPhone => phoneController.text;
  String? get email => emailController.text;
  String? get address => addressController.text;
  String? get fullname => fullnameController.text;

  setPhone(String value) {
    _contactPhone = value;
  }

  setAddress(String value) {
    _address = value;
  }

  setEmail(String value) {
    _email = value;
  }

  setFullname(String value) {
    _fullname = value;
  }

  updateMerchant() {
    runBusyFuture(runUpdateMerchant(),
        busyObject: UPDATE_MERCHANT_PROFILE_TASK_OBJECT);
  }

  Future runUpdateMerchant() async {
    var formData = {
      "name": fullname ?? merchant?.name,
      "email": email ?? merchant?.user?.email,
      "contactPhone": contactPhone ?? merchant?.contactPhone,
      "address": address ?? merchant?.address,
      "branchId": merchant!.branchId
    };

    print(formData);
    setBusy(true);
    try {
      var response = await _merchantService.updateMerchant(formData);

      _navigationService.navigateTo(
        Routes.merchantHomeView,
      );
      return response;
    } on DioError catch (error) {
      print(error.response?.data["message"]);
      throw Exception(error.response?.data["message"]);
    } finally {
      setBusy(false);
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