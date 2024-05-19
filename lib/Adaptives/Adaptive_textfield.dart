import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/global_Provider.dart';
import '../Screens/Contact_Screen/Contact_Screen.dart';

class AdaptiveTextField extends StatelessWidget {
  const AdaptiveTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.icon});

  final TextEditingController controller;
  final String hintText;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              controller: controller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "required field";
                } else {
                  return null;
                }
              },
              autocorrect: true,
              decoration: InputDecoration(
                  prefixIcon: icon,
                  hintText: hintText,
                  labelText: hintText,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1))),
            ),
          )
        : Row(
            children: [
              icon,
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 50,
                  child: CupertinoTextFormFieldRow(
                    placeholder: hintText,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "required field";
                      } else {
                        return null;
                      }
                    },
                    controller: controller,
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     border: Border.all(
                    //         color: CupertinoColors.systemGrey, width: 1)
                    // ),
                  ),
                ),
              ),
            ],
          );
  }
}
