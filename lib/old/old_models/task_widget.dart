import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/custom/task.dart';
import 'package:todo_app/custom/taskAlert_dialog.dart';
import 'package:todo_app/custom/task_dialog.dart';
import 'package:todo_app/models/data_provider.dart';
import 'package:intl/intl.dart';

class TaskWidget extends StatelessWidget{
  final Task task;
  TaskWidget(this.task);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Color(0xff211825).withOpacity(0.075),
        borderRadius: BorderRadius.circular(20),
        elevation: 3,
        shadowColor: (Colors.yellow.withOpacity(0.15)),
        child: Consumer<DataProvider>(
          builder: (context, data, child){
            return InkWell(
              borderRadius: BorderRadius.circular(20),
              splashColor: Color(0xff211825),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.2,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 16,left: 18, right: 0, bottom: 0),
                              child: (('\n'.allMatches(task.description).length>2)
                                  || ('\n'.allMatches(task.description).length>1 && task.title.length>20)
                                  || task.title.length>60 )?
                              ListView(
                                padding: EdgeInsets.zero,
                                children: [
                                  Text(
                                    '${task.title}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      decoration: (task.bIsDone)?
                                      TextDecoration.lineThrough: TextDecoration.none,
                                      decorationThickness: 1.5,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '${task.description}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff211825).withOpacity(0.8),
                                    ),
                                  ),
                                ],
                              ):
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${task.title}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      decoration: (task.bIsDone)?
                                      TextDecoration.lineThrough: TextDecoration.none,
                                      decorationThickness: 1.5,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '${task.description}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff211825).withOpacity(0.8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8, right:8),
                            child: Row(
                              children: [
                                GestureDetector(
                                  child: (!task.bIsDone)?
                                  Icon(Icons.add_alert, color: Color(0xff211825), size: 28):
                                  Icon(Icons.repeat_one, color: Color(0xff211825), size: 28),
                                  onTap: () {
                                    // Future.delayed(
                                    //   Duration(milliseconds: 500), () {
                                    //     showDialog(
                                    //       context: context,
                                    //       builder: (context) {
                                    //         return (!task.bIsDone)?
                                    //         TaskAlertDialog(index: index):
                                    //         TaskCardDialog(
                                    //           dialogTitle: 'Reset Task',
                                    //           index: index,
                                    //           controllerMap: {
                                    //             'title': data.taskList[index].title,
                                    //             'description': data.taskList[index].description,
                                    //             'category': data.taskList[index].category,
                                    //             'date': data.taskList[index].date,
                                    //           }
                                    //         );
                                    //       }
                                    //     );
                                    //   }
                                    // );
                                  },
                                ),
                                SizedBox(width: 4),
                                (!task.bIsDone)?
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: Checkbox(
                                    value: task.bIschecked,
                                    fillColor: MaterialStateProperty.all(Color(0xff211825),),
                                    onChanged: (newValue){
                                      // data.updateTaskCheckBox(index);
                                      // Future.delayed(
                                      //   Duration(milliseconds: 1000), (){
                                      //     data.updateTaskState(index);
                                      //     data.cleanTaskReminder(index);
                                      //   },
                                      // );
                                    },
                                  ),
                                ):
                                GestureDetector(
                                  child: Icon(Icons.archive, color: Color(0xff211825), size: 28),
                                  onTap: (){
                                    // data.archiveTask(index);
                                  },
                                ),
                                SizedBox(width: 4,),
                                GestureDetector(
                                  child: Icon(Icons.delete, color: Colors.red[700], size: 28),
                                  onTap: () {
                                    Future.delayed(
                                      Duration(milliseconds: 500), (){
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              actionsPadding: EdgeInsets.only(right: 4),
                                              buttonPadding: EdgeInsets.zero,
                                              contentPadding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 8),
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                              title: Text('Confirmation', textAlign: TextAlign.center, style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold),),
                                              content: Text(
                                                'Are you sure you want to remove task?',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 15)),
                                              actions: [
                                                TextButton(
                                                  child: Text('Yes', style: TextStyle(color: Colors.red[800]),),
                                                  onPressed: () {
                                                    //data.deleteTask(index:index);
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: Text('No', style: TextStyle(color: Color(0xff211825).withOpacity(0.5)),),
                                                  onPressed: () {Navigator.of(context).pop();},
                                                ),
                                              ],
                                            );
                                          }
                                        );
                                      }
                                    );
                                  }
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      height: 20,
                      padding: EdgeInsets.only(left: 16, bottom: 8),
                      child: Row(
                        children: [
                          Text(
                            ' ${task.category} ',
                            style: TextStyle(
                              color: Colors.white,
                              backgroundColor: Color(0xff211825),
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            ' ' + DateFormat('hh:mm a').format(task.date) + ' ',
                            style: TextStyle(
                              color: Colors.white,
                              backgroundColor: Color(0xff211825),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: (){
                // Future.delayed(
                //   Duration(milliseconds: 500), (){
                //     if(!task.bIsDone) {
                //       showDialog(
                //         context: context,
                //         builder: (context) {
                //           return TaskCardDialog(
                //             dialogTitle: 'Edit Task',
                //             index: index,
                //             controllerMap: {
                //               'title': data.taskList[index].title,
                //               'description': data.taskList[index].description,
                //               'category': data.taskList[index].category,
                //               'date': data.taskList[index].date,
                //             },
                //           );
                //         }
                //       );
                //     }
                //   },
                // );
              },
            );
          }
        ),
      ),
    );
  }
}
