import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              border: null,
              backgroundColor: CupertinoColors.systemGrey6,
              middle: Text("Platform Convertor"),
              trailing: CupertinoSwitch(
                onChanged: (value) {
                  providerFalse.changePlatform(value);
                },
                value: providerTrue.isAndroid,
              ),
            ),
            child: body,
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
