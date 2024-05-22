import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/Profile_Provider.dart';
import '../Providers/global_Provider.dart';

class ThemeModeScreen extends StatelessWidget {
  const ThemeModeScreen({super.key});

  @override
  Widget build(BuildContext context) {

   final profileProviderfalse = Provider.of<ProfileProvider>(context, listen: false);
   final profileProvidertrue = Provider.of<ProfileProvider>(context, listen: true);

      return (Provider.of<SwitchProvider>(context).isAndroid)

        ? ListTile(
        leading: const Icon(Icons.sunny),
        title: const Text('Theme'),
        subtitle: const Text('Change Theme'),
        trailing: Switch(
          value: profileProvidertrue.isdark,
          onChanged: (value) {
            profileProviderfalse.changeColor(value);
          },
        ),
      )

     : CupertinoListTile(
        leading: const Icon(CupertinoIcons.sun_max),
        title: const Text('Theme'),
        subtitle: const Text('Change Theme'),
        trailing: CupertinoSwitch(
          value: profileProvidertrue.isdark,
          onChanged: (value) {
            profileProviderfalse.changeColor(value);
          },
        )
      );
    }
  }

