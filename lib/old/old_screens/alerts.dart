// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/custom/menu_map.dart';
// import 'package:todo_app/models/data_provider.dart';
// import 'package:todo_app/models/slide_menu.dart';
// import 'package:intl/intl.dart';
//
// class Alerts extends StatefulWidget {
//   @override
//   _AlertsState createState() => _AlertsState();
// }
//
// class _AlertsState extends State<Alerts>{
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print('Hello');
//
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 80,
//         elevation: 3,
//         backgroundColor: Colors.yellow,
//         foregroundColor: Color(0xff211825),
//         title: Text(
//           'Alerts',
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
//             itemCount: data.alertMap.length,
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
//                                   flex: 20,
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
//                                                 '${data.alertMap.values.elementAt(index).title}',
//                                                 style: TextStyle(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold,
//                                                   decoration:TextDecoration.none,
//                                                 ),
//                                               ),
//                                               SizedBox(height: 3),
//                                               Text(
//                                                 '${data.alertMap.values.elementAt(index).description}',
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
//                                                 '${data.alertMap.values.elementAt(index).category}',
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   backgroundColor: Color(0xff211825),
//                                                   fontSize: 12,
//                                                 ),
//                                               ),
//                                               SizedBox(width: 10),
//                                               Text(
//                                                 DateFormat('dd-MM-yyyy kk:mm').format(data.alertMap.values.elementAt(index).date),
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
//                                   flex: 14,
//                                   child: Container(
//                                     // color: Colors.red,
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       children: [
//                                         Expanded(
//                                           flex: 5,
//                                           child: Padding(
//                                             padding: const EdgeInsets.only(bottom:8),
//                                             child: Row(
//                                               children: [
//                                                 // Icon(
//                                                 //   Icons.alarm,
//                                                 //   color: Color(0xff211825),
//                                                 // ),
//                                                 Expanded(
//                                                   child: Material(
//                                                     color: Color(0xff211825).withOpacity(0.88),
//                                                     // color: Colors.yellow.withOpacity(1),
//                                                     type: MaterialType.canvas,
//                                                     borderRadius: BorderRadius.circular(20),
//                                                     child: Container(
//                                                       alignment: Alignment.center,
//                                                       height: 25,
//                                                       child: Text(
//                                                         "${data.alertMap.values.elementAt(index).remainingTime.day}" + 'D : ' +
//                                                         "${data.alertMap.values.elementAt(index).remainingTime.hour}" + 'H : '+
//                                                         "${data.alertMap.values.elementAt(index).remainingTime.minute}" + 'm : ' +
//                                                         "${data.alertMap.values.elementAt(index).remainingTime.second}" + 's',
//                                                         // style: TextStyle(fontSize: 13, color: Color(0xfffcc404)),
//                                                         style: TextStyle(fontSize: 12, color: Colors.yellow),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 // Text(
//                                                 //   DateFormat('dd-MM-yy kk:mm').format(data.alertMap.keys.elementAt(index)),
//                                                 //   style: TextStyle(fontSize: 18, backgroundColor: Colors.yellow, fontWeight: FontWeight.w600),
//                                                 // ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(width: 3,),
//                                         Expanded(
//                                           flex: 1,
//                                           child: IconButton(
//                                             color: Colors.red[700],
//                                             padding: EdgeInsets.only(bottom: 8),
//                                             icon: Icon(Icons.delete,),
//                                             onPressed: (){
//                                               Future.delayed(
//                                                 Duration(milliseconds: 500),
//                                                 (){
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
//                                                           'Are you sure you want to remove task?',
//                                                           textAlign: TextAlign.center,
//                                                           style: TextStyle(fontSize: 15)),
//                                                         actions: [
//                                                           TextButton(
//                                                             child: Text('Yes', style: TextStyle(color: Colors.red[800]),),
//                                                             onPressed: () {
//                                                               data.removeTaskReminder(index);
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
//                               (){ },
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