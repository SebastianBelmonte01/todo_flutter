import 'package:flutter/material.dart';
import 'package:todo_flutter/classes/Task.dart';
import 'package:todo_flutter/register-new-task.dart';

import 'package:intl/intl.dart';
class MyListView extends StatefulWidget {
  MyListView({super.key, required this.myList});
  List<Task> myList;
  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: widget.myList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black45
        ) 
      ),
      child: ListTile(
        title: Text(widget.myList[index].title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text('${DateFormat('dd-MM-yyyy').format(widget.myList[index].dueDate)} \nEtiqueta: ${widget.myList[index].label}'),
        trailing : Icon(
          widget.myList[index].completed ? Icons.done : Icons.close,
          color: widget.myList[index].completed ? Color.fromARGB(255, 22, 174, 14) : Color.fromARGB(255, 193, 16, 16),
        ), 
        isThreeLine: true,
        onLongPress: () {
          setState(() {
            widget.myList[index].completed?widget.myList[index].completed = false: widget.myList[index].completed = true;
          });

        },
      ),
    );
      },
    );
  }

}