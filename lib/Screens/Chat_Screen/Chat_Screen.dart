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
            itemBuilder: (context, index) {
              var person = providerTrue.personData[index];
              return ListTile(
                leading: Adaptive_CircleAvatar(radius: 30,),
                title: Text(person.name.toString()),
                subtitle: Text(person.chatConversation.toString()),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min
                  ,
                  children: [
                    Text(
                      "${person.date!.day}-${person.date!.month}-${person.date!.year}",
                    ),
                    Text(
                      "${person.timeOfDay!.hour}:${person.timeOfDay!.minute}",
                    )
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
