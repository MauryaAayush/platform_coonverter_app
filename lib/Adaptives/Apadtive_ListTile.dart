import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as url;
import '../Providers/Add_Contact_Provider.dart';
import '../Providers/Chat_Screen_Provider.dart';
import '../Providers/global_Provider.dart';

class AdaptiveListTile extends StatelessWidget {
  const AdaptiveListTile(
      {super.key, required this.index, this.isForChat = true});

  final int index;
  final bool isForChat;

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<ChatProvider>(context);
    final providerFalse = Provider.of<ChatProvider>(context, listen: false);

    // Debug: Check if the image path is correctly assigned
    print('Image path: ${providerTrue.personData[index].imgPath}');

    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: ListTile(
        onLongPress: () {
          providerFalse.bottomSheet(
              context, providerTrue, providerFalse, index);
          Provider.of<PersonAddProvider>(context, listen: false)
              .clearController();
        },
        title: Text(providerTrue.personData[index].name.toString()),
        subtitle: isForChat
            ? Text(providerTrue.personData[index].chatConversation
            .toString())
            : Text(providerTrue.personData[index].phoneNumber.toString()),
        leading: CircleAvatar(
          radius: 35,
          backgroundImage: providerTrue.personData[index].imgPath != null
              ? FileImage(providerTrue.personData[index].imgPath!)
              : null,
          child: providerTrue.personData[index].imgPath == null
              ? const Icon(Icons.add_a_photo_outlined)
              : null,
        ),
        onTap: () {},
        trailing: isForChat
            ? Text(
            "${providerTrue.personData[index].date!.day}-${providerTrue.personData[index].date!.month}-${providerTrue.personData[index].date!.year}, ${providerTrue.personData[index].timeOfDay!.hour}:${providerTrue.personData[index].timeOfDay!.minute}")
            : IconButton(
            onPressed: () {
              Uri uri = Uri.parse(
                  'tel: +91 ${providerTrue.personData[index].phoneNumber}');
              url.launchUrl(uri);
            },
            icon: const Icon(
              Icons.call,
              color: Colors.green,
            )),
      ),
    )
        : Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onLongPress: () {
          providerFalse.cupertinosheet(
              context, providerTrue, providerFalse, index);
          Provider.of<PersonAddProvider>(context, listen: false)
              .clearController();
        },
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: CupertinoListTile(
            leadingSize: 50,
            title: Text(providerTrue.personData[index].name.toString()),
            subtitle: isForChat
                ? Text(providerTrue.personData[index].chatConversation
                .toString())
                : Text(providerTrue.personData[index].phoneNumber
                .toString()),
            leading: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: providerTrue.personData[index].imgPath != null
                    ? DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(
                        providerTrue.personData[index].imgPath!))
                    : null,
                color: providerTrue.personData[index].imgPath == null
                    ? CupertinoColors.activeBlue
                    : null,
              ),
              child: providerTrue.personData[index].imgPath == null
                  ? const Icon(
                CupertinoIcons.camera,
                color: CupertinoColors.white,
              )
                  : null,
            ),
            trailing: isForChat
                ? Text(
              "${providerTrue.personData[index].date!.day}-${providerTrue.personData[index].date!.month}-${providerTrue.personData[index].date!.year}, ${providerTrue.personData[index].timeOfDay!.hour}:${providerTrue.personData[index].timeOfDay!.minute}",
              style: const TextStyle(fontSize: 15),
            )
                : CupertinoButton(
              child: const Icon(
                CupertinoIcons.phone,
                color: CupertinoColors.activeGreen,
              ),
              onPressed: () {
                Uri uri = Uri.parse(
                    'tel: +91 ${providerTrue.personData[index].phoneNumber}');
                url.launchUrl(uri);
              },
            ),
          ),
        ),
      ),
    );
  }
}
