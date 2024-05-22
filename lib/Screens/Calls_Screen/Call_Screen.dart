  import 'package:flutter/cupertino.dart';
  import 'package:provider/provider.dart';

  import '../../Adaptives/Apadtive_ListTile.dart';
  import '../../Providers/Chat_Screen_Provider.dart';

  class CallScreen extends StatelessWidget {
    const CallScreen({super.key});

    @override
    Widget build(BuildContext context) {
      final providerTrue = Provider.of<ChatProvider>(context);

      return (providerTrue.personData.isEmpty)
          ? const Center(
          child: Text(
            '!! No any call !!',
            style: TextStyle(fontSize: 18),
          ))
          : Column(
        children: [
          ...List.generate(
              providerTrue.personData.length,
                  (index) => AdaptiveListTile(
                index: index,
                isForChat: false,
              ))
        ],
      );
    }
  }
