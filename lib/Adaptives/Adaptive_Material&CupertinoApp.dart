import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../Providers/Profile_Provider.dart';
import '../Providers/global_Provider.dart';

class Adaptive_Materail_CupertinoApp extends StatelessWidget {
  const Adaptive_Materail_CupertinoApp({super.key, required this.scaffold});

  final Widget scaffold;

  @override
  Widget build(BuildContext context) {
    final profileProviderfalse =
        Provider.of<ProfileProvider>(context, listen: false);
    final profileProvidertrue =
        Provider.of<ProfileProvider>(context, listen: true);

    return (!Provider.of<SwitchProvider>(context).isAndroid)
        ? CupertinoApp(
            theme: profileProvidertrue.isdark
                ? const CupertinoThemeData(brightness: Brightness.light)
                : const CupertinoThemeData(brightness: Brightness.dark),
            debugShowCheckedModeBanner: false,
            home: scaffold,
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(brightness: Brightness.light),
            darkTheme: ThemeData(brightness: Brightness.dark),
            themeMode:
                profileProvidertrue.isdark ? ThemeMode.light : ThemeMode.dark,
            home: scaffold,
          );
  }
}
