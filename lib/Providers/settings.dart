import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:taskme/kconst.dart';
import 'package:taskme/old/old_main.dart';

class Settings extends ChangeNotifier{

  Color mainColor = kBAccentG160;
  List<String> lng = ['Arabic', 'English', 'France', 'German'];

  @override
  void dispose() {
    super.dispose();
  }


}