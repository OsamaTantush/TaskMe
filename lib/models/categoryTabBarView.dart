import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskme/Providers/taskManager.dart';
import 'package:taskme/kconst.dart';
import 'package:taskme/models/taskView.dart';

class CategoryTabBarView extends StatefulWidget{
  @override
  _CategoryTabBarView createState() => _CategoryTabBarView();
}

class _CategoryTabBarView extends State<CategoryTabBarView> with SingleTickerProviderStateMixin{
  TabController tabController;
  Map<int, String> tabMap;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<String> categoryList = Provider.of<TaskManager>(context, listen: false).categoryList;
    tabController = TabController(length: categoryList.length+1, vsync: this);
    tabMap = {};
    for(int i=0; i<categoryList.length+1; i++){
      if(i==0){tabMap[i] = 'All';}
      else{tabMap[i] = categoryList[i-1];}
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        header(),
        SizedBox(height: 8),
        Expanded(
          child: content(),
        ),
      ],
    );
  }

  Widget header(){
    return TabBar(
      controller: tabController,
      isScrollable: true,
      indicatorColor: kBAccentG160.withOpacity(0.6),
      tabs: tabMap.values.map<Tab>((filter) =>
        Tab(
          child: Text(
            filter,
            style: TextStyle(
              color: (tabMap[tabController.index]==filter)? kBAccentG160.withOpacity(0.6):kBAccentG160.withOpacity(0.48),
              fontWeight: (tabMap[tabController.index]==filter)? FontWeight.bold: FontWeight.normal,
              fontSize: (tabMap[tabController.index]==filter)? 14:12,
            ),
          ),
        ),
      ).toList(),
      onTap: (index){ setState(() { }); },
    );
  }

  Widget content(){
    return TabBarView(
      controller: tabController,
      children: tabMap.values.map<TaskView>((filter) =>
        TaskView(filter: filter),
      ).toList(),
    );
  }

}