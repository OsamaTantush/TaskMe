import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/data_provider.dart';
import 'package:todo_app/models/error_manager.dart';
import 'package:date_field/date_field.dart';


class TaskCardDialog extends StatefulWidget{
  final int index;
  final String dialogTitle;
  final Map<String, dynamic> controllerMap;
  bool bArchive;
  TaskCardDialog({this.index, this.dialogTitle, this.controllerMap, this.bArchive:false});

  @override
  _TaskCardDialog createState() => _TaskCardDialog();
}

class _TaskCardDialog extends State<TaskCardDialog>{
  int index;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  DateTime _dateController;
  String _categoryController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = widget.index;
    _titleController.text = widget.controllerMap['title'];
    _descriptionController.text = widget.controllerMap['description'];
    _categoryController = widget.controllerMap['category'];
    _dateController = widget.controllerMap['date'];
  }

  @override
  Widget build(BuildContext context){
    return Consumer2<DataProvider, ErrorManager>(
        builder: (context, data, errorManager, child){
          return AlertDialog(
            insetPadding: EdgeInsets.only(left:16, top:16, right:16),
            actionsPadding: EdgeInsets.only(top:4, bottom: 4),
            contentPadding: EdgeInsets.only(left: 20, top:14, right: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Colors.white,
            content: SingleChildScrollView( //TODO Move this to the main widget instead of child..
              child: Container(
                height: MediaQuery.of(context).size.height*0.5,
                width:  MediaQuery.of(context).size.width*0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16, top:3),
                              child: Text(
                                widget.dialogTitle,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 0),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.red[800],
                            foregroundColor: Colors.yellow,
                            radius: 16,
                            child: Builder(
                              builder: (context) => IconButton(
                                alignment: Alignment.center,
                                color: Colors.red,
                                icon: Icon(Icons.close, color: Colors.yellow, size: 15,),
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _titleController,
                      style: TextStyle(
                        color: Color(0xff211825),
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        enabled: true,
                        fillColor: Color.alphaBlend(Color(0xff211825).withOpacity(0.075),Colors.yellow.withOpacity(0.15), ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20,), topRight: Radius.circular(20)),
                          borderSide: BorderSide(width: 0, color: Colors.yellow.withOpacity(0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20,), topRight: Radius.circular(20)),
                          borderSide: BorderSide(width: 0, color: Colors.yellow.withOpacity(0)),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20,), topRight: Radius.circular(20)),
                          borderSide: BorderSide(width: 0, color: Colors.yellow.withOpacity(0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20,), topRight: Radius.circular(20)),
                          borderSide: BorderSide(width: 0, color: Colors.yellow.withOpacity(0)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        maxLines: 8,
                        minLines: 8,
                        maxLength: 80,
                        controller: _descriptionController,
                        style: TextStyle(fontSize: 14, color: Color(0xff211825) ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10, top:0, right: 10, bottom:4),
                          filled: true,
                          enabled: true,
                          fillColor: Color.alphaBlend(Color(0xff211825).withOpacity(0.075),Colors.yellow.withOpacity(0.15), ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20,), bottomRight: Radius.circular(20)),
                            borderSide: BorderSide(width: 0, color: Colors.yellow.withOpacity(0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20,), bottomRight: Radius.circular(20)),
                            borderSide: BorderSide(width: 0, color: Colors.yellow.withOpacity(0)),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20,), bottomRight: Radius.circular(20)),
                            borderSide: BorderSide(width: 0, color: Colors.yellow.withOpacity(0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20,), bottomRight: Radius.circular(20)),
                            borderSide: BorderSide(width: 0, color: Colors.yellow.withOpacity(0)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*0.8,
                      child: Row(
                        children: [
                          Text('Category :'),
                          SizedBox(width: 20),
                          DropdownButton(
                            value: _categoryController,
                            items: getCategoryMenuItems(data.categoryList),
                            elevation: 3,
                            dropdownColor: Colors.yellow,
                            style: TextStyle(fontSize: 15, color: Colors.black45),
                            onChanged: (value){
                              setState(() {_categoryController = value;});
                              //data.updateCategory(index, value);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      height: 36,
                      width: MediaQuery.of(context).size.width*0.8,
                      child: Row(
                        children: [
                          Text(
                            'Date :',
                            style: TextStyle(color: (!errorManager.bAlertSelectedDateError)? Color(0xff211825): Colors.red[800]),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: DateTimeFormField(
                              enabled: true,
                              dateTextStyle: TextStyle(fontSize: 14),
                              initialValue: _dateController,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(DateTime.now().year + 10),
                              decoration: InputDecoration(
                                enabled: true,
                                isDense: true,
                                contentPadding: EdgeInsets.only(left: 30, top: 11),
                                fillColor: Color.alphaBlend(Color(0xff211825).withOpacity(0.075),Colors.yellow.withOpacity(0.15), ),
                                filled: true,
                                suffixIcon: Icon(Icons.calendar_today, size: 21, color: Colors.black,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20,)),
                                  borderSide: BorderSide(width: 0, color: Colors.yellow.withOpacity(0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20,)),
                                  borderSide: BorderSide(width: 0, color: Colors.yellow.withOpacity(0)),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20,)),
                                  borderSide: BorderSide(width: 0, color: Colors.yellow.withOpacity(0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20,)),
                                  borderSide: BorderSide(width: 0, color: Colors.yellow.withOpacity(0)),
                                ),
                              ),
                              onDateSelected: (date){
                                setState(() {_dateController = date;});
                                //data.updateDate(index, date);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 60),
                padding: EdgeInsets.only(top:2, bottom:8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                          backgroundColor: MaterialStateProperty.all(Colors.black),
                          foregroundColor: MaterialStateProperty.all(Colors.yellow),
                        ),
                        child: Text('Save', style: TextStyle(fontSize: 16),),
                        onPressed: (){
                          errorManager.cleanSubmitFlags();
                          if(_titleController.text.isNotEmpty && _descriptionController.text.isNotEmpty
                            && _dateController.isAfter(DateTime.now())){
                            if(widget.bArchive){
                              index = data.unArchive(index);
                            }
                            data.updateTaskTitle(index, _titleController.text);
                            data.updateTaskDescription(index, _descriptionController.text);
                            data.updateDate(index, _dateController);
                            data.updateCategory(index, _categoryController);
                            //reset task case
                            if(data.taskList[index].bIsDone){
                              data.updateTaskState(index);
                            }
                            Navigator.pop(context);
                          }
                          else {
                            if(_titleController.text.isEmpty) {
                              errorManager.submitTitleErrorFlag();}
                            if(_descriptionController.text.isEmpty) {
                              errorManager.submitDescriptionErrorFlag();}
                            if(_dateController.isBefore(DateTime.now())){
                              errorManager.submitDateErrorFlag();}
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
    );
  }

  List<DropdownMenuItem> getCategoryMenuItems(categoryList){
    List<DropdownMenuItem> menuList = [];
    for(var i=0; i<categoryList.length; i++){
      menuList.add(
        DropdownMenuItem(
          value: categoryList[i],
          child: Text(categoryList[i]),
        ),
      );
    }
    return menuList;
  }
}