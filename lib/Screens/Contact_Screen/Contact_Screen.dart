import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../Adaptives/Adaptive_CirculeAvtar.dart';
import '../../Adaptives/Adaptive_DateTime.dart';
import '../../Adaptives/Adaptive_Save.dart';
import '../../Adaptives/Adaptive_textfield.dart';
import '../../Providers/global_Provider.dart';

TextEditingController ?txtFullName = TextEditingController();
TextEditingController ?txtPhoneNumber = TextEditingController();
TextEditingController ?txtChatConversation = TextEditingController();

GlobalKey<FormState> key = GlobalKey<FormState>();

class PersonAddTab extends StatelessWidget {
  const PersonAddTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
             Adaptive_CircleAvatar(
             ),
            const SizedBox(
              height: 30,
            ),

            Form(
              key: key,
              child: Column(
                children: [
                  AdaptiveTextField(
                    controller: txtFullName!,
                    hintText: "Full Name",
                    icon: (Provider.of<SwitchProvider>(context).isAndroid)
                        ? const Icon(Icons.person)
                        : const Icon(CupertinoIcons.person),
                  ),
                  AdaptiveTextField(
                    controller: txtPhoneNumber!,
                    hintText: "Phone Number",
                    icon: (Provider.of<SwitchProvider>(context).isAndroid)
                        ? const Icon(Icons.phone)
                        : const Icon(CupertinoIcons.phone),
                  ),
                  AdaptiveTextField(
                    controller: txtChatConversation!,
                    hintText: "Chat Conversation",
                    icon: (Provider.of<SwitchProvider>(context).isAndroid)
                        ? Icon(Icons.chat)
                        : Icon(CupertinoIcons.chat_bubble_text_fill),
                  ),
                ],
              ),
            ),

            AdaptiveDateTime(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [AdaptiveSaveButton()],
            )

          ],
        ),
      ),
    );
  }
}


