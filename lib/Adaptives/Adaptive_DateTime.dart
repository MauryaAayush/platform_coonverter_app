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
                  const Icon(Icons.calendar_month),
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
                            : "${providerTrue.dateTime!.day}-${providerTrue.dateTime!.month}-${providerTrue.dateTime!.year}",
                      ))
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.access_time),
                  TextButton(
                      onPressed: () async {
                        providerFalse.setTime(
                            timeOfDay: await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now()) ??
                                TimeOfDay.now());
                      },
                      child: Text(
                        providerTrue.timeOfDay == null
                            ? "Pick Time"
                            : providerTrue.timeOfDay!.hour.toString() + ":" + providerTrue.timeOfDay!.minute.toString(),
                      ))
                ],
              ),
            ],
          )
        : Column(
            children: [
              Row(
                children: [
                  const Icon(CupertinoIcons.calendar),
                  CupertinoButton(
                    child: Text(
                      providerTrue.dateTime == null
                          ? "Pick Date"
                          : providerTrue.dateTime!.day.toString() + "-" + providerTrue.dateTime!.month.toString() + "-" + providerTrue.dateTime!.year.toString(),
                    ),
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => Container(
                          height: 200,
                          color: CupertinoColors.white,
                          child: CupertinoDatePicker(
                            onDateTimeChanged: (value) {
                              providerFalse.setDate(value);
                            },
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(CupertinoIcons.time),
                  CupertinoButton(
                    child: Text(
                      providerTrue.timeOfDay == null
                          ? "Pick Time"
                          : "${providerTrue.timeOfDay!.hour.toString() + ":" + providerTrue.timeOfDay!.minute.toString()}",
                    ),
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => Container(
                          height: 200,
                          color: CupertinoColors.white,
                          child: CupertinoTimerPicker(
                            onTimerDurationChanged: (value) {
                              providerFalse.setTime(duration: value);
                            },
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          );
  }
}
