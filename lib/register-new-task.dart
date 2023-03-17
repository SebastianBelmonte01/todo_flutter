
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_flutter/classes/Task.dart';
import 'package:todo_flutter/components/my-dropdown.dart';
import 'package:todo_flutter/providers/label-provider.dart';
import 'package:todo_flutter/providers/task-provider.dart';
import 'package:todo_flutter/register-new-label.dart';

import 'package:todo_flutter/register-new-task.dart';
import 'package:todo_flutter/todo.dart';

import 'bloc/cubit/todo/todo_list_cubit.dart';
import 'classes/Label.dart'; // for other locales



  // List<String> list = contex.read<LabelList>().getLabelFromList();
  String dropdownValue = "";

class MyRegistrationTask extends StatefulWidget {  
  const MyRegistrationTask({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<MyRegistrationTask> createState() => _MyRegistrationTaskState();
}

class _MyRegistrationTaskState extends State<MyRegistrationTask> with RestorationMixin {


  String _dueDate = "";
  @override
  // TODO: implement restorationId
  String? get restorationId => widget.restorationId;
  
  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(selectedDate, 'selected_date');
    registerForRestoration(
    _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }
  final RestorableDateTime selectedDate = RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture = RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: selectedDate.value.millisecondsSinceEpoch,
      );
    }
  );

  static Route<DateTime> _datePickerRoute(
  BuildContext context,
  Object? arguments,) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime.now(),
          lastDate: DateTime(2029),
        );
      },
    );
  }

  void _selectDate(DateTime? newSelectedDate){
    if (newSelectedDate != null){
      selectedDate.value = newSelectedDate;
      setState(() {
        _dueDate = "${selectedDate.value.day} / ${selectedDate.value.month} / ${selectedDate.value.year}" ;
      });
    }
  }
  final taskNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    taskNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    //List<String> list = context.read<LabelList>().getLabelFromList();
    // if(dropdownValue == ""){
    //   dropdownValue = list.first;
    // } 
    return Scaffold(
      appBar: AppBar(title: const Text("Añadir Tarea", style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w900, fontSize: 30)), backgroundColor: Colors.blue[900],),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: taskNameController,
              decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre de la Tarea',
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 300,
                  child: Text(
                    _dueDate==""? "Seleccione la fecha de Entrega: " : "Fecha de Entrega:  $_dueDate" ,
                    style: const TextStyle(fontFamily: "Roboto", fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    _restorableDatePickerRouteFuture.present();
                    print(selectedDate.value.day);
                  }, 
                  child: const Icon(Icons.calendar_month)
                ),
              ],
            ),
            const Text("Seleccione una Etiqueta:   ",
                style: TextStyle(fontFamily: "Roboto", fontSize: 15, fontWeight: FontWeight.w800),),
            Row(
              children: [
                //Make a BlockBuilder using the LabelListCubit and a DropdownButton
                // BlocBuilder(builder:                
                // DropdownButton(
                //   value: dropdownValue, 
                //   onChanged: (String? value) {
                //     setState(() {
                //       dropdownValue = value!;
                //       print("Sleccionado: $value");
                //     });
                //   },
                //   items: list.map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),   
                // ),
                // ),
                
                //MyDropDown(),
                
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyNewLabel()),
                    );
                  }, 
                  child: const Icon(Icons.edit)
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Task newTask = Task(taskNameController.text, "dropdownValue", selectedDate.value);
                      context.read<TodoListCubit>().addTask(newTask);
                      Navigator.pushAndRemoveUntil<void>(
                        context,
                        MaterialPageRoute<void>(builder: (BuildContext context) => MyTodo()),
                        ModalRoute.withName('/'),
                      );
                    }, child: Text("Guardar")),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("Cancelar"))
                ],
              ),
            )
          ],
        ),
      )
    );
  }

}