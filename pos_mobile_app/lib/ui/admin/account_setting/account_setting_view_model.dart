import 'dart:io';
import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_mobile_app/app/app.router.dart';
import 'package:pos_mobile_app/enums/dialog_type.dart';
import 'package:pos_mobile_app/models/admin.model.dart';
import 'package:pos_mobile_app/services/admin.service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/app.locator.dart';
import '../../../models/user.model.dart';
import '../../../services/authentication.service.dart';

Uri url = Uri.parse("https://flutter.dev");

class AccountSettingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();
  final _dialogService = locator<DialogService>();
  final _adminService = locator<AdminService>();

  final storageRef = FirebaseStorage.instance.ref();
  final ImagePicker _picker = ImagePicker();

  bool _isUploaded = false;
  double _uploadProgress = 0;
  bool _isUploading = false;

  bool get isUploading => _isUploading;
  bool get isUploaded => _isUploaded;
  double get uploadProgress => _uploadProgress;

  User? get user => _authService.currentUser;
  Admin? get admin => _authService.currentAdminUser;

  navigateToEditProfile() =>
      _navigationService.navigateTo(Routes.adminEditProfileView);

  navigateToManageMerchantAccount() =>
      _navigationService.navigateTo(Routes.adminManageMerchantAccountView);

  navigateToManageBranches() =>
      _navigationService.navigateTo(Routes.adminManageBranchView);

  navigateToManageReportSettings() =>
      _navigationService.navigateTo(Routes.adminManageReportSettingView);

  navigateToHowItWorks() =>
      _navigationService.navigateTo(Routes.adminHowItWorksView);

  navigateToContactSupport() =>
      _navigationService.navigateTo(Routes.contactSupportView);

  navigateToChangePassword() =>
      _navigationService.navigateTo(Routes.adminChangePasswordView);

  navigateToDeleteAccount() =>
      _navigationService.navigateTo(Routes.adminDeleteAccountView);

  openTermsOfUseAndPrivacyPolicy() async {
    if (!await launchUrl(url)) {
      throw HttpException("Could not launch $url");
    }
  }

  logout() async {
    await _authService.logout();
    _navigationService.pushNamedAndRemoveUntil(Routes.authView);
  }

  handleImageSelect() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

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
      File file = File(image.path);
      String ext = file.path.split('.').last;
      String filename = '${user!.id}.$ext';
      print('filename: $filename');
      try {
        final ref = storageRef.child("profiles/$filename");
        var task = await ref.putFile(file);
        if (task.state == TaskState.success) {
          String url = await ref.getDownloadURL();

          var formData = {
            "email": user!.email,
            "businessName": admin!.businessName,
            "homeAddress": admin!.address,
            "contactPhone": admin!.contactPhone,
            'imgUrl': url,
          };
          print(formData);
          await _adminService.updateAdmin(formData);
          await _authService.getCurrentAdminUser();
          setMessage("Image uploaded and updated");
        }
        // var snapshot = await task.whenComplete(() => {});

        // String url = await snapshot.ref.getDownloadURL();
        // print('download url: $url');
        //update the admin profile

      } on FirebaseException catch (e) {
        throw HttpException('Error: ${e.message}');
      } finally {
        setBusy(false);
        notifyListeners();
      }
    }
  }
}
