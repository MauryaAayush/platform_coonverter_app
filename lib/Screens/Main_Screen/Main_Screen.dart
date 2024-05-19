import 'package:flutter/cupertino.dart';
import '../../Adaptives/Adaptive_Material&CupertinoApp.dart';
import '../../Adaptives/Adaptive_Scaffold.dart';
import '../../Adaptives/Adavtice_TabBar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Adaptive_Materail_CupertinoApp(
        scaffold: Adaptive_Scaffold(
        body: const AdaptiveTabBar(),
    ));
  }
}

