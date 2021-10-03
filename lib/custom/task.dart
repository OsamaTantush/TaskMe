
class Task{
  String title;
  String description;
  int priority;
  String category;
  DateTime date;
  List<DateTime> alertDateList = [];
  ///TODO audioDescription
  bool bIsDone;
  bool bIsArchived;

  Task({
    this.title,
    this.description,
    this.priority,
    this.category,
    this.date,
    this.alertDateList,
    this.bIsDone,
    this.bIsArchived
  });

}