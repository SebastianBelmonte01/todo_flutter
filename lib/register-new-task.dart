import 'package:flutter/material.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; // for other locales

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
      padding: const EdgeInsets.all(20),
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
          // const SizedBox(
          //   height: 20,
          // ),
          Row(
            mainAxisSize: ,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  _dueDate==""? "Sleccione la fecha de Entrega" : _dueDate
                ),
              ),
              ElevatedButton(
                onPressed: (){_restorableDatePickerRouteFuture.present(); print(_selectedDate.value.day);}, 
                child: const Icon(Icons.calendar_month)
              ),
            ],
          ),
        ],
      ),
    );
  }

}