
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_flutter/bloc/cubit/label/label_list_cubit.dart';
import 'package:todo_flutter/bloc/cubit/pages/label_repository/label_repository_cubit.dart';
import 'package:todo_flutter/bloc/cubit/pages/task_repository/task_repository_cubit.dart';
import 'package:todo_flutter/classes/Task.dart';
import 'package:todo_flutter/components/my_dropdown.dart';
import 'package:todo_flutter/components/my_label_view.dart';
import 'package:todo_flutter/components/my_textfield.dart';
import 'package:todo_flutter/pages/register_new_label.dart';

import 'package:todo_flutter/pages/register_new_task.dart';
import 'package:todo_flutter/pages/todo.dart';

import '../bloc/cubit/pages/page_status.dart';
import '../bloc/cubit/todo/todo_list_cubit.dart';
import '../classes/Label.dart';
import '../components/my_button.dart';
import '../components/my_icon_button.dart';
import 'error.dart';


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
    String selectedLabel = context.watch<LabelRepositoryCubit>().state.labels[context.watch<LabelRepositoryCubit>().state.selectedLabelIndex].info!;
    
    return Scaffold(
      appBar: AppBar(title: const Text("Añadir Tarea", style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w900, fontSize: 30)), backgroundColor: Colors.blue[900],),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          children: [
            MyTextfield(
              myTextfieldController: taskNameController, 
              hintText: "Nombre de la Tarea",
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
                MyIconButton(
                  onPressed: (){
                    _restorableDatePickerRouteFuture.present();
                  }, 
                  icon: const Icon(Icons.calendar_month)
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                    height: 20,
                ),
                const Text("Seleccione una Etiqueta:   ",
                    style: TextStyle(fontFamily: "Roboto", fontSize: 15, fontWeight: FontWeight.w800),),
                const SizedBox(
                    height: 7,
                ), 
                Row(
                  children: [
                    const MyDropDown(),
                    const SizedBox(
                      width: 30,
                    ),
                    MyIconButton(
                      onPressed: () {
                      BlocProvider.of<LabelRepositoryCubit>(context).getLabels();
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(builder: (BuildContext context) => const MyNewLabelScreen()),
                        );
                      }, 
                      icon: const Icon(Icons.edit)
                    ),
                  ],
                ),
              ]
            ),
            Column(
              children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  MyButton(
                    onPressed: (){
                      print("INfo");
                      print(taskNameController.text);
                      print("Fecha");
                      print(selectedDate.value);
                      print("Selected Label");
                      print(selectedLabel);
                      Task newTask = Task(null, taskNameController.text, selectedDate.value, selectedLabel, null, null);
                      BlocProvider.of<TaskRepository>(context).createNewTask(newTask);
                      Navigator.pop(context);
                    }, text: "Guardar"
                  ),
                  MyButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    text: "Cancelar"
                  ),
                
              ]
            )
          ],
        ),
      )
    );
  }
}



class MyTaskScreen extends StatelessWidget {
  const MyTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LabelRepositoryCubit, LabelRepositoryState>(
      builder: (context, state) {
        if(state.status == PageStatus.loading) {
          print("loading");
          return const MyLoadingLabelList();
        } else if (state.status == PageStatus.success) {
          print("success");
          return const MyRegistrationTask();
        } else {
          return const MyError();
        }
      },
    );
  }
}

