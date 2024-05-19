import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/Add_Contact_Provider.dart';
import '../Providers/global_Provider.dart';


class AdaptiveDateTime extends StatelessWidget {
  const AdaptiveDateTime({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<PersonAddProvider>(context, listen: true);
    final providerFalse =
    Provider.of<PersonAddProvider>(context, listen: false);
    return (Provider.of<SwitchProvider>(context).isAndroid)
        ? Column(
      children: [
        Row(
          children: [
            Icon(Icons.calendar_month),
            TextButton(
                onPressed: () async {
                  providerFalse.setDate(await showDatePicker(
                      context: context,
                      firstDate: DateTime(1924),
                      lastDate: DateTime(2025)) ??
                      DateTime.now());
                },
                child: Text(
                  providerTrue.dateTime == null
                      ? "Pick Date"
                      : "${providerTrue.dateTime!.day.toString() + "-" + providerTrue.dateTime!.month.toString() + "-" + providerTrue.dateTime!.year.toString()}",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
        Row(
          children: [
            Icon(Icons.access_time),
            TextButton(
                onPressed: () async {
                  providerFalse.setTime(await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now()) ??
                      TimeOfDay.now());
                },
                child: Text(
                    providerTrue.timeOfDay == null
                        ? "Pick Time"
                        : "${providerTrue.timeOfDay!.hour.toString() + ":" + providerTrue.timeOfDay!.minute.toString()}",
                    style: TextStyle(color: Colors.black)))
          ],
        ),
      ],
    )
        : Column(
      children: [
        Row(
          children: [
            Icon(CupertinoIcons.calendar),
            CupertinoButton(
              child: Text(
                  providerTrue.dateTime == null
                      ? "Pick Date"
                      : "${providerTrue.dateTime!.day.toString() + "-" + providerTrue.dateTime!.month.toString() + "-" + providerTrue.dateTime!.year.toString()}",
                  style: TextStyle(color: CupertinoColors.black)),
              onPressed: () {},
            )
          ],
        ),
        Row(
          children: [
            Icon(CupertinoIcons.time),
            CupertinoButton(
              child: Text(
                providerTrue.timeOfDay == null
                    ? "Pick Time"
                    : "${providerTrue.timeOfDay!.hour.toString() + ":" + providerTrue.timeOfDay!.minute.toString()}",
                style: TextStyle(color: CupertinoColors.black),
              ),
              onPressed: () {},
            )
          ],
        ),
      ],
    );
  }
}
