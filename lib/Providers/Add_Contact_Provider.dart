import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Screens/Contact_Screen/Contact_Screen.dart';


class PersonAddProvider extends ChangeNotifier {
  DateTime? dateTime;
  TimeOfDay? timeOfDay;
  ImagePicker _imagePicker = ImagePicker();
  File? imgpath;
  void setDate(DateTime? dateTime) {
    this.dateTime = dateTime;
    notifyListeners();
  }

  void setTime(TimeOfDay? timeOfDay) {
    this.timeOfDay = timeOfDay;
    notifyListeners();
  }

  Future<void> pickImage() async {
    XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
    imgpath = File(image!.path);
    notifyListeners();
  }

  void clearController() {
    txtPhoneNumber!.clear();
    txtFullName!.clear();
    txtChatConversation!.clear();
    notifyListeners();
  }
}
