import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_mobile_app/app/app.locator.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/merchant.model.dart';
import '../../../models/user.model.dart';
import '../../../services/authentication.service.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();
  final _dialogService = locator<DialogService>();

  // final storageRef = FirebaseStorage.instance.ref();
  final ImagePicker _picker = ImagePicker();

  User? get user => _authService.currentUser;
  Merchant? get merchant => _authService.currentMerchantUser;

  navigateToEditProfile() =>
      _navigationService.navigateTo(Routes.editProfileView);

  navigateToHowItWorks() =>
      _navigationService.navigateTo(Routes.howItWorksView);

  navigateToChangePassword() =>
      _navigationService.navigateTo(Routes.changePasswordView);

  navigateToContactSupport() =>
      _navigationService.navigateTo(Routes.contactSupportView);

  logout() async {
    await _authService.logout();
    _navigationService.pushNamedAndRemoveUntil(Routes.authView);
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
      setBusy(true);
      notifyListeners();
      print('confirmed response');
      File file = File(selectedImage!.path);
      String ext = file.path.split('.').last;
      String filename = '${user!.id}.$ext';
      print('filename: $filename');
      // try {
      //   final ref = storageRef.child("profiles/$filename");
      //   var task = await ref.putFile(file);
      //   if (task.state == TaskState.success) {
      //     String url = await ref.getDownloadURL();

      //     // var formData = {
      //     //   "email": user!.email,
      //     //   "businessName": admin!.businessName,
      //     //   "homeAddress": admin!.address,
      //     //   "contactPhone": admin!.contactPhone,
      //     //   'imgUrl': url,
      //     // };
      //     // print(formData);
      //     // await _adminService.updateAdmin(formData);
      //     await _authService.getCurrentAdminUser();
      //     setMessage("Image uploaded and updated");
      //   }
      //   // var snapshot = await task.whenComplete(() => {});

      //   // String url = await snapshot.ref.getDownloadURL();
      //   // print('download url: $url');
      //   //update the admin profile

      // } on FirebaseException catch (e) {
      //   throw HttpException('Error: ${e.message}');
      // } finally {
      //   setBusy(false);
      //   notifyListeners();
      // }
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
}
