import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../Adaptives/Adaptive_CirculeAvtar.dart';
import '../../Providers/Chat_Screen_Provider.dart';
import '../../Providers/global_Provider.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

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
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${person.date?.day ?? 0}-${person.date?.month ?? 0}-${person.date?.year ?? 0}",
                          ),
                          Text(
                            "${person.timeOfDay?.hour ?? 0}:${person.timeOfDay?.minute ?? 0}",
                          ),
                        ],
                      ),
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
                      subtitle:
                          Text(person.chatConversation ?? "No Conversation"),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${person.date?.day ?? 0}-${person.date?.month ?? 0}-${person.date?.year ?? 0}",
                          ),
                          Text(
                            "${person.timeOfDay?.hour ?? 0}:${person.timeOfDay?.minute ?? 0}",
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
