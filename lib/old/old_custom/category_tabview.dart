import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/data_provider.dart';


class CategoryTabBar extends StatefulWidget{
  final controller;
  CategoryTabBar({this.controller});
  @override
  _CategoryTabBar createState() => _CategoryTabBar();
}

class _CategoryTabBar extends State<CategoryTabBar> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, data, child) {
        return TabBar(
          controller: widget.controller,
          isScrollable: true,
          indicatorColor: Color.alphaBlend(Colors.indigoAccent, Colors.white).withGreen(160).withOpacity(0.6),
          tabs: data.filterMap.values.toList().map<Tab>((category) {
            return Tab(
              child: Text(
                category,
                style: TextStyle(
                  color: (data.filterMap[widget.controller.index]==category)?
                  Color.alphaBlend(Colors.indigoAccent, Colors.white).withGreen(160).withOpacity(0.6):
                  Color.alphaBlend(Colors.indigoAccent, Colors.white).withGreen(160).withOpacity(0.45),
                  fontWeight: (data.filterMap[widget.controller.index]==category)?
                  FontWeight.bold: FontWeight.normal,
                  fontSize: (data.filterMap[widget.controller.index]==category)? 14: 12,
                ),
              ),
            );
          }).toList(),

          onTap: (index){
            setState(() { });
          },
        );
      }
    );
  }
}