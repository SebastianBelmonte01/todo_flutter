import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/label/label_list_cubit.dart';
import '../classes/Label.dart';

String dropdownValue = "";

class MyDropDown extends StatefulWidget {
  const MyDropDown({super.key});

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LabelListCubit, LabelListState>(
      listener: (context, state){},
      builder: (context, state){
        if(dropdownValue == ""){
          dropdownValue = state.listOfLabels[0].info;
          print("VALOR DE DROP $dropdownValue");
        } 
        return DropdownButton(
          value: dropdownValue,
          items: state.listOfLabels.map<DropdownMenuItem<String>>((Label value) {
            return DropdownMenuItem<String>(
              value: value.info,
              child: Text(value.info),
            );
          }).toList(),
          //FIXME : Having the same trouble as in the list of tasks
          onChanged: (String? value) {
            setState(() {
                dropdownValue = value!;
                print(dropdownValue);
            });
          },
        );
      },
    );
  }
}