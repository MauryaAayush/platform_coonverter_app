import 'package:flutter/material.dart';

class PersonDataModel {
  String? name, phoneNumber, chatConversation;
  DateTime? date;
  TimeOfDay? timeOfDay;

  PersonDataModel(
      {this.name,
        this.phoneNumber,
        this.chatConversation,
        this.date,
        this.timeOfDay});
}
