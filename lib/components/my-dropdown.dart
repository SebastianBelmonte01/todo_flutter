import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/bloc/cubit/dropdown/dropdowncubit_cubit.dart';

import '../bloc/cubit/label/label_list_cubit.dart';
import '../classes/Label.dart';


class MyDropDown extends StatefulWidget {
  const MyDropDown({super.key});

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {

  @override
  Widget build(BuildContext context) {
    final labelListCubit = context.watch<LabelListCubit>().state;

    return BlocBuilder<DropdownCubit, DropdownCubitState>(
      builder: (context, state){
        if(state.dropdownValue == ""){
          state.dropdownValue = labelListCubit.listOfLabels[0].info;
        } 
        return DropdownButton(
          value: state.dropdownValue,
          items: labelListCubit.listOfLabels.map<DropdownMenuItem<String>>((Label value) {
            return DropdownMenuItem<String>(
              value: value.info,
              child: Text(value.info),
            );
          }).toList(),
          onChanged: (String? value) {
            context.read<DropdownCubit>().updateDropdownValue(value!);
          },
        );
      },
    );
  }
}