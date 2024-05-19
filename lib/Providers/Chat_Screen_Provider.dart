import 'package:flutter/cupertino.dart';

import '../Models/Global_Model_Contact_data.dart';

class ChatProvider extends ChangeNotifier {
  List<PersonDataModel> personData = [];

  void addData(PersonDataModel data) {
    personData.add(data);
    notifyListeners();
  }
}