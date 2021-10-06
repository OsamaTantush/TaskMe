// import 'package:flutter/material.dart';
// import 'package:todo_app/models/slide_menu.dart';
//
// class About extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 80,
//         elevation: 3,
//         backgroundColor: Colors.yellow,
//         foregroundColor: Color(0xff211825),
//         title: Text(
//           'About',
//           style: TextStyle(
//             color: Color(0xff211825),
//             fontSize: 30,
//             letterSpacing: 1,
//             fontWeight: FontWeight.bold
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
//           }
//         ),
//       ),
//       drawer: SlideMenu(),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 36),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.black,
//                   foregroundColor: Colors.yellow,
//                   radius: 42,
//                   child: Icon(
//                     Icons.sticky_note_2,
//                     size: 38,
//                   ),
//                 ),
//                 SizedBox(width: 16,),
//                 Padding(
//                   padding: const EdgeInsets.only(top:8),
//                   child: Text(
//                     'TaskMe',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 36,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 40),
//           Text('Version: 0.0.1'),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
//             child: Divider(color: Colors.black),
//           ),
//           Text('Contact Info: TaskMeApp@gmail.com'),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
//             child: Divider(color: Colors.black,),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.emoji_food_beverage_outlined, size: 21),
//               SizedBox(width: 8),
//               Text(
//                 'Support our team',
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(width: 8),
//               TextButton(
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Colors.black),
//                   foregroundColor: MaterialStateProperty.all(Colors.yellow),
//                   shape: MaterialStateProperty.all(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                   ),
//                 ),
//                 child: Text('Donate'),
//                 onPressed: (){
//                   //TODO Implement built-in payment method
//                 },
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
//             child: Divider(color: Colors.black,),
//           ),
//           Text('© 2021 Al-hamra team.'),
//         ],
//       ),
//     );
//   }
// }
