import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/Screen_Model.dart';
import '../Providers/global_Provider.dart';

class Adaptive_Scaffold extends StatelessWidget {
  Adaptive_Scaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<SwitchProvider>(context);
    final providerFalse = Provider.of<SwitchProvider>(context, listen: false);
    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? DefaultTabController(
            length: 4,
            child: Scaffold(
              body: body,
              appBar: appBar(providerTrue, providerFalse),
            ),
          )
        : CupertinoTabScaffold(
            // resizeToAvoidBottomInset: false,
            tabBar: CupertinoTabBar(items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_add), label: 'add'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chat_bubble_2), label: 'chat'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.phone), label: 'call'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings), label: 'setting'),
            ]),
            tabBuilder: (context, index) => CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  border: null,
                  backgroundColor: CupertinoColors.systemGrey3,
                  middle: Text('Platform Convertor'),
                  trailing: CupertinoSwitch(
                    value: providerTrue.isAndroid,
                    onChanged: (value) {
                      providerFalse.changePlatform(value);
                    },
                  ),
                ),
                child: screenList[index].screen),
          );
  }

  AppBar appBar(SwitchProvider providerTrue, SwitchProvider providerFalse) {
    return AppBar(
      title: const Text("Platform Convertor"),
      toolbarHeight: 60,
      actions: [
        Switch(
          value: providerTrue.isAndroid,
          onChanged: (value) {
            providerFalse.changePlatform(value);
          },
        )
      ],
      bottom: const TabBar(tabs: [
        Tab(
          icon: Icon(Icons.person_add),
        ),
        Tab(
          text: "Chat",
        ),
        Tab(
          text: "Calls",
        ),
        Tab(
          text: "Settings",
        ),
      ]),
    );
  }
}
