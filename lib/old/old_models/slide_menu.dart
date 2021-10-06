import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideMenu extends StatelessWidget {
  final List<String> sideMenuItem = [
    'MyTasks',
    'Archived',
    'Alerts',
    'Contact',
    'Donate',
    'About'
  ];

  final int selectedMenuItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 3,
      child: Material(
        color: Colors.yellow,
        child: ListView(
          children: [
            Container(
              height: 200,
              color: Color(0xff211825),
              child: DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.yellow,
                      foregroundColor: Color(0xff211825),
                      radius: 42,
                      child: Builder(
                        builder: (context) {
                          return IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.list, size: 38),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 12),
                    Padding(
                      padding: const EdgeInsets.only(top:8),
                      child: Text(
                        'TaskMe',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          letterSpacing: 1
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            buildMenuItem(
              text: 'MyTasks',
              icon: Icons.event_note,
              callback:(){
                Future.delayed(
                  Duration(milliseconds: 500),
                  (){Navigator.of(context).popAndPushNamed('/');}
                );
              },
            ),
            buildMenuItem(
              text: 'Archived',
              icon: Icons.archive_outlined,
              callback:(){
                Future.delayed(
                  Duration(milliseconds: 500),
                  (){Navigator.of(context).popAndPushNamed('/archive');}
                );
              },
            ),
            buildMenuItem(
              text: 'Alerts',
              icon: Icons.alarm,
              callback:(){
                Future.delayed(
                  Duration(milliseconds: 500),
                  (){Navigator.of(context).popAndPushNamed('/alerts');}
                );
              },
            ),
            buildMenuItem(
              text: 'Donate',
              icon: Icons.emoji_food_beverage_outlined,
              callback:(){
                Future.delayed(
                  Duration(milliseconds: 500),
                  (){Navigator.of(context).popAndPushNamed('/donate');}
                );
              },
            ),
            buildMenuItem(
              text: 'About',
              icon: Icons.info_outline,
              callback:(){
                Future.delayed(
                  Duration(milliseconds: 500),
                  (){Navigator.of(context).popAndPushNamed('/about');}
                );
              },
            ),
            buildMenuItem(
              text: 'Contact',
              icon: Icons.mail_outline,
              callback:(){
                Future.delayed(
                  Duration(milliseconds: 500),
                  (){Navigator.of(context).popAndPushNamed('/contact');}
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({@required text, @required icon, @required callback}){
    return InkWell(
      splashColor: Color(0xff211825),
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 45),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
          leading: Icon(
            icon,
            size: 34,
            color: Color(0xff211825),
          ),
        ),
      ),
    );
  }
}
