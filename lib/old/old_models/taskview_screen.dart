import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/custom/task.dart';
import 'package:todo_app/models/data_provider.dart';
import 'package:todo_app/models/task_widget.dart';
import 'package:intl/intl.dart';

class TaskViewScreen extends StatelessWidget {
  final String filter;
  TaskViewScreen({this.filter});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, data, child) {
        Map<DateTime, List<Task>> taskMap;
        if(filter==data.filterMap[0]){taskMap=data.taskMap;}
        else{taskMap=data.filterTasksByCategory(category:filter);}

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
          separatorBuilder: (context, i){
            return (i<taskMap.length)? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: taskMap[taskMap.keys.elementAt(i)].map<TaskWidget>((item) {
                return TaskWidget(item);
              }).toList(),
            ): SizedBox(height: 10);
          },
        );
      }
    );
  }
}

//         return ListView.separated(
//           padding: EdgeInsets.only(top: 4, bottom: 4),
//           itemCount: data.taskMap[category].length+1,
//           itemBuilder: (context, i){
//             return Padding(
//               padding: const EdgeInsets.only(top:4, bottom: 8, left: 10, right: 10),
//               child: (data.taskMap[category].isNotEmpty && i < data.taskMap[category].length)?
//               Text(
//                 DateFormat('dd-MMM-yyyy').format(data.taskMap[category].keys.elementAt(i)),
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Color(0xff211825).withOpacity(0.28),
//                 ),
//               ): Container(height: MediaQuery.of(context).size.height*0.2),
//             );
//           },
//           separatorBuilder: (context, i){
//             return (i<data.taskMap[category].length)? Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: data.taskMap[category][data.taskMap[category].keys.elementAt(i)].map<TaskWidget>((item) {
//                 return TaskWidget(item);
//               }).toList(),
//             ): SizedBox(height: 10);
//           },
//         );
//       }
//     );
//   }
// }
//
