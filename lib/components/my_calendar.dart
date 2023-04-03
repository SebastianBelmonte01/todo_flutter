import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/datepicker/datepicker_cubit.dart';
import 'my_icon_button.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key, this.restorationId});
  final String? restorationId;

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> with RestorationMixin {

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
    final datedPicked = context.watch<DatepickerCubit>().state;
    
    if (newSelectedDate != null){
      context.read<DatepickerCubit>().updateDatedPicked(newSelectedDate);
      setState(() {
        //_TODO dueDate debe encontrarse en el estado del widget padre.
        //_dueDate = "${selectedDate.value.day} / ${selectedDate.value.month} / ${selectedDate.value.year}" ;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return MyIconButton(
        icon: const Icon(Icons.calendar_month), 
        onPressed: () { 
          _restorableDatePickerRouteFuture.present();
        },
    );
  }


}
