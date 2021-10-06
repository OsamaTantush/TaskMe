// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/custom/task.dart';
// import 'package:todo_app/models/task_widget.dart';
// import 'package:todo_app/screens/task_form.dart';
// // import 'package:todo_app/models/taskListView.dart';
// import 'package:todo_app/models/taskview_screen.dart';
// import 'package:todo_app/models/slide_menu.dart';
// import 'package:todo_app/custom/category_tabview.dart';
// import 'package:todo_app/models/data_provider.dart';
//
// class HomeScreen extends StatefulWidget{
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
//   List<Task> listTask = [];
//   TabController tabController;
//
//   @override
//   void initState() {
//     tabController = TabController(length: 8, vsync: this);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.alphaBlend(Colors.indigoAccent, Colors.white).withGreen(160),
//       drawer: SlideMenu(),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(
//               top: MediaQuery.of(context).padding.top + 18, bottom: 18, left: 18, right: 18,
//             ),
//             child: header(),
//           ),
//           Expanded(
//             child: body(),
//           ),
//         ],
//       ),
//       floatingActionButton: newTaskBtn(context),
//     );
//   }
//
//   Widget header() {
//     // return Image(
//     //   image: AssetImage('res/taskme_logo00.png'),
//     // );
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CircleAvatar(
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.white,
//           //foregroundColor: Color.alphaBlend(Colors.indigoAccent, Colors.white).withGreen(160),
//           radius: 48,
//           child: Builder(
//             builder: (context) {
//               return Container(
//                 padding: EdgeInsets.all(21),
//                 decoration: BoxDecoration(
//                   color: Color.alphaBlend(Colors.indigoAccent, Colors.white).withGreen(160),
//                   borderRadius: BorderRadius.circular(360),
//                 ),
//                 child: IconButton(
//                   padding: EdgeInsets.zero,
//                   icon: Icon(Icons.list, size: 48, color: Color(0xff211825)),
//                   onPressed: () {
//                     Scaffold.of(context).openDrawer();
//                   },
//                 ),
//               );
//             },
//           ),
//         ),
//         SizedBox(height: 8),
//         Text(
//           'TaskMe',
//           style: TextStyle(
//             color: Color(0xff211825),
//             //color: Colors.white,
//             //fontWeight: FontWeight.bold,
//             fontSize: 32,
//             fontFamily: 'Righteous-Regular',
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
//
//   Widget body() {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.only(top: 18, left: 20, right: 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(40),
//           topRight: Radius.circular(40),
//         ),
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(left: 8, right: 8),
//             child: CategoryTabBar(
//               controller: tabController,
//             ),
//           ),
//           SizedBox(height: 20),
//           Expanded(
//             child: TabBarView(
//               controller: tabController,
//               children: Provider.of<DataProvider>(context).filterMap.values.map<TaskViewScreen>((filter) {
//                 return TaskViewScreen(filter: filter);
//               }).toList(),
//               // [
//               //   TaskViewScreen(category: Provider.of<DataProvider>(context).categoryMap[0]),
//               //   Text(''),
//               //   Text(''),
//               // ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   FloatingActionButton newTaskBtn(context) {
//     return FloatingActionButton(
//       backgroundColor: Color(0xff211825),
//       foregroundColor: Colors.white70,
//       child: Icon(Icons.post_add_rounded, size: 32, color: Colors.white70,),
//       onPressed: () {
//         showModalBottomSheet(
//           isScrollControlled: true,
//           backgroundColor: Colors.white.withOpacity(0),
//           context: context,
//           builder: (context) {
//             Task task = Task();
//             return TaskForm();
//           },
//         );
//       },
//     );
//   }
//
// }