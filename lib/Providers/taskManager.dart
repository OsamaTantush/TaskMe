import 'package:flutter/cupertino.dart';
import 'package:taskme/custom/task.dart';

class TaskManager extends ChangeNotifier{
  List<String> categoryList;
  Map<DateTime, List<Task>> taskMap = {};

  TaskManager(){
    categoryList = ['Work', 'Study', 'Sport', 'Meeting', 'Travel', 'Social', 'Reading', 'Writing', 'Family', 'Entertainment', 'Uncategorized'];
  }

  @override
  void dispose() {
    super.dispose();
  }

  //Create new tasks [Note]: tasks are organized by date ex: {'1/10/2030': [task1, task2, etc]..}
  void createNewTask({String title,String description,int priority,String category,DateTime date}){
    Task newTask = Task(title:title,description:description,priority:priority,category:category,date:date);
    DateTime dateKey = DateTime(date.year, date.month, date.day);
    if(!taskMap.containsKey(dateKey)) {taskMap[dateKey] = <Task>[];}
    taskMap[dateKey].add(newTask);
    Map<DateTime, List<Task>> sortedTaskMap = sortTaskMap(map:taskMap, sortKey:dateKey);
    taskMap.clear();
    taskMap.addAll(sortedTaskMap);
    print('Task has been created successfully!');
    notifyListeners();
  }

  //Sort all keys & keys-values || sort all keys & specificKey-values
  Map<DateTime, List<Task>> sortTaskMap({map, sortKey}){
    Map<DateTime, List<Task>> tempMap = {};
    List<DateTime> keys = map.keys.toList();
    keys.sort( (a,b) => a.compareTo(b) );
    for(int i=0; i<keys.length; i++ ){
      tempMap[keys[i]] = map[keys[i]];
      if(sortKey==null) {tempMap[keys[i]].sort((a,b)=>(a.date.compareTo(b.date)));}
    }
    if(sortKey!=null){tempMap[sortKey].sort((a,b)=>(a.date).compareTo(b.date));}
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

  void markTaskAsDone(Task task){
    task.bIsDone = true;
    notifyListeners();
  }

  void deleteTask(Task task){
    //remove any task alerts of this task & stop it's timer.
    ///TODO..await implement

    //delete task
    DateTime dateKey = DateTime(task.date.year, task.date.month, task.date.day);
    taskMap[dateKey].remove(task);
    //check dateKey if became empty, then delete it.
    if(taskMap[dateKey].isEmpty){taskMap.remove(dateKey);}
    notifyListeners();
  }

}