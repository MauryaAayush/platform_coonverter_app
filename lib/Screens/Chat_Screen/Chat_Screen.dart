import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../Adaptives/Apadtive_ListTile.dart';
import '../../Providers/Chat_Screen_Provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<ChatProvider>(context);
    return (providerTrue.personData.isEmpty)
        ? const Center(
            child: Text(
            '!! No any conversation !!',
            style: TextStyle(fontSize: 18),
          ))
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ...List.generate(
                    providerTrue.personData.length,
                    (index) => AdaptiveListTile(
                          index: index,
                        ))
              ],
            ),
          );
  }
}
