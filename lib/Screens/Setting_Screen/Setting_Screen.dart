import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Adaptives/Adaptive_SettingProfile.dart';
import '../../Adaptives/Adaptive_Theme.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Column(
        children: [
          ProfileAdaptive(),
          ThemeModeScreen(),
        ],
      ),
    );
  }
}
