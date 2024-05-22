import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/Global_Model_Contact_data.dart';
import '../Providers/Add_Contact_Provider.dart';
import '../Providers/Chat_Screen_Provider.dart';
import '../Providers/global_Provider.dart';
import '../Screens/Contact_Screen/Contact_Screen.dart';

class AdaptiveSaveButton extends StatelessWidget {
  const AdaptiveSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? OutlinedButton(
            onPressed: () {
             if(key.currentState!.validate())
               {
                 Provider.of<ChatProvider>(context, listen: false).addData(
                     PersonDataModel(
                         imgPath:
                         Provider.of<PersonAddProvider>(context, listen: false)
                             .imgpath,
                         chatConversation: txtChatConversation?.text ?? "",
                         name: txtFullName != null ? txtFullName!.text : "",
                         phoneNumber:
                         txtPhoneNumber != null ? txtPhoneNumber!.text : "",
                         date: Provider.of<PersonAddProvider>(context,
                             listen: false)
                             .dateTime ??
                             DateTime.now(),
                         timeOfDay:
                         Provider.of<PersonAddProvider>(context, listen: false)
                             .timeOfDay ??
                             TimeOfDay.now()));
                 Provider.of<PersonAddProvider>(context, listen: false).imgpath =
                 null;
                 Provider.of<PersonAddProvider>(context, listen: false)
                     .clearController();
               }
            },
            child: const Text("Save"))
        : CupertinoButton(
            child: Container(
                height: 45,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: CupertinoColors.activeBlue,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Save",
                  style: TextStyle(color: CupertinoColors.white),
                )),
            onPressed: () {
             if(key.currentState!.validate())
               {
                 Provider.of<ChatProvider>(context, listen: false).addData(
                     PersonDataModel(
                         imgPath:
                         Provider.of<
                             PersonAddProvider>(context, listen: false)
                             .imgpath,
                         chatConversation:
                         txtChatConversation !=
                             null
                             ? txtChatConversation!.text
                             : "",
                         name: txtFullName != null ? txtFullName!.text : "",
                         phoneNumber:
                         txtPhoneNumber != null ? txtPhoneNumber!.text : "",
                         date: Provider.of<PersonAddProvider>(context,
                             listen: false)
                             .dateTime ??
                             DateTime.now(),
                         timeOfDay:
                         Provider.of<PersonAddProvider>(context, listen: false)
                             .timeOfDay ??
                             TimeOfDay.now()));
                 Provider.of<PersonAddProvider>(context, listen: false).imgpath =
                 null;

                 Provider.of<PersonAddProvider>(context, listen: false)
                     .clearController();
               }
            },
          );
  }
}
