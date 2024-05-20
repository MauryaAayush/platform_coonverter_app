import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/global_Provider.dart';


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
            margin: const EdgeInsets.symmetric(vertical: 13,horizontal: 5),

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
                    borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.grey)),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1))),
            ),
          )
        : Row(
            children: [
              icon,
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 50,
                  child: CupertinoTextFormFieldRow(
                    placeholder: hintText,
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "required field";
                      } else {
                        return null;
                      }
                    },
                    controller: controller,

                  ),
                ),
              ),
            ],
          );
  }
}
