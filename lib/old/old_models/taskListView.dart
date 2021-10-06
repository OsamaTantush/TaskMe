// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/models/data_provider.dart';
// import 'package:date_field/date_field.dart';
// import 'package:todo_app/models/error_manager.dart';
// import 'package:todo_app/screens/alerts.dart';
// import 'package:intl/intl.dart';
// import 'package:todo_app/models/NotificationManager.dart';
// import 'package:todo_app/custom/task_dialog.dart';
// import 'package:todo_app/custom/taskAlert_dialog.dart';
//
//
// class TaskListView extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<DataProvider>(
//       builder: (context, data, child){
//         return ListView.builder(
//           padding: EdgeInsets.zero,
//           physics: ClampingScrollPhysics(),
//           itemCount: data.taskListLength,
//           itemBuilder: (context, index){
//             return Container(
//               height: 112,
//               width: double.infinity,
//               padding: EdgeInsets.only(bottom: 8),
//               child: Material(
//                 color: Color(0xff211825).withOpacity(0.075),
//                 borderRadius: BorderRadius.circular(20),
//                 elevation: 3,
//                 shadowColor: (Colors.yellow.withOpacity(0.15)),
//                 child: InkWell(
//                   borderRadius: BorderRadius.circular(20),
//                   splashColor: Color(0xff211825),
//                   child: Padding(
//                     padding: EdgeInsets.only(left:8, top:10, right:6, bottom: 2),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           flex: 18,
//                           child: Container(
//                             padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                   child: ListView(
//                                     children: [
//                                       Text(
//                                         '${data.taskList[index].title}',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                           decoration: (data.taskList[index].bIsDone)?
//                                           TextDecoration.lineThrough: TextDecoration.none,
//                                           decorationThickness: 1.5,
//                                         ),
//                                       ),
//                                       SizedBox(height: 3),
//                                       Text(
//                                         '${data.taskList[index].description}',
//                                         style: TextStyle(
//                                           fontSize: 12,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 16,
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       Text(
//                                         '${data.taskList[index].category}',
//                                         style:
//                                         TextStyle(
//                                           color: Colors.white,
//                                           backgroundColor: Color(0xff211825),
//                                           fontSize: 12,
//                                         ),
//                                       ),
//                                       SizedBox(width: 10),
//                                       Text(
//                                         DateFormat('dd-MM-yyyy kk:mm').format(data.taskList[index].date),
//                                         style:
//                                         TextStyle(
//                                           color: Colors.white,
//                                           backgroundColor: Color(0xff211825),
//                                           fontSize: 12,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 6,
//                           child: Container(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Expanded(
//                                   flex: 1,
//                                   child: (!data.taskList[index].bIsDone)?
//                                     IconButton(
//                                       color: Color(0xff211825),
//                                       padding: EdgeInsets.only(bottom: 8),
//                                       icon: Icon(Icons.add_alert,),
//                                       onPressed: (){
//                                         showDialog(
//                                           context: context,
//                                           builder: (context){return TaskAlertDialog(index: index);}
//                                         );
//                                       },
//                                   ):
//                                   IconButton(
//                                     color: Color(0xff211825),
//                                     padding: EdgeInsets.only(bottom: 8),
//                                     icon: Icon(Icons.repeat_one),
//                                     onPressed: (){
//                                       Future.delayed(
//                                         Duration(milliseconds: 500),
//                                         (){
//                                           if(data.taskList[index].bIsDone)
//                                           {
//                                             showDialog(
//                                               context: context,
//                                               builder: (context){
//                                                 return TaskCardDialog(
//                                                   dialogTitle: 'Reset Task',
//                                                   index: index,
//                                                   controllerMap: {
//                                                     'title': data.taskList[index].title,
//                                                     'description': data.taskList[index].description,
//                                                     'category': data.taskList[index].category,
//                                                     'date': data.taskList[index].date,
//                                                   },
//                                                 );
//                                               },
//                                             );
//                                           }
//                                         },
//                                       );
//                                     },
//                                   ),
//                                 ),
//                                 SizedBox(width:3),
//                                 Expanded(
//                                   flex: 1,
//                                   child: (!data.taskList[index].bIsDone)?
//                                   Padding(
//                                     padding: const EdgeInsets.only(bottom: 8),
//                                     child: Checkbox(
//                                       value: data.taskList[index].bIschecked,
//                                       fillColor: MaterialStateProperty.all(Color(0xff211825),),
//                                       onChanged: (newValue){
//                                         data.updateTaskCheckBox(index);
//                                         Future.delayed(
//                                           Duration(milliseconds: 1000),
//                                           (){
//                                               data.updateTaskState(index);
//                                               data.cleanTaskReminder(index);
//                                           },
//                                         );
//                                       },
//                                     ),
//                                   ):
//                                   IconButton(
//                                     color: Color(0xff211825),
//                                     padding: EdgeInsets.only(bottom: 8),
//                                     icon: Icon(Icons.archive,),
//                                     onPressed: (){
//                                       data.archiveTask(index);
//                                     },
//                                   ),
//                                 ),
//                                 SizedBox(width:3),
//                                 Expanded(
//                                   flex: 1,
//                                   child: IconButton(
//                                     color: Colors.red[700],
//                                     padding: EdgeInsets.only(bottom: 8),
//                                     icon: Icon(Icons.delete,),
//                                     onPressed: () {
//                                       Future.delayed(
//                                         Duration(milliseconds: 500),
//                                         (){
//                                           showDialog(
//                                             context: context,
//                                             builder: (context) {
//                                               return AlertDialog(
//                                                 actionsPadding: EdgeInsets.only(right: 4),
//                                                 buttonPadding: EdgeInsets.zero,
//                                                 contentPadding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 8),
//                                                 backgroundColor: Colors.white,
//                                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                                                 title: Text('Confirmation', textAlign: TextAlign.center, style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold),),
//                                                 content: Text(
//                                                   'Are you sure you want to remove task?',
//                                                   textAlign: TextAlign.center,
//                                                   style: TextStyle(fontSize: 15)),
//                                                 actions: [
//                                                   TextButton(
//                                                     child: Text('Yes', style: TextStyle(color: Colors.red[800]),),
//                                                     onPressed: () {
//                                                       data.deleteTask(index:index);
//                                                       Navigator.of(context).pop();
//                                                     },
//                                                   ),
//                                                   TextButton(
//                                                     child: Text('No', style: TextStyle(color: Color(0xff211825).withOpacity(0.5)),),
//                                                     onPressed: () {
//                                                       Navigator.of(context).pop();
//                                                     },
//                                                   ),
//                                                 ],
//                                               );
//                                             },
//                                           );
//                                         },
//                                       );
//                                     },
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                      ),
//                   ),
//                   onTap: (){
//                     Future.delayed(
//                       Duration(milliseconds: 500),
//                       (){
//                         if(!data.taskList[index].bIsDone)
//                         {
//                           showDialog(
//                             context: context,
//                             builder: (context){
//                               return TaskCardDialog(
//                                 dialogTitle: 'Edit Task',
//                                 index: index,
//                                 controllerMap: {
//                                   'title': data.taskList[index].title,
//                                   'description': data.taskList[index].description,
//                                   'category': data.taskList[index].category,
//                                   'date': data.taskList[index].date,
//                                 },
//                               );
//                             },
//                           );
//                         }
//                       },
//                     );
//                   },
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
//
//
//
//
//
//
