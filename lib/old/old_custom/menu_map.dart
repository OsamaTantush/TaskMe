import 'package:flutter/cupertino.dart';

enum pageMap{
  myTasks,
  archived,
  alerts,
  about,
  donate,
  contact,
}

class MenuMap extends ChangeNotifier{

  pageMap _currentPage = pageMap.myTasks;

  pageMap get currentPage{return _currentPage;}

  void updatePageMap(value){
    _currentPage = value;
    notifyListeners();
  }

}