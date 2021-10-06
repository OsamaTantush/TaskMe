// import 'package:flutter/material.dart';
// import 'package:todo_app/models/slide_menu.dart';
//
// class Contact extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 80,
//         elevation: 3,
//         backgroundColor: Colors.yellow,
//         foregroundColor: Color(0xff211825),
//         title: Text(
//           'Contact',
//           style: TextStyle(
//               color: Color(0xff211825),
//               fontSize: 30,
//               letterSpacing: 1,
//               fontWeight: FontWeight.bold
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
//       body: Padding(
//         padding: const EdgeInsets.only(top:40, left:8, right:8),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Get in touch',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 42,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 1,
//                   ),
//                 ),
//                 SizedBox(width: 14),
//                 Icon(
//                   Icons.attach_email,
//                   size: 36,
//                   color: Colors.black,
//                 ),
//               ],
//             ),
//             SizedBox(height: 40),
//             //Name and Email
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     flex:1,
//                     child: TextField(
//                       cursorColor: Colors.white,
//                       style: TextStyle(color: Colors.yellow, fontSize: 12),
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.all(16),
//                         hintText: 'Name',
//                         hintStyle: TextStyle(color: Colors.yellow, fontSize: 12),
//                         fillColor: Color(0xff211825),
//                         filled: true,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(width: 3, color: Colors.yellow),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(width: 3, color: Colors.yellow),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(width: 3, color: Colors.yellow),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 16),
//                   Expanded(
//                     flex:1,
//                     child: TextField(
//                       cursorColor: Colors.white,
//                       style: TextStyle(color: Colors.yellow, fontSize: 12),
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.all(16),
//                         hintText: 'Email',
//                         hintStyle: TextStyle(color: Colors.yellow, fontSize: 12),
//                         fillColor: Color(0xff211825),
//                         filled: true,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(width: 3, color: Colors.yellow),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(width: 3, color: Colors.yellow),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: BorderSide(width: 3, color: Colors.yellow),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: TextFormField(
//                 maxLines: 10,
//                 minLines: 10,
//                 cursorColor: Colors.white,
//                 style: TextStyle(color: Colors.yellow, fontSize: 12),
//                 decoration: InputDecoration(
//                   hintText: 'Enter Your Message',
//                   hintStyle: TextStyle(color: Colors.yellow, fontSize: 12),
//                   fillColor: Color(0xff211825),
//                   filled: true,
//                   contentPadding: EdgeInsets.all(16),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide(width: 3, color: Colors.yellow),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide(width: 3, color: Colors.yellow),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: BorderSide(width: 3, color: Colors.yellow),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 0, horizontal: 64),
//               child: TextButton(
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Colors.yellow),
//                   foregroundColor: MaterialStateProperty.all(Colors.black),
//                   padding: MaterialStateProperty.all(EdgeInsets.all(16)),
//                   shape: MaterialStateProperty.all(
//                     RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
//                   ),
//                 ),
//                 child: Text('Submit', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
//                 onPressed: (){},
//               ),
//             ),
//             SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
//               child: Divider(color: Colors.black,),
//             ),
//             Text('© 2021 Al-hamra team.', textAlign: TextAlign.center),
//           ],
//         ),
//       ),
//     );
//   }
// }
