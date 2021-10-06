import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskme/Providers/taskManager.dart';
import 'package:taskme/custom/task.dart';
import 'package:intl/intl.dart';
import 'package:taskme/models/taskWidget.dart';


class TaskView extends StatelessWidget{
  final String filter;
  TaskView({this.filter});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskManager>(
      builder: (context, taskManager, child) {
        Map<DateTime, List<Task>> taskMap;
        if (filter == 'All') {taskMap = taskManager.taskMap;}
        else {taskMap = taskManager.filterTasksByCategory(category:filter);}

        return ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: taskMap.length+1,
          itemBuilder: (context, i){
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
              child: (taskMap.isNotEmpty && i < taskMap.length)?
              Text(
                DateFormat('dd-MMM-yyyy').format(taskMap.keys.elementAt(i)),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff211825).withOpacity(0.28),
                ),
              ): Container(height: MediaQuery.of(context).size.height*0.2),
            );
          },
          separatorBuilder: (context, i) {
            return (i<taskMap.length)? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: taskMap[taskMap.keys.elementAt(i)].map<TaskWidget>((item) {
                return TaskWidget(task: item);
              }).toList(),
            ): SizedBox(height: 10);
          },
        );
      }
    );
  }
}