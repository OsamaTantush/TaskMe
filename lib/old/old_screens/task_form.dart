// import 'package:date_field/date_field.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_app/custom/task.dart';
// import 'package:todo_app/models/data_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/models/error_manager.dart';
//
// class TaskForm extends StatefulWidget{
//   @override
//   _TaskFormState createState() => _TaskFormState();
// }
//
// class _TaskFormState extends State<TaskForm> {
//   Map<String,dynamic> controllerMap = {
//     'title': TextEditingController(),
//     'description': TextEditingController(),
//     'category': 'Uncategorized',
//     'date': DateTime.now().add(Duration(hours: 1))
//   };
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.55,
//       padding: const EdgeInsets.only(left:16, top:8, right:16, bottom:0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: FormData(
//         controllerMap: controllerMap,
//         categoryCallback:(value){
//           setState(() {controllerMap['category'] = value;});
//         },
//         dateCallback:(value){
//           setState(() {controllerMap['date'] = value;});
//         },
//       ),
//     );
//   }
// }
//
// class FormData extends StatelessWidget{
//   final Map<String,dynamic> controllerMap;
//   final Function categoryCallback;
//   final Function dateCallback;
//
//   FormData({this.controllerMap, this.categoryCallback, this.dateCallback});
//
//   @override
//   Widget build(BuildContext context){
//     Task task = Task();
//     return Consumer2<DataProvider, ErrorManager>(
//       builder: (context, data, errorManager, child){
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             /* Title */
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   'Add new task _',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                 IconButton(
//                   icon: Icon(
//                     Icons.add_circle_outlined,
//                     size: 45,
//                   ),
//                   onPressed: (){
//                     errorManager.cleanSubmitFlags();
//                     if(controllerMap['title'].text.isNotEmpty
//                       &&controllerMap['description'].text.isNotEmpty
//                       &&controllerMap['date'].isAfter(DateTime.now().add(Duration(seconds: 1))) ){
//                       task.set(setMap: controllerMap);
//                       data.addTask(task);
//                       Navigator.pop(context);
//                     }
//                     else {
//                       if(controllerMap['title'].text.isEmpty) {
//                         errorManager.submitTitleErrorFlag();}
//                       if(controllerMap['description'].text.isEmpty) {
//                         errorManager.submitDescriptionErrorFlag();}
//                       if(controllerMap['date'].isBefore(DateTime.now().add(Duration(seconds: 1)))){
//                         errorManager.submitDateErrorFlag();}
//                     }
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             /* Content */
//             Expanded(
//               child:  ListView(
//                 padding: EdgeInsets.only(top: 10),
//                 children: [
//                   //Title
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Title',
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                           color: (!errorManager.bSubmitTitleErrorFlag)? Colors.black:Colors.red,
//                           fontSize: 15,
//                         ),
//                       ),
//                       SizedBox(width: 14),
//                       Expanded(
//                         child: Container(
//                           height: 36,
//                           child: TextField(
//                             controller: controllerMap['title'],
//                             textAlign: TextAlign.center,
//                             cursorColor: Colors.black,
//                             decoration: InputDecoration(
//                               filled: true,
//                               fillColor: Color.alphaBlend(Color(0xff211825).withOpacity(0.075),Colors.yellow.withOpacity(0.15), ),
//                               focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 12),
//                   //Description
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 14),
//                         child: Text(
//                           'Description',
//                           textAlign: TextAlign.start,
//                           style: TextStyle(
//                             color: (!errorManager.bSubmitDescriptionErrorFlag)? Colors.black:Colors.red,
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 14),
//                       Expanded(
//                         child: Container(
//                           height: 120,
//                           alignment: Alignment.center,
//                           child: TextFormField(
//                             controller: controllerMap['description'],
//                             maxLines: 4,
//                             minLines: 3,
//                             maxLength: 80,
//                             textAlign: TextAlign.center,
//                             cursorColor: Colors.black,
//                             decoration: InputDecoration(
//                               filled: true,
//                               fillColor: Color.alphaBlend(Color(0xff211825).withOpacity(0.075),Colors.yellow.withOpacity(0.15), ),
//                               focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   //Category
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Select a category',
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 15,
//                         ),
//                       ),
//                       SizedBox(width: 14),
//                       DropdownButton(
//                         value: controllerMap['category'],
//                         items: getCategoryMenuItems(data.categoryList),
//                         elevation: 3,
//                         dropdownColor: Colors.yellow,
//                         style: TextStyle(fontSize: 15, color: Colors.black45),
//                         onChanged: categoryCallback,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   //Date
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Date',
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                           color: (!errorManager.bSubmitDateErrorFlag)? Colors.black:Colors.red,
//                           fontSize: 15,
//                         ),
//                       ),
//                       SizedBox(width: 14),
//                       Container(
//                         height:34,
//                         width: MediaQuery.of(context).size.width*0.6,
//                         child: DateTimeFormField(
//                           enabled: true,
//                           dateTextStyle: TextStyle(fontSize: 15),
//                           initialValue: controllerMap['date'],
//                           firstDate: DateTime.now(),
//                           lastDate: DateTime(DateTime.now().year + 100),
//                           decoration: InputDecoration(
//                             isDense: true,
//                             contentPadding: EdgeInsets.only(left: 30, top: 11),
//                             fillColor: Color.alphaBlend(Color(0xff211825).withOpacity(0.075),Colors.yellow.withOpacity(0.15), ),
//                             filled: true,
//                             suffixIcon: Icon(Icons.calendar_today, size: 21, color: Colors.black,),
//                             border: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.black),
//                             ),
//                           ),
//                           onDateSelected: dateCallback,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   List<DropdownMenuItem> getCategoryMenuItems(categoryList){
//     List<DropdownMenuItem> menuList = [];
//     for(var i=0; i<categoryList.length; i++){
//       menuList.add(
//         DropdownMenuItem(
//           value: categoryList[i],
//           child: Text(categoryList[i]),
//         ),
//       );
//     }
//     return menuList;
//   }
//
// }