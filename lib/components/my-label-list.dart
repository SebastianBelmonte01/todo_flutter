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
    return ListView.builder(
      itemCount: widget.myLabelList.length,
      itemBuilder: (context, index) => MyLabel(
        label: widget.myLabelList[index],
        index: index,
      )
    );
  }
}
