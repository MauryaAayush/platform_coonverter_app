import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../Providers/global_Provider.dart';

class Adaptive_Materail_CupertinoApp extends StatelessWidget {
  const Adaptive_Materail_CupertinoApp({super.key, required this.scaffold});

  final Widget scaffold;

  @override
  Widget build(BuildContext context) {
    return (!Provider.of<SwitchProvider>(context).isAndroid)
        ? CupertinoApp(
            theme: CupertinoThemeData(brightness: Brightness.light),
            home: scaffold,
            debugShowCheckedModeBanner: false,
          )
        : MaterialApp(
            themeMode: ThemeMode.light,
            home: scaffold,
            debugShowCheckedModeBanner: false,
          );
  }
}
