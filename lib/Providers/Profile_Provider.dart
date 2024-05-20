import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider extends ChangeNotifier
{
  ImagePicker picker = ImagePicker();
  File? profileimgpath;

  bool isdark = false;
  bool isProfile = false;

  TextEditingController txtfullname= TextEditingController();
  TextEditingController txtbio= TextEditingController();

  void profileImage() async {
    XFile? images = await picker.pickImage(source: ImageSource.camera);
    profileimgpath = File(images!.path);
    notifyListeners();
  }

  void clearprofile()
  {
    profileimgpath = null;
    txtfullname=TextEditingController(text: '');
    txtbio=TextEditingController(text: '');
    notifyListeners();
  }

  void changeColor(bool value)
  {
    isdark=value;
    notifyListeners();
  }

  void profileshow(bool value)
  {
    isProfile = value;
    notifyListeners();
  }
}