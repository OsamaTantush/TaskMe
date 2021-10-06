import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:todo_app/custom/task.dart';
import 'package:todo_app/models/NotificationManager.dart';

class DataProvider extends ChangeNotifier{
  int maxDateRange=0;
  List<Task> _taskList = [];
  List<Task> _archivedList = [];
  Map<DateTime, Task> _alertMap = {};
  Map<DateTime, List<Task>> taskMap = {}; //organized by category and sorted by date.
  // Map<String, Map<DateTime, List<Task>>> taskMap = {}; //organized by category and sorted by date.
  List categoryList = ['Work','Sport','Family','Reading','Social','Entertainment','Uncategorized'];
  Map<int, String> filterMap = {
    0: 'All',
    1: 'Work',
    2: 'Sport',
    3: 'Family',
    4: 'Reading',
    5: 'Social',
    6: 'Entertainment',
    7: 'Uncategorized'
  };

  NotificationManager _notificationManager = NotificationManager();

  DataProvider(){
    _notificationManager.init();
  }

  List<Task> get taskList{return _taskList;}
  int get taskListLength{return _taskList.length;}
  List<Task> get archivedList{return _archivedList;}
  int get archivedListLength{return _archivedList.length;}
  Map<DateTime,Task> get alertMap{return _alertMap;}
  int get alertMapLenght{return _alertMap.length;}


  void addTask(task) {
    _taskList.add(task);

    //Insert the task in taskMap (sorted by date(keys) & taskList(value)
    DateTime date = DateTime(task.date.year, task.date.month, task.date.day);

    // if(!taskMap.containsKey(task.category)){
    //   taskMap[task.category] = {};
    //   taskMap[task.category].putIfAbsent(date, () => <Task>[]);
    // }
    //
    // else if(!taskMap[task.category].containsKey(date)){
    //   taskMap[task.category][date] = <Task>[];
    // }
    //
    // taskMap[task.category][date].add(task);
    //
    // List<DateTime> dateKeys = taskMap[task.category].keys.toList();
    // Map<DateTime, List<Task>> templateMap = {};
    // dateKeys.sort( (a,b) => a.compareTo(b) );
    // for(int i=0; i<dateKeys.length; i++){
    //   templateMap[dateKeys[i]] = taskMap[task.category][dateKeys[i]];
    // }
    // taskMap[task.category].clear();
    // templateMap[date].sort( (a,b) => (a.date.compareTo(b.date)));
    // taskMap[task.category].addAll(templateMap);

    if(!taskMap.containsKey(date)) {taskMap[date] = <Task>[];}
    taskMap[date].add(task);
    Map<DateTime, List<Task>> sortedTaskMap = sortTaskMap(map: taskMap, sortKey:date);
    taskMap.clear();
    taskMap.addAll(sortedTaskMap);

    // List<DateTime> keys = taskMap.keys.toList();
    // Map<DateTime, List<Task>> map = {};
    //
    // keys.sort( (a,b) => a.compareTo(b) );
    // for(int i=0; i<keys.length; i++ ){map[keys[i]] = taskMap[keys[i]];}
    // taskMap.clear();
    //
    // map[date].sort( (a,b) => (a.date.compareTo(b.date)) );
    // taskMap.addAll(map);

    notifyListeners();

  }

  //Sort all all keys n values || sort all keys n specificKey values
  Map<DateTime, List<Task>> sortTaskMap({map, sortKey}){
    Map<DateTime, List<Task>> tempMap = {};
    List<DateTime> keys = map.keys.toList();
    keys.sort( (a,b) => a.compareTo(b) );
    for(int i=0; i<keys.length; i++ ){
      tempMap[keys[i]] = map[keys[i]];
      if(sortKey==null) {
        tempMap[keys[i]].sort((a, b) => (a.date.compareTo(b.date)));
      }
    }
    if(sortKey!=null){
      tempMap[sortKey].sort( (a,b) => (a.date).compareTo(b.date) );
    }
    return tempMap;
  }

  Map<DateTime, List<Task>> filterTasksByCategory({category}){
    Map<DateTime, List<Task>> filteredMap = {};
    for(DateTime date in taskMap.keys){
      for(Task task in taskMap[date]){
        if(task.category == category){
          if(!filteredMap.containsKey(date)){filteredMap[date] = [];}
          filteredMap[date].add(task);
        }
      }
    }
    Map<DateTime, List<Task>> sortedMap = sortTaskMap(map: filteredMap);
    filteredMap.clear();
    filteredMap.addAll(sortedMap);
    return filteredMap;
  }
  
  void updateCategory(index, value){
    _taskList[index].category = value;
    notifyListeners();
  }

  void updateDate(index, date){
    _taskList[index].date = date;
    notifyListeners();
  }

  updateTaskTitle(index, title){
    _taskList[index].title = title;
    notifyListeners();
  }

  void updateTimer(Task task){
    DateTime currentDate = DateTime.now();
    DateTime alertDate = task.alertDate;

    task.remainingTime.day = (alertDate.difference(currentDate).inHours/24).round();
    task.remainingTime.hour = ((alertDate.difference(currentDate).inSeconds/(60*60))%24).floor();
    task.remainingTime.minute = ((alertDate.difference(currentDate).inSeconds/60) % 60).floor();
    task.remainingTime.second = ((alertDate.difference(currentDate).inSeconds) % 60).floor();

    task.alertTimer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if(task.remainingTime.day==0&&task.remainingTime.hour==0&&task.remainingTime.minute==0&&task.remainingTime.second==0){
          task.alertTimer.cancel();
          removeTaskReminder(task.alertDate);
          notifyListeners();
        }
        else {
          if (task.remainingTime.second > 0) {task.remainingTime.second -= 1;}
          else {
            if (task.remainingTime.minute > 0) {
              task.remainingTime.minute -= 1;
              task.remainingTime.second = 59;
            }
            else{
              if (task.remainingTime.hour > 0) {
                task.remainingTime.hour -= 1;
                task.remainingTime.minute = 59;
              }
              else{
                if (task.remainingTime.day > 0) {
                  task.remainingTime.day -= 1;
                }
              }
            }
          }
        }
        notifyListeners();
      }
    );
  }

  createTaskReminder(index, alertDate){
    taskList[index].alertDate = alertDate;
    _alertMap.putIfAbsent(alertDate, () => _taskList[index]);
    _notificationManager.scheduleNotification(
      id: alertMap.length-1,
      title: _taskList[index].title,
      body: _taskList[index].description,
      dateTime: alertDate,
    );
    updateTimer(alertMap[alertDate]);
    notifyListeners();
  }

  removeTaskReminder(index) {
    if(alertMap.values.elementAt(index).alertTimer.isActive) {
      alertMap.values.elementAt(index).alertTimer.cancel();
    }
    notificationPlugin.cancel(index);
    _alertMap.remove(alertMap.keys.elementAt(index));
    notifyListeners();
  }

  cleanTaskReminder(index){
    List<DateTime> trashKeys = [];
    if(alertMap.length>0){
      for(int i=_alertMap.length-1; i>=0; i--){
        if(taskList[index].title == alertMap.values.elementAt(i).title){
          if(alertMap.values.elementAt(i).alertTimer.isActive){
            alertMap.values.elementAt(i).alertTimer.cancel();}
          notificationPlugin.cancel(i);
          alertMap.remove(alertMap.keys.elementAt(i));
        }
      }
    }
  }

  // Future<void> scheduleCleanTaskReminder(DateTime key){
  //   print('called');
  //   return Future.delayed(
  //     Duration(days: key.day, hours: key.hour, minutes: key.minute, seconds: key.second),
  //     (){
  //       print("in future now");
  //       alertMap.remove(key);
  //       notifyListeners();
  //       print('done');
  //     }
  //   );
  // }

  updateTaskDescription(index, description){
    _taskList[index].description = description;
    notifyListeners();
  }

  updateTaskCheckBox(index){
    _taskList[index].bIschecked =  !_taskList[index].bIschecked;
    notifyListeners();
  }

  void deleteTask({index, bArchive:false}) async{
    if(bArchive){
      _archivedList.remove(_archivedList[index]);
      notifyListeners();
      return;
    }
    await cleanTaskReminder(index);  //clean any task reminders before deleting the task itself.
    _taskList.remove(_taskList[index]);
    notifyListeners();
  }

  void updateTaskState(index){
    _taskList[index].bIsDone = !_taskList[index].bIsDone;
    //reset task checked to false.
    if(!_taskList[index].bIsDone){ taskList[index].bIschecked = false;}
    notifyListeners();
  }

  void selectTask({index, bArchived:false}){
    if(bArchived){
      _archivedList[index].bIsSelected = !_archivedList[index].bIsSelected;
      notifyListeners();
      return;
    }
    _taskList[index].bIsSelected = !_taskList[index].bIsSelected;
    notifyListeners();
  }

  void archiveTask(index)async{
    _taskList[index].bArchived = true;
    _archivedList.add(_taskList[index]);
    _taskList.removeAt(index);
    notifyListeners();
  }

  int unArchive(index){
    _taskList.add(archivedList[index]);
    int taskIndex = _taskList.indexOf(archivedList[index]);
    deleteTask(index: taskIndex, bArchive: true);
    return taskIndex;
  }

}