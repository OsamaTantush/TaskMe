
import 'dart:async';

import 'package:flutter/cupertino.dart';

class AlertTimer{
  int day;
  int hour;
  int minute;
  int second;
}

class Task{
  String title;
  String description;
  String category;
  DateTime date;  //deadline date
  bool bIsDone;
  bool bIsSelected;
  bool bArchived;
  bool color;
  bool bAlarm;
  bool bEditable;
  bool bIschecked;
  DateTime alertDate;
  AlertTimer remainingTime = AlertTimer();
  Timer alertTimer;

  Task(){init();}

  void init(){
    date = DateTime.now();
    title = null;
    description = null;
    category = 'Uncategorized';
    bIsDone = false;
    bIsSelected = false;
    bEditable = false;
    bIschecked = false;
    remainingTime.day = 0;
    remainingTime.hour = 0;
    remainingTime.second = 0;
    //alertTimer = Timer(Duration(seconds: 0), (){});
  }

  void set({Map<String,dynamic>setMap}){
    title = setMap['title'].text;
    description = setMap['description'].text;
    category = setMap['category'];
    date = setMap['date'];
  }

}