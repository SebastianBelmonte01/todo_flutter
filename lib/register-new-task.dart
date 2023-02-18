import 'package:flutter/material.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; // for other locales


const List<String> list = <String>['jidwqjoidowjiewojew', 'Two', 'Three', 'Four'];

class MyRegistrationTask extends StatefulWidget {  
  const MyRegistrationTask({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<MyRegistrationTask> createState() => _MyRegistrationTaskState();
}

class _MyRegistrationTaskState extends State<MyRegistrationTask> with RestorationMixin {
  String dropdownValue = list.first;
  String _dueDate = "";
  @override
  // TODO: implement restorationId
  String? get restorationId => widget.restorationId;
  
  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // TODO: implement restoreState
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
     _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }
  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture = RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
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
     _selectedDate.value = newSelectedDate;
      setState(() {
        _dueDate = "${_selectedDate.value.day} / ${_selectedDate.value.month} / ${_selectedDate.value.year}" ;
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
    return  Padding(
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
                  _dueDate==""? "Sleccione la fecha de Entrega: " : "Fecha de Entrega:  $_dueDate" ,
                  style: const TextStyle(fontFamily: "Roboto", fontSize: 15, fontWeight: FontWeight.w800),
                ),
              ),
              ElevatedButton(
                onPressed: (){_restorableDatePickerRouteFuture.present(); print(_selectedDate.value.day);}, 
                child: const Icon(Icons.calendar_month)
              ),
            ],
          ),
          const Text("Seleccione una Etiqueta:   ",
              style: TextStyle(fontFamily: "Roboto", fontSize: 15, fontWeight: FontWeight.w800),),
          Row(
            children: [
              DropdownButton(
                value: dropdownValue, 
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),   
              ),
              const SizedBox(
                width: 30,
              ),
              ElevatedButton(
                onPressed: (){_restorableDatePickerRouteFuture.present(); print(_selectedDate.value.day);}, 
                child: const Icon(Icons.edit)
              ),
            ],
          ),
          Center(
            child: Column(
              children: [
                ElevatedButton(onPressed: (){}, child: Text("Guardar")),
                ElevatedButton(onPressed: (){}, child: Text("Cancelar"))
              ],
            ),
          )
          
        ],
      ),
    );
  }

}