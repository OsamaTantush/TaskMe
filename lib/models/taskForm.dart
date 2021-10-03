import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taskme/Providers/taskManager.dart';
import 'package:taskme/kconst.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TaskForm extends StatefulWidget{
  @override
  _TaskForm createState() => _TaskForm();
}

class _TaskForm extends State<TaskForm>{
  Map<String, Map<String, dynamic>> controllerMap;

  Future<void> initController() async{
    //TODO Add AudioController
    controllerMap = {
      'title': {
        'textField': TextEditingController(),
        'bEmptyFlag': false,
      },
      'description' : {
        'textField': TextEditingController(),
        'bEmptyFlag': false,
      },
      'priority': {
        'rate': 1,
      },
      'category': {
        'text': Provider.of<TaskManager>(context, listen: false).categoryList[0],
      },
      'date' : {
        'dateTime': DateTime.now().add(Duration(days: 1)),
        'bPastDateFlag': false,
      }
    };
  }

  @override
  void initState(){
    initController();
    super.initState();
  }

  void resetErrorFlags(){
    controllerMap['title']['bEmptyFlag'] = false;
    controllerMap['description']['bEmptyFlag'] = false;
    controllerMap['date']['bPastDateFlag'] = false;
  }

  @override
  Widget build(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height*0.688,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: formData(),
    );
  }

  Widget formData(){
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Add new task _',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kDarkBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 32),
            IconButton(
              iconSize: 52,
              icon: Icon(
                Icons.add_circle_outlined,
                size: 52,
                color: kBAccentG160,
              ),
              onPressed: () async{
                resetErrorFlags();
                await Future.delayed(Duration(milliseconds: 500), (){
                  if( !controllerMap['title']['textField'].text.isEmpty &&
                      !controllerMap['description']['textField'].text.isEmpty &&
                      controllerMap['date']['dateTime'].isBefore(DateTime.now().add(Duration(minutes: 1)))
                    ){
                      Provider.of<TaskManager>(context, listen: false).createNewTask(
                          title: controllerMap['title']['textField'].text,
                          description: controllerMap['description']['textField'].text,
                          priority: controllerMap['priority']['rate'],
                          category: controllerMap['category']['text'],
                          date: controllerMap['date']['dateTime']
                      );
                  }
                  else{
                    setState(() {
                      if(controllerMap['title']['textField'].text.isEmpty){controllerMap['title']['bEmptyFlag']=true;}
                      if(controllerMap['description']['textField'].text.isEmpty){controllerMap['description']['bEmptyFlag']=true;}
                      if(controllerMap['date']['dateTime'].isBefore(DateTime.now().add(Duration(minutes:1)))){controllerMap['date']['bPastDateFlag']=true;}
                    });
                  }
                });
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Column(
            children: [
              TextField(
                controller: controllerMap['title']['textField'],
                focusNode: controllerMap['title']['focusNode'],
                cursorColor: kBAccentG160,
                style: TextStyle(
                  color: kDarkBlue,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.alphaBlend(kDarkBlue.withOpacity(0.05),Colors.yellow.withOpacity(0.05)),
                  focusColor: kBAccentG160,
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    color: (!controllerMap['title']['bEmptyFlag'])? kBAccentG160:kDarkRed,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(color: kDarkBlue.withOpacity(0.8), width: 2),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(color: kBAccentG160, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Container(
                padding: EdgeInsets.only(bottom: 2, right: 4),
                alignment: Alignment.bottomRight,
                child: Text(
                  'use voice instead',
                  style: TextStyle(
                    color: kBAccentG160,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                  ),
                ),
              ),
              TextFormField(
                maxLines: 3,
                minLines: 3,
                maxLength: 180,
                controller: controllerMap['description']['textField'],
                focusNode: controllerMap['description']['focusNode'],
                cursorColor: kBAccentG160,
                style: TextStyle(
                  color: kDarkBlue,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.alphaBlend(kDarkBlue.withOpacity(0.05),Colors.yellow.withOpacity(0.05)),
                  focusColor: kBAccentG160,
                  labelText: 'Description',
                  labelStyle: TextStyle(
                    color: (!controllerMap['description']['bEmptyFlag'])? kBAccentG160:kDarkRed,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(color: kDarkBlue.withOpacity(0.8), width: 2),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(color: kBAccentG160, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.only(left:8, top:6, bottom:6 ,right:18),
                color: Color.alphaBlend(kDarkBlue.withOpacity(0.05),Colors.yellow.withOpacity(0.05)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Set Task Priority  ',
                      style: TextStyle(
                        color: kBAccentG160,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 20,),
                    RatingBar.builder(
                      itemPadding: EdgeInsets.zero,
                      glowColor: kBAccentG160,
                      unratedColor: kDarkBlue.withOpacity(0.6),
                      maxRating: 3,
                      minRating: 1,
                      itemCount: 3,
                      initialRating: 1,
                      itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.radio_button_checked, color: Colors.blue,
                        ),
                      ),
                      onRatingUpdate: (value){
                        setState(() {
                          controllerMap['priority']['rate'] = value;
                        });
                      },
                    ),
                    SizedBox(width: 18),
                    Text(
                      (controllerMap['priority']['rate']==1)? '(L)':
                      (controllerMap['priority']['rate']==2)? '(M)': '(H)',
                      style: TextStyle(
                        color: kDarkBlue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left:4, top: 6, right: 4, bottom: 10),
                      decoration: ShapeDecoration(
                        color: Color.alphaBlend(kDarkBlue.withOpacity(0.05),Colors.yellow.withOpacity(0.05)),
                        shape: UnderlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(color: kDarkBlue.withOpacity(0.8), width: 2),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Category',
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 11, color: kBAccentG160),
                          ),
                          Center(
                            child: DropdownButtonHideUnderline(
                              child: Consumer<TaskManager>(
                                builder: (context, taskManager, child) =>
                                  DropdownButton(
                                    iconEnabledColor: kDarkBlue,
                                    icon: Icon(FontAwesomeIcons.solidFolder, color:kBAccentG160),
                                    dropdownColor: kBAccentG160,
                                    isDense: true,
                                    value: controllerMap['category']['text'],
                                    items: taskManager.categoryList.map<DropdownMenuItem>((item) =>
                                      DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(item, style: TextStyle(color: kDarkBlue),),
                                      ),
                                    ).toList(),
                                    style: TextStyle(color: kDarkBlue),
                                    onChanged: (value){
                                      setState(() {
                                        controllerMap['category']['text'] = value;
                                      });
                                    },
                                  ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: DateTimeField(
                      initialDate: controllerMap['date']['dateTime'],
                      selectedDate: controllerMap['date']['dateTime'],
                      dateFormat: DateFormat('dd-MMM-yyyy'),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.alphaBlend(kDarkBlue.withOpacity(0.05),Colors.yellow.withOpacity(0.05)),
                        focusColor: kBAccentG160,
                        labelText: 'Select Date',
                        labelStyle: TextStyle(
                          color: (!controllerMap['date']['bPastDateFlag'])? kBAccentG160:kDarkRed,
                        ),
                        suffixIcon: Icon(Icons.calendar_today, color: kDarkBlue),
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(color: kDarkBlue.withOpacity(0.8), width: 2),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(color: kBAccentG160, width: 2),
                        ),
                      ),
                      onDateSelected: (date){
                        setState(() {
                          controllerMap['date']['dateTime'] = date;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
