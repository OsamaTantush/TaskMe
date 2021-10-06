// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/models/data_provider.dart';
// import 'package:todo_app/models/slide_menu.dart';
// import 'package:intl/intl.dart';
// import 'package:todo_app/custom/task_dialog.dart';
//
// class Archive extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 80,
//         elevation: 3,
//         backgroundColor: Colors.yellow,
//         foregroundColor: Color(0xff211825),
//         title: Text(
//           'Archive',
//           style: TextStyle(
//             color: Color(0xff211825),
//             fontSize: 30,
//             letterSpacing: 1,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: false,
//         leading: Builder(
//           builder: (context){
//             return IconButton(
//               icon: Icon(Icons.list, size: 30,),
//               color: Color(0xff211825),
//               onPressed: (){
//                 Scaffold.of(context).openDrawer();
//               },
//             );
//           },
//         ),
//       ),
//       drawer: SlideMenu(),
//       body: Consumer<DataProvider>(
//         builder: (context, data, child){
//           return ListView.builder(
//             padding: EdgeInsets.only(top: 10),
//             physics: ClampingScrollPhysics(),
//             itemCount: data.archivedListLength,
//             itemBuilder: (context, index){
//               return Container(
//                 height: 110,
//                 width: double.infinity,
//                 padding: EdgeInsets.only(left:8, top: 6, right:8, bottom: 6),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Material(
//                         color: Color(0xff211825).withOpacity(0.075),
//                         borderRadius: BorderRadius.circular(20),
//                         elevation: 3,
//                         shadowColor: (Colors.yellow.withOpacity(0.15)),
//                         child: InkWell(
//                           borderRadius: BorderRadius.circular(20),
//                           splashColor: Color(0xff211825),
//                           child: Padding(
//                             padding: EdgeInsets.only(left:8, top:10, right:6, bottom: 1),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Expanded(
//                                   flex: 18,
//                                   child: Container(
//                                     padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Expanded(
//                                           child: ListView(
//                                             children: [
//                                               Text(
//                                                 '${data.archivedList[index].title}',
//                                                 style: TextStyle(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold,
//                                                   decoration:TextDecoration.none,
//                                                 ),
//                                               ),
//                                               SizedBox(height: 3),
//                                               Text(
//                                                 '${data.archivedList[index].description}',
//                                                 style: TextStyle(
//                                                   fontSize: 12,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Container(
//                                           height: 16,
//                                           child: Row(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.end,
//                                             children: [
//                                               Text(
//                                                 '${data.archivedList[index].category}',
//                                                 style:
//                                                 TextStyle(
//                                                   color: Colors.white,
//                                                   backgroundColor: Color(0xff211825),
//                                                   fontSize: 12,
//                                                 ),
//                                               ),
//                                               SizedBox(width: 10),
//                                               Text(
//                                                 DateFormat('dd-MM-yyyy kk:mm').format(data.archivedList[index].date),
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   backgroundColor: Color(0xff211825),
//                                                   fontSize: 12,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   flex: 4,
//                                   child: Container(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       children: [
//                                         Expanded(
//                                           flex: 1,
//                                           child: IconButton(
//                                             color: Color(0xff211825),
//                                             padding: EdgeInsets.only(bottom: 8),
//                                             icon: Icon(Icons.repeat_one),
//                                             onPressed: (){
//                                               showDialog(
//                                                 context: context,
//                                                 builder: (context)
//                                                 {
//                                                   return TaskCardDialog(
//                                                     index: index,
//                                                     dialogTitle: 'Reset Task',
//                                                     controllerMap: {
//                                                       'title': data.archivedList[index].title,
//                                                       'description': data.archivedList[index].description,
//                                                       'category': data.archivedList[index].category,
//                                                       'date': data.archivedList[index].date,
//                                                     },
//                                                     bArchive: true,
//                                                   );
//                                                 },
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 1,
//                                           child: IconButton(
//                                             color: Colors.red[700],
//                                             padding: EdgeInsets.only(bottom: 8),
//                                             icon: Icon(Icons.delete,),
//                                             onPressed: (){
//                                               Future.delayed(
//                                                 Duration(milliseconds: 500),
//                                                     (){
//                                                   showDialog(
//                                                     context: context,
//                                                     builder: (context) {
//                                                       return AlertDialog(
//                                                         actionsPadding: EdgeInsets.only(right: 4),
//                                                         buttonPadding: EdgeInsets.zero,
//                                                         contentPadding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 8),
//                                                         backgroundColor: Colors.white,
//                                                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                                                         title: Text('Confirmation', textAlign: TextAlign.center, style: TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold),),
//                                                         content: Text(
//                                                             'Are you sure you want to remove task?',
//                                                             textAlign: TextAlign.center,
//                                                             style: TextStyle(fontSize: 15)),
//                                                         actions: [
//                                                           TextButton(
//                                                             child: Text('Yes', style: TextStyle(color: Colors.red[800]),),
//                                                             onPressed: () {
//                                                               data.deleteTask(index:index, bArchive:true);
//                                                               Navigator.of(context).pop();
//                                                             },
//                                                           ),
//                                                           TextButton(
//                                                             child: Text('No', style: TextStyle(color: Color(0xff211825).withOpacity(0.5)),),
//                                                             onPressed: () {
//                                                               Navigator.of(context).pop();
//                                                             },
//                                                           ),
//                                                         ],
//                                                       );
//                                                     },
//                                                   );
//                                                 },
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           onTap: (){
//                             Future.delayed(
//                               Duration(milliseconds: 500),
//                                   (){ },
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }