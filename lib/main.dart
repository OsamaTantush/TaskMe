import 'package:flutter/material.dart';

void main(){
  runApp(TaskMe());
}

class TaskMe extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      routes: {
        '/': (context) => TaskMe(),
      },
    );
  }
}
