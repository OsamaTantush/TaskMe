import 'package:flutter/material.dart';
import 'package:taskme/kconst.dart';
import 'package:taskme/models/categoryTabBarView.dart';
import 'package:taskme/models/taskForm.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: kBAccentG160,
      //drawer: SlideMenu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top+18, bottom:18, left:18, right:18,
            ),
            child: wHeader(),
          ),
          Expanded(
            child: wBody(),
          ),
        ],
      ),
      floatingActionButton: addActionButton(context),
    );
  }

  Widget wHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          radius: 48,
          child: Builder(
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(21),
                decoration: BoxDecoration(
                  color: kBAccentG160,
                  borderRadius: BorderRadius.circular(360),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.list, size: 48, color: kDarkBlue),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              );
            },
          ),
        ),
        SizedBox(height: 8),
        Text(
          'TaskMe',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kDarkBlue,
            fontSize: 32,
            fontFamily: 'Righteous-Regular',
          ),
        ),
      ],
    );
  }

  Widget wBody() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top:16, left:20, right:20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CategoryTabBarView(),
      ),
      // child: Column(
      //   children: [
      //     Padding(
      //       padding: EdgeInsets.only(left:8, right:8),
      //       child: CategoryTabBarView(),
      //       // child: CategoryTabBar(
      //       //   controller: tabController,
      //       // ),
      //     ),
      //     SizedBox(height: 20),
      //     // Expanded(
      //     //   child: TabBarView(
      //     //     controller: tabController,
      //     //     children: Provider.of<DataProvider>(context).filterMap.values.map<TaskViewScreen>((filter) {
      //     //       return TaskViewScreen(filter: filter);
      //     //     }).toList(),
      //     //   ),
      //     // ),
      //   ],
      // ),
    );
  }

  Widget addActionButton(context){
    return FloatingActionButton(
      backgroundColor: kDarkBlue,
      foregroundColor: kDarkWhite,
      elevation: 3,
      child: Icon(
        Icons.post_add_rounded,
        size: 30,
      ),
      onPressed: (){
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.white.withOpacity(0),
          context: context,
          builder: (context) {
            return TaskForm();
          },
        );
      },
    );
  }

}




