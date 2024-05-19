import 'package:flutter/material.dart';
import 'package:platform_coonverter_app/Providers/Profile_Provider.dart';
import 'package:platform_coonverter_app/Screens/Main_Screen/Main_Screen.dart';
import 'package:provider/provider.dart';

import 'Providers/Add_Contact_Provider.dart';
import 'Providers/Chat_Screen_Provider.dart';
import 'Providers/global_Provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => SwitchProvider(),
    ),
    ChangeNotifierProvider(create: (context) => ChatProvider(),),
    ChangeNotifierProvider(create: (context) => PersonAddProvider(),),
    ChangeNotifierProvider(create: (context) => ProfileProvider(),)

  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MainScreen();
  }
}