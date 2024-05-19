import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/Add_Contact_Provider.dart';
import '../Providers/global_Provider.dart';

class Adaptive_CircleAvatar extends StatelessWidget {
  Adaptive_CircleAvatar({super.key, this.radius = 70});

  double? radius, height, width;

  @override
  Widget build(BuildContext context) {
    bool isAndroid = Provider.of<SwitchProvider>(context, listen: true).isAndroid;
    var personAddProvider = Provider.of<PersonAddProvider>(context, listen: true);
    var imgPath = personAddProvider.imgpath;

    return isAndroid
        ? InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      radius: 50,
      onTap: () {
        Provider.of<PersonAddProvider>(context, listen: false).pickImage();
      },
      child: CircleAvatar(
        radius: radius,
        child: imgPath == null
            ? Icon(Icons.add_a_photo_outlined)
            : null,
        backgroundImage: imgPath == null ? null : FileImage(imgPath),
      ),
    )
        : CupertinoButton(
      onPressed: () {
        Provider.of<PersonAddProvider>(context, listen: false).pickImage();
      },
      child: ClipOval(
        child: Container(
          height: 70,
          width: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: CupertinoColors.activeGreen,
            image: imgPath == null
                ? null
                : DecorationImage(image: FileImage(imgPath)),
          ),
          child: imgPath == null
              ? Icon(
            CupertinoIcons.camera,
            color: CupertinoColors.white,
          )
              : null,
        ),
      ),
    );
  }
}
