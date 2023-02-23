import 'package:flutter/material.dart';

import '../classes/Label.dart';
import 'my-label.dart';

class MyLabelList extends StatefulWidget {
  List<Label> myLabelList;
  MyLabelList({super.key, required this.myLabelList });

  @override
  State<MyLabelList> createState() => _MyLabelListState();
}

class _MyLabelListState extends State<MyLabelList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: generateMyLabelList(widget.myLabelList),
    );
  }
}

List<MyLabel> generateMyLabelList (List<Label> myLabelList) {
  List<MyLabel> myLabelListWidget = [];
  for(var label in myLabelList){
    myLabelListWidget.add(MyLabel(label: label,));
  }
  return myLabelListWidget;
}