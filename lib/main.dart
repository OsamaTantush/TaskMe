import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/navigationManager.dart';
import 'Providers/settings.dart';
import 'Providers/taskManager.dart';
import 'screens/home.dart';

void main(){
  runApp(TaskMe());
}

class TaskMe extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskManager()),
        ChangeNotifierProvider(create: (_) => Settings()),
        ChangeNotifierProvider(create: (_) => NavigationManager()),
      ],
      builder: (context, child) => MaterialApp(
        routes: {
          '/': (context) => Home(),
        },
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
