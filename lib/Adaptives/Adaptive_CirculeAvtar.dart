import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/global_Provider.dart';


class AdaptiveCircleAvatar extends StatelessWidget {
  const AdaptiveCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? CircleAvatar(
      radius: 60,
      child: Icon(Icons.add_a_photo_outlined),
    )
        : ClipOval(
      child: Container(
        height: 120,
        width: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: CupertinoColors.activeBlue),
        child: Icon(
          CupertinoIcons.camera,
          color: CupertinoColors.white,
        ),
      ),
    );
  }
}
