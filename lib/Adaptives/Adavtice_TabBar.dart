import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_coonverter_app/Screens/Setting_Screen/Setting_Screen.dart';
import 'package:provider/provider.dart';

import '../Models/Screen_Model.dart';
import '../Providers/global_Provider.dart';
import '../Screens/Calls_Screen/Call_Screen.dart';
import '../Screens/Chat_Screen/Chat_Screen.dart';
import '../Screens/Contact_Screen/Contact_Screen.dart';

class AdaptiveTabBar extends StatelessWidget {
  const AdaptiveTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? TabBarView(
        children: [
            PersonAddTab(),
            TabScreen(),
          CallScreen(),
            SettingScreen(),
          ])
        : CupertinoTabScaffold(
      resizeToAvoidBottomInset: false,
            tabBar: CupertinoTabBar(items: [
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_add)),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chat_bubble_text_fill),
                  label: "Chats"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.phone), label: "Calls"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings), label: "Settings"),
            ]),
            tabBuilder: (context, index) => screenList[index].screen,
          );
  }
}
