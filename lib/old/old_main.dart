// import 'package:flutter/material.dart';
// import 'package:todo_app/models/donationData.dart';
// import 'package:todo_app/screens/home_screen.dart';
// import 'screens/archive.dart';
// import 'screens/alerts.dart';
// import 'screens/donate.dart';
// import 'screens/about.dart';
// import 'screens/contact.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/models/data_provider.dart';
// import 'package:todo_app/models/error_manager.dart';
//
// Future<void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(TaskMe());
// }
//
// class TaskMe extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => DataProvider()),
//         ChangeNotifierProvider(create: (context) => ErrorManager()),
//         ChangeNotifierProvider(create: (context) => DonationData()),
//       ],
//       child: MaterialApp(
//         routes: {
//           '/': (context) => HomeScreen(),
//           '/archive': (context) => Archive(),
//           '/alerts': (context) => Alerts(),
//           '/donate': (context) => Donate(),
//           '/about': (context) => About(),
//           '/contact': (context) => Contact()
//         },
//         initialRoute: '/',
//       ),
//     );
//   }
// }