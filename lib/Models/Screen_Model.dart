import 'package:flutter/cupertino.dart';

import '../Screens/Chat_Screen/Chat_Screen.dart';
import '../Screens/Contact_Screen/Contact_Screen.dart';


class ScreenModels {
  final Widget screen;

  ScreenModels({required this.screen});
}

List<ScreenModels> screenList = [
  ScreenModels(
      screen: PersonAddTab()
  ),
  ScreenModels(
      screen: TabScreen()
  ),
  ScreenModels(
      screen: PersonAddTab()
  ),
  ScreenModels(
      screen: PersonAddTab()
  ),


];
