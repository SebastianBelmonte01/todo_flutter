import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/label/label_list_cubit.dart';
import '../classes/Label.dart';
import 'my_icon_button.dart';

class MyLabelList extends StatefulWidget {
  MyLabelList({super.key});

  @override
  State<MyLabelList> createState() => _MyLabelListState();
}

class _MyLabelListState extends State<MyLabelList> {
  @override
  Widget build(BuildContext context) {
        LabelListCubit labelListCubit = context.read<LabelListCubit>();
        return BlocBuilder<LabelListCubit,LabelListState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.listOfLabels.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                    children: <Widget> [
                      Expanded(
                        child: TextFormField(
                          initialValue: state.listOfLabels[index].info,
                          onChanged: (value){
                            labelListCubit.updateLabel(index, value);
                          },
                          decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Etiqueta',
                              ),
                        ), 
                      ),
                      MyIconButton(
                        onPressed: (){
                          labelListCubit.removeLabelTemporaly(index);
                        }, 
                        icon: const Icon(Icons.delete)
                      ),
                  ]
                );
              }
            );
            
          },
        );
    }
    
  }
  

