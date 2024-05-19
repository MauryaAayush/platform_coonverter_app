import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as url;
import '../../Adaptives/Adaptive_CirculeAvtar.dart';
import '../../Providers/Chat_Screen_Provider.dart';
import '../../Providers/global_Provider.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    bool isAndroid =
        Provider.of<SwitchProvider>(context, listen: true).isAndroid;
    final providerTrue = Provider.of<ChatProvider>(context);
    
    return isAndroid
        ? Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: providerTrue.personData.length,
            itemBuilder: (context, index) {
              var person = providerTrue.personData[index];
              return ListTile(
                leading: Adaptive_CircleAvatar(radius: 30),
                title: Text(person.name ?? "No Name"),
                subtitle:
                Text(person.chatConversation ?? "No Conversation"),
                trailing: IconButton(
                  onPressed: () {
                    // Make a phone call to the specified number
                    // launch("tel://1234567890");

                    Uri uri= Uri.parse('tel: +91 ${providerTrue.personData[index].phoneNumber}');
                    url.launchUrl(uri);
                  },
                  icon: Icon(Icons.call),
                )
              );
            },
          ),
        ),
      ],
    )
        : Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: providerTrue.personData.length,
            itemBuilder: (context, index) {
              var person = providerTrue.personData[index];
              return CupertinoListTile(
                leading: ClipOval(
                  child: Container(
                    height: 50,
                    width: 50,
                    // color: CupertinoColors.activeGreen,
                    child: Adaptive_CircleAvatar(
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                title: Text(person.name ?? "No Name"),
                subtitle: Text(person.chatConversation ?? "No Conversation"),
                trailing:CupertinoButton(
                  onPressed: () {
                    // Make a phone call to the specified number
                    // launch("tel://1234567890");
                  },
                  child: Icon(CupertinoIcons.phone_fill),
                )
              );
            },
          ),
        ),
      ],
    );
  }
}