import 'package:flutter/cupertino.dart';
import 'package:platform_coonverter_app/Screens/Setting_Screen/Setting_Screen.dart';

import '../Screens/Calls_Screen/Call_Screen.dart';
import '../Screens/Chat_Screen/Chat_Screen.dart';
import '../Screens/Contact_Screen/Contact_Screen.dart';


class ScreenModels {
  final Widget screen;

  ScreenModels({required this.screen});
}

List<ScreenModels> screenList = [
  ScreenModels(
      screen: const PersonAddTab()
  ),
  ScreenModels(
      screen: const ChatScreen()
  ),
  ScreenModels(
      screen: const CallScreen()
  ),
  ScreenModels(
      screen: const SettingScreen()
  ),


];
