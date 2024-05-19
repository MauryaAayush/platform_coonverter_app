import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../Adaptives/Adaptive_CirculeAvtar.dart';
import '../../Providers/Chat_Screen_Provider.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<ChatProvider>(context);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: providerTrue.personData.length,
            itemBuilder: (context, index) => ListTile(
              leading: Adaptive_CircleAvatar(),
              title: Text(providerTrue.personData[index].name.toString()),
              subtitle: Text(
                  providerTrue.personData[index].chatConversation.toString()),
              trailing: Row(
                children: [
                  Text(
                      "${providerTrue.personData[index].date!.day.toString() + "-" + providerTrue.personData[index].date!.month.toString() + "-" + providerTrue.personData[index].date!.year.toString()}"),
                  Text(
                    "${providerTrue.personData[index].timeOfDay!.hour.toString() + ":" + providerTrue.personData[index].timeOfDay!.minute.toString()}",
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
