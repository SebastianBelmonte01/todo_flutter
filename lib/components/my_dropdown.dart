import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/bloc/cubit/pages/label_repository/label_repository_cubit.dart';

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
    return BlocBuilder<LabelRepositoryCubit, LabelRepositoryState>(
      builder: (context, state){
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: 
            DropdownButton(
              //Make the size of the dropdown button the same as the textfiel
              isExpanded: true,
              value: state.labels[state.selectedLabelIndex].info,
              items: state.labels.map<DropdownMenuItem<String>>((Label value) {
                return DropdownMenuItem<String>(
                  value: value.info,
                  child: Text(value.info!),
                );
              }).toList(),
              onChanged: (String? selectedLabel) {
                BlocProvider.of<LabelRepositoryCubit>(context).updateSelectedLabel(selectedLabel!);
              }
            )
        );
      },
    );
  }
}