import 'dart:io';

import 'package:dio/dio.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
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
import '../../../../utils/http_exception.dart';

const String UPDATE_ADMIN_PROFILE_TASK_OBJECT =
    'UPDATE_ADMIN_PROFILE_TASK_OBJECT';

class AdminEditProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();
  final _adminService = locator<AdminService>();
  final _dialogService = locator<DialogService>();

  // final storageRef = FirebaseStorage.instance.ref();
  final ImagePicker _picker = ImagePicker();
  File? _selectedFile;
  File? get selectedFile => _selectedFile;

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
    setBusy(true);

    File file = File(_selectedFile!.path);
    String ext = file.path.split('.').last;
    String filename = '${user!.id}.$ext';
    print('filename: $filename');

    String? imgUrl;
    // final ref = storageRef.child("profiles/$filename");
    // var task = await ref.putFile(_selectedFile!);
    // if (task.state == TaskState.success) {
    //   imgUrl = await ref.getDownloadURL();
    // }

    var formData = {
      "businessName": businessName ?? admin?.businessName,
      "email": email ?? admin?.user?.email,
      "contactPhone": contactPhone ?? admin?.contactPhone,
      "homeAddress": address ?? admin?.address,
      'imgUrl': imgUrl ?? admin?.imgUrl,
      // "branchId": merchant!.branchId
    };

    print(formData);
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
      throw HttpException(error.response?.data["message"]);
    } finally {
      setBusy(false);
      _editProfile = false;
    }
  }

  XFile? _selectedImage;
  XFile? get selectedImage => _selectedImage;

  handleImageSelect() async {
    if (selectedImage == null) return;

    var response = await _dialogService.showConfirmationDialog(
      // Which builder you'd like to call that was assigned in the builders function above.
      title: 'Profile Image',
      description:
          'Do you really want to proceed? If you proceed with this operation, you can always change it.',
      confirmationTitle: 'Yes',
      cancelTitle: 'No',
    );
    if (response!.confirmed) {
      _selectedFile = File(selectedImage!.path);
    }
  }

  Future<void> handleBrowseFileSelect() async {
    _selectedImage = await _picker.pickImage(source: ImageSource.gallery);
    handleImageSelect();
  }

  Future<void> handleGallerySelect() async {
    _selectedImage = await _picker.pickImage(source: ImageSource.gallery);
    handleImageSelect();
  }

  Future<void> handleCameraSelect() async {
    _selectedImage = await _picker.pickImage(source: ImageSource.camera);
    handleImageSelect();
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
