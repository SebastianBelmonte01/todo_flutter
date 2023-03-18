import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/label/label_list_cubit.dart';
import '../classes/Label.dart';

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
                      ElevatedButton(
                        onPressed: (){
                          labelListCubit.removeLabelTemporaly(index);
                          // setState(() {
                          //   //context.read<LabelList>().labelList[widget.index].isRemoved = true;
                          //   //print("INDICE SELECCIONADO ${context.read<LabelList>().labelList[widget.index].getInfo}");
                          // });
                        }, 
                        child: const Icon(Icons.delete)
                      ),
                  ]
                );
              }
            );
            
          },
        );
    }
    
  }

/*
ListView.builder(
      itemCount: widget.myLabelList.length,
      itemBuilder: (context, index) => MyLabel(
        label: widget.myLabelList[index],
        index: index,
      ),
    );
*/

