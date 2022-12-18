import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_mobile_app/services/support.service.dart';
import 'package:pos_mobile_ui_package/pos_mobile_ui_package.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../models/attachment.model.dart';

const String SUPPORT_FULLNAME_VALIDATOR = 'SUPPORT_FULLNAME_VALIDATOR';
const String SUPPORT_EMAIL_VALIDATOR = 'SUPPORT_EMAIL_VALIDATOR';
const String SUPPORT_CATEGORY_VALIDATOR = 'SUPPORT_CATEGORY_VALIDATOR';
const String SUPPORT_TITLE_VALIDATOR = 'SUPPORT_TITLE_VALIDATOR';
const String SUPPORT_MESSAGE_VALIDATOR = 'SUPPORT_MESSAGE_VALIDATOR';

class ContactSupportViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _supportService = locator<SupportService>();
  ImagePicker _picker = ImagePicker();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  String? _selectedCategory;
  File? _selectedFileAttachment;
  File? get selectedFileAttachment => _selectedFileAttachment;

  final List<String> _categories = [
    "Feature Request",
    "Bug Reporting",
    "Functionality Question",
    "Others"
  ];
  List<String> get categories => _categories;
  String? get selectedCategory => _selectedCategory;

  String _progressData = '';
  String get progressData => _progressData;

  navigateBack() {
    _navigationService.back();
  }

  selectFile() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    _selectedFileAttachment = File(image.path);
    notifyListeners();
  }

  handleSubmit() {
    runBusyFuture(handleSubmitRequest());
  }

  handleSubmitRequest() async {
    if (fullNameController.text.isEmpty) {
      setErrorForObject(SUPPORT_FULLNAME_VALIDATOR, "Fullname is required");
      return;
    }
    if (emailController.text.isEmpty) {
      setErrorForObject(SUPPORT_EMAIL_VALIDATOR, "Fullname is required");
      return;
    }

    if (selectedCategory!.isEmpty) {
      setErrorForObject(SUPPORT_CATEGORY_VALIDATOR, "Fullname is required");
      return;
    }
    if (titleController.text.isEmpty) {
      setErrorForObject(SUPPORT_TITLE_VALIDATOR, "Fullname is required");
      return;
    }
    if (messageController.text.isEmpty) {
      setErrorForObject(SUPPORT_MESSAGE_VALIDATOR, "Fullname is required");
      return;
    }

    setBusy(true);
    _progressData = 'loading..';

    Attachment? attachment;

    if (selectedFileAttachment != null) {
      _progressData = 'uploading attachment...';
      attachment =
          await _supportService.uploadAttachment(selectedFileAttachment!.path);
      _progressData = attachment.message!;
    }

    var formData = {
      "fullname": fullNameController.text,
      "email": emailController.text,
      "category": selectedCategory,
      "title": titleController.text,
      "message": messageController.text,
      "fileUrl": selectedFileAttachment != null ? attachment!.url : "",
    };
    print(formData);
    try {
      _progressData = 'sending message...';
      await _supportService.createSupport(formData);
      Fluttertoast.showToast(
        msg: "Message successfully sent!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorManager.kDarkCharcoal,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      _navigationService.back();
    } on DioError catch (e) {
      throw Exception(e.response!.data["message"]);
    } finally {
      _progressData = 'Messsage sent!';
      setBusy(false);
    }
  }

  void setSelectedCategory(String? value) {
    _selectedCategory = value;
    notifyListeners();
  }
}
