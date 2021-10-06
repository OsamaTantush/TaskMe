import 'package:flutter/material.dart';
import 'package:todo_app/models/NotificationManager.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/data_provider.dart';
import 'package:todo_app/models/error_manager.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';

class TaskAlertDialog extends StatefulWidget{
  final int index;
  TaskAlertDialog({this.index});

  @override
  _TaskAlertDialog createState() => _TaskAlertDialog(index:index);
}

class _TaskAlertDialog extends State<TaskAlertDialog>{
  NotificationManager _notificationManager;

  int index;

  DateTime alertDate = DateTime.now();
  DateTime remainingTime;
  int alertDay = 0;
  int alertHour = 0;
  int alertMinute = 0;

  int maxDays = 0;
  int maxHours = 0;
  int maxMinutes = 0;

  bool bAlertBefore = true;
  bool bSelectDate = false;

  _TaskAlertDialog({this.index});

  @override
  void initState() {
    _notificationManager = NotificationManager();
    // alertDate = DateTime(DateTime.now().year, DateTime.now().month, 1, 1, 50);

    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Consumer2<DataProvider, ErrorManager>(
        builder: (context, data, errorManager, child){
          maxDays = (data.taskList[index].date.difference(DateTime.now()).inHours/24).round();
          maxHours = ((data.taskList[index].date.difference(DateTime.now()).inSeconds/(60*60))%24).floor();
          maxMinutes = ((data.taskList[index].date.difference(DateTime.now()).inSeconds/60) % 60).floor();
          return AlertDialog(
            insetPadding: EdgeInsets.only(left:14, top:16, right:14),
            actionsPadding: EdgeInsets.only(top:4, bottom: 0),
            contentPadding: EdgeInsets.only(left: 20, top:20, right: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Colors.white,
            content: Container(
              height: MediaQuery.of(context).size.height*0.38,
              width:  MediaQuery.of(context).size.width*0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Title & Close button..
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12, top:3),
                            child: Text(
                              'Task Reminder',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 0),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.red[800],
                          foregroundColor: Colors.yellow,
                          radius: 16,
                          child: Builder(
                            builder: (context) => IconButton(
                              alignment: Alignment.center,
                              color: Colors.red,
                              icon: Icon(Icons.close, color: Colors.yellow, size: 15,),
                              onPressed: (){
                                Navigator.of(context).pop();},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  //Alert before
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            GestureDetector(
                              child: Icon(
                                (bAlertBefore)? Icons.radio_button_checked: Icons.radio_button_off, color: Colors.black,),
                              onTap: (){
                                setState(() {
                                  bAlertBefore = true;
                                  bSelectDate = false;
                                });
                              },
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Alert before : ',
                              style: (!errorManager.bAlertBeforeErrorFlag)?
                              TextStyle(color:(bAlertBefore)?Colors.black:Colors.grey):
                              TextStyle(color:(bSelectDate)?Colors.red:Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('D : ', style: TextStyle(fontSize: 15, color:(bAlertBefore)?Colors.black:Colors.grey)),
                            SizedBox(width: 2),
                            Container(
                              height: 38,
                              child: DropdownButton(
                                value: alertDay,
                                items: daysDropDownList(dayLimit: maxDays),
                                onChanged: (!bAlertBefore)? null: (value){
                                  setState(() {alertDay = value;});
                                },
                              ),
                            ),
                            SizedBox(width: 8),
                            Text('H : ', style: TextStyle(fontSize: 15, color:(bAlertBefore)?Colors.black:Colors.grey)),
                            SizedBox(width: 2),
                            Container(
                              height: 38,
                              child: DropdownButton(
                                value: alertHour,
                                items: hoursDropDownList(hourLimit: (alertDay==maxDays)? maxHours:60),
                                onChanged: (!bAlertBefore)? null: (value){
                                  setState(() {alertHour = value;});
                                },
                              ),
                            ),
                            SizedBox(width: 8),
                            Text('M : ', style: TextStyle(fontSize: 15, color:(bAlertBefore)?Colors.black:Colors.grey)),
                            SizedBox(width: 2),
                            Container(
                              height: 38,
                              child: DropdownButton(
                                value: alertMinute,
                                items: minutesDropDownList(
                                  minuteLimit : (alertDay==maxDays && alertHour==maxHours)? maxMinutes:60,
                                ),
                                onChanged: (!bAlertBefore)? null: (value){
                                  setState(() {alertMinute = value;});
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Row(
                          children: [
                            GestureDetector(
                              child: Icon(
                                  (bSelectDate)? Icons.radio_button_checked:Icons.radio_button_off, color: Colors.black),
                              onTap: (){
                                setState(() {
                                  bSelectDate = true;
                                  bAlertBefore = false;
                                });
                              },
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Select Date: ',
                              style: (!errorManager.bAlertSelectedDateError)?
                              TextStyle(color: (bSelectDate)? Colors.black: Colors.grey):
                              TextStyle(color: (bSelectDate)? Colors.red: Colors.grey),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Container(
                                height: 32,
                                width: double.infinity,
                                child: DateTimeFormField(
                                  enabled: true,
                                  dateTextStyle: TextStyle(fontSize: 14, color: (bSelectDate)? Colors.black:Colors.grey),
                                  initialValue: alertDate,
                                  firstDate: DateTime.now(),
                                  lastDate: data.taskList[index].date,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.only(left: 12, top: 16),
                                    fillColor: Color.alphaBlend((bSelectDate)? Color(0xff211825).withOpacity(0.075):Colors.grey.withOpacity(0.35), (bSelectDate)?Colors.yellow.withOpacity(0.15):Colors.yellow.withOpacity(0.05),),
                                    filled: true,
                                    suffixIcon: Icon(Icons.calendar_today, size: 21, color: (bSelectDate)? Colors.black:Colors.grey),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20,)),
                                      borderSide: BorderSide(width: 0, color: Colors.yellow.withOpacity(0)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20,)),
                                      borderSide: BorderSide(width: 0, color: Colors.yellow.withOpacity(0)),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20,)),
                                      borderSide: BorderSide(width: 0, color: Colors.yellow.withOpacity(0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20,)),
                                      borderSide: BorderSide(width: 0, color: Colors.yellow.withOpacity(0)),
                                    ),
                                  ),
                                  onDateSelected: (date){
                                    if(bSelectDate && date.isBefore(data.taskList[index].date)){alertDate = date;}
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right:5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.info, size: 18, color: Colors.red[800],),
                        SizedBox(width: 3),
                        Text(
                          "Task deadline : ${DateFormat('dd-MM-yyyy kk:mm').format(data.taskList[index].date)}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13, color: Colors.red[800]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 60),
                padding: EdgeInsets.only(top:2, bottom:8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                          backgroundColor: MaterialStateProperty.all(Colors.black),
                          foregroundColor: MaterialStateProperty.all(Colors.yellow),
                        ),
                        child: Text('Save', style: TextStyle(fontSize: 16)),
                        onPressed: (){
                          errorManager.cleanAlertErrorFlag();
                          if(bAlertBefore==true){
                            alertDate = data.taskList[index].date.subtract(
                              Duration(days: alertDay, hours: alertHour, minutes: alertMinute),
                            );
                            if(alertDate.isAfter(DateTime.now()) && alertDate.isBefore(data.taskList[index].date)){
                              data.createTaskReminder(index, alertDate);
                              Navigator.of(context).pop();
                            }
                            else{errorManager.raiseAlertBeforeError();}
                          }
                          else if(bSelectDate==true){
                            if(alertDate.isAfter(DateTime.now()) && alertDate.isBefore(data.taskList[index].date)){
                              data.createTaskReminder(index, alertDate);
                              // data.updateTimer(index);
                              // data.scheduleCleanTaskReminder(alertDate);  //date is key.
                              Navigator.of(context).pop();
                            }
                            else{errorManager.raiseAlertSelectDateError();}
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
    );
  }

  List<DropdownMenuItem> daysDropDownList({dayLimit}){
    List<DropdownMenuItem> days = [];
    for(int i=0; i<dayLimit; i++){
      print('in day $i');
      days.add(
          DropdownMenuItem(
            value: i,
            child: Text('$i', style: TextStyle(fontSize: 14, color:(bAlertBefore)?Colors.black:Colors.grey),),
          )
      );
    }
    return days;
  }

  List<DropdownMenuItem> hoursDropDownList({hourLimit}){
    List<DropdownMenuItem> hours = [];
    for(int i=0; i<hourLimit; i++){
      hours.add(
        DropdownMenuItem(
          value: i,
          child: Text('$i', style: TextStyle(fontSize: 14, color:(bAlertBefore)?Colors.black:Colors.grey),),
        ),
      );
    }
    return hours;
  }


  List<DropdownMenuItem> minutesDropDownList({minuteLimit}){
    List<DropdownMenuItem> minutes = [];
    for(int i=0; i<minuteLimit; i++){
      minutes.add(
        DropdownMenuItem(
          value: i,
          child: Text('$i', style: TextStyle(fontSize: 14, color:(bAlertBefore)?Colors.black:Colors.grey),),
        ),
      );
    }
    return minutes;
  }

}