import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Screens/Contact_Screen/Contact_Screen.dart';

class PersonAddProvider extends ChangeNotifier {
  DateTime? dateTime;
  TimeOfDay? timeOfDay;
  Duration? duration;
  final ImagePicker _imagePicker = ImagePicker();
  File? imgpath;

  void setDate(DateTime? dateTime) {
    this.dateTime = dateTime;
    notifyListeners();
  }

  void setTime({TimeOfDay? timeOfDay, Duration? duration}) {
    this.duration = duration;
    this.timeOfDay = timeOfDay;

    if (duration != null) {
      final int hours = duration.inHours % 24;
      final int minutes = duration.inMinutes % 60;
      this.timeOfDay = TimeOfDay(hour: hours, minute: minutes);
    }
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
