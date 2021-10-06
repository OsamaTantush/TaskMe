import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taskme/Providers/taskManager.dart';
import 'package:taskme/custom/task.dart';
import 'package:taskme/kconst.dart';
import 'package:intl/intl.dart';
import 'package:taskme/custom/deleteDialog.dart';

class TaskWidget extends StatelessWidget{
  final Task task;
  TaskWidget({this.task});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: kCardColor.withOpacity(0.075),
        shadowColor: kCardShadowColor.withOpacity(0.15),
        elevation: 3,
        child: Container(
          height: MediaQuery.of(context).size.height*0.2,
          width: double.infinity,
          child: Row(
            children: [
              //task content
              Expanded(
                flex: 14,
                child: InkWell(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title & description
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                task.title,
                                style: TextStyle(
                                  color: kDarkBlue,
                                  fontWeight:FontWeight.bold,
                                  fontSize: 14,
                                  decoration: (!task.bIsDone)? TextDecoration.none: TextDecoration.lineThrough,
                                  decorationThickness: (!task.bIsDone)? 0: 2.8,
                                ),
                              ),
                              SizedBox(height:4),
                              Text(
                                task.description,
                                style: TextStyle(
                                  color: kDarkBlue.withOpacity(0.68),
                                  fontSize: 12,
                                  decoration: (!task.bIsDone)? TextDecoration.none: TextDecoration.lineThrough,
                                  decorationThickness: (!task.bIsDone)? 0: 2.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //category, dateTime, priority
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:8, horizontal:16),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 12,
                                  color: kDarkWhite,
                                  backgroundColor: kDarkBlue,
                                  decoration: (!task.bIsDone)? TextDecoration.none: TextDecoration.lineThrough,
                                  decorationThickness: (!task.bIsDone)? 0: 2.8,
                                ),
                                children: [
                                  TextSpan(text: ' '),
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom:1),
                                      child: Icon(FontAwesomeIcons.solidFolder, size: 12, color: kDarkWhite,),
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' '+task.category+' ',
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 8),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 12,
                                  color: kDarkWhite,
                                  backgroundColor: kDarkBlue,
                                  decoration: (!task.bIsDone)? TextDecoration.none: TextDecoration.lineThrough,
                                  decorationThickness: (!task.bIsDone)? 0: 2.8,
                                ),
                                children: [
                                  TextSpan(text: ' '),
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom:1),
                                      child: Icon(Icons.timer, size: 12, color: kDarkWhite,),
                                    ),
                                  ),
                                  TextSpan(
                                    text: DateFormat(' hh:mm a ').format(task.date),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 8),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 12,
                                  color: kDarkWhite,
                                  backgroundColor: kDarkBlue,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' ',
                                  ),
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom:1),
                                      child: Row(
                                        children: List.generate(3, (index) {
                                          return Icon(
                                            Icons.circle,
                                            size: 12,
                                            color: (index<=task.priority-1)? kBAccentG160.withOpacity(0.8): kDarkWhite,
                                          );
                                        }),
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ',
                                  ),
                                ],
                              ),
                            ),
                            // Text('Priority'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onTap: (){
                    ///TODO Edit task..
                  },
                ),
              ),
              //sidebar menu
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: kBAccentG160.withOpacity(0.8),
                    borderRadius: BorderRadius.only(topRight:Radius.circular(20), bottomRight:Radius.circular(20)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                  width: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Icon((!task.bIsDone)? Icons.add_alert:Icons.replay, color:kDarkBlue),
                        onTap: (){},
                      ),
                      Consumer<TaskManager>(
                        builder: (context, taskManager, child) =>
                        GestureDetector(
                          child: Icon((!task.bIsDone)? Icons.library_add_check_rounded: Icons.archive, color:kDarkBlue),
                          onTap: (){
                            //check task as done
                            if(!task.bIsDone){
                              Future.delayed(Duration(seconds: 1), (){
                                taskManager.markTaskAsDone(task);
                              });
                            }
                            //archive task
                            ///TODO..
                          },
                        ),
                      ),
                      Consumer<TaskManager>(
                        builder: (context, taskManager, child) =>
                        GestureDetector(
                          child: Icon(Icons.delete, color:kDarkBlue),
                          onTap: () async{
                            Future.delayed(Duration(seconds: 1), (){
                              showDialog(
                                context: context,
                                builder: (context) => deleteTaskDialog(task:task),
                              );
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:taskme/custom/task.dart';
// import 'package:taskme/kconst.dart';
// import 'package:intl/intl.dart';
//
// class TaskWidget extends StatelessWidget{
//   final Task task;
//   TaskWidget({this.task});
//
//   @override
//   Widget build(BuildContext context){
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Material(
//         color: kCardColor.withOpacity(0.075),
//         borderRadius: BorderRadius.circular(20),
//         elevation: 3,
//         shadowColor: kCardShadowColor.withOpacity(0.15),
//         child: InkWell(
//           borderRadius: BorderRadius.circular(20),
//           splashColor: kDarkBlue,
//           child: Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   width: double.infinity,
//                   height: MediaQuery.of(context).size.height*0.2,
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: Padding(
//                           padding: EdgeInsets.only(top: 16,left: 18, right: 0, bottom: 0),
//                           child: (('\n'.allMatches(task.description).length>2)
//                                || ('\n'.allMatches(task.description).length>1 && task.title.length>20)
//                                || task.title.length>60 )?
//                           ListView(
//                             padding: EdgeInsets.zero,
//                             children: [
//                               Text(
//                                 '${task.title}',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                   decoration: (task.bIsDone==true)?
//                                   TextDecoration.lineThrough: TextDecoration.none,
//                                   decorationThickness: 1.5,
//                                 ),
//                               ),
//                               SizedBox(height: 8),
//                               Text(
//                                 '${task.description}',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Color(0xff211825).withOpacity(0.8),
//                                 ),
//                               ),
//                             ],
//                           ):
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '${task.title}',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                   decoration: (task.bIsDone==true)?
//                                   TextDecoration.lineThrough: TextDecoration.none,
//                                   decorationThickness: 1.5,
//                                 ),
//                               ),
//                               SizedBox(height: 8),
//                               Text(
//                                 '${task.description}',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Color(0xff211825).withOpacity(0.8),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Container(
//                         height: 20,
//                         padding: EdgeInsets.only(left: 16, bottom: 8),
//                         child: Row(
//                           children: [
//                             Text(
//                               '${task.category}',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 backgroundColor: Color(0xff211825),
//                                 fontSize: 12,
//                               ),
//                             ),
//                             SizedBox(width: 10),
//                             Text(
//                               ' ' + DateFormat('hh:mm a').format(task.date) + ' ',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 backgroundColor: Color(0xff211825),
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height*0.2,
//                 width: 40,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20),),
//                   color: Colors.blue,
//                 ),
//                 padding: const EdgeInsets.only(left:0, top:8, right:0, bottom:8),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     GestureDetector(
//                       child: (task.bIsDone==false)?
//                       Icon(Icons.add_alert, color: Color(0xff211825), size: 28):
//                       Icon(Icons.repeat_one, color: Color(0xff211825), size: 28),
//                       onTap: () {},
//                     ),
//                     SizedBox(width: 4),
//                     (task.bIsDone==false)?
//                     Container(
//                       width: 30,
//                       height: 30,
//                       child: Checkbox(
//                         // value: task.bIschecked,
//                         value: false,
//                         fillColor: MaterialStateProperty.all(Color(0xff211825),),
//                         onChanged: (newValue){},
//                       ),
//                     ):
//                     GestureDetector(
//                       child: Icon(Icons.archive, color: Color(0xff211825), size: 28),
//                       onTap: (){},
//                     ),
//                     SizedBox(width: 4,),
//                     GestureDetector(
//                       child: Icon(Icons.delete, color: Color(0xff211825), size: 28),
//                       onTap: () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           onTap: (){
//             Future.delayed(Duration(milliseconds: 500), (){
//               if(task.bIsDone==false) {
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     return Container();
//                     // return TaskCardDialog(
//                     //   dialogTitle: 'Edit Task',
//                     //   index: index,
//                     //   controllerMap: {
//                     //     'title': data.taskList[index].title,
//                     //     'description': data.taskList[index].description,
//                     //     'category': data.taskList[index].category,
//                     //     'date': data.taskList[index].date,
//                     //   },
//                     // );
//                   },
//                 );
//               }
//             });
//           },
//         ),
//       ),
//     );
//   }
// }

