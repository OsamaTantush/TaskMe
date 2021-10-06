import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskme/Providers/taskManager.dart';
import 'package:taskme/custom/task.dart';
import 'package:taskme/kconst.dart';
import 'package:provider/provider.dart';

AlertDialog deleteTaskDialog({Task task}){
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    actionsPadding: EdgeInsets.only(right: 8),
    buttonPadding: EdgeInsets.zero,
    contentPadding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 8),
    title: Text(
      'Confirmation',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: kDarkRed.withOpacity(0.8),
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
    content: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          color: kDarkBlue.withOpacity(0.8),
          fontSize: 12,
        ),
        children: [
          TextSpan(
            text: 'Are you sure you want to '
          ),
          WidgetSpan(child: Icon(Icons.delete, size: 14, color: kDarkRed.withOpacity(0.8),)),
          TextSpan(text: ' task?'),
        ],
      ),
    ),
    actions: [
      Consumer<TaskManager>(
        builder: (context, taskManager, child) =>
        TextButton(
          child: Text(
            'Yes',
            style: TextStyle(
              color: kDarkBlue.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
          onPressed: (){
            Future.delayed(Duration(seconds: 1), (){
              taskManager.deleteTask(task);
              Navigator.pop(context);
            });
          },
        ),
      ),
      Builder(
        builder: (context) =>
        TextButton(
          child: Text(
            'Cancel',
            style: TextStyle(
              color: kDarkBlue.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
          onPressed: (){
            Future.delayed(Duration(seconds: 1), (){
              Navigator.pop(context);
            });
          },
        ),
      ),
    ],
  );
}
