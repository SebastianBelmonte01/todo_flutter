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
        return BlocBuilder<LabelListCubit,LabelListState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.listOfLabels.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                          children: <Widget> [
                            Expanded(
                              child: TextFormField(
                                initialValue: state.listOfLabels[index].info,
                                onChanged: (value){
                                  //labelListCubit.updateLabel(index, value);
                                  BlocProvider.of<LabelListCubit>(context).updateLabel(index, value);
                                },
                                decoration: const InputDecoration(
                                  enabledBorder:  OutlineInputBorder(
                                    borderSide:  BorderSide(
                                      color: Colors.grey, 
                                      width: 0.0
                                    ),
                                  ),
                                  border: OutlineInputBorder(),  
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:  BorderSide(
                                      color: Color(0xFFCFCFCF), 
                                      width: 2
                                    ),
                                  ),
                                  hintText: 'Etiqueta',
                                ),
                              ), 
                            ),
                            MyIconButton(
                              onPressed: (){
                                //labelListCubit.removeLabelTemporaly(index);
                                BlocProvider.of<LabelListCubit>(context).removeLabelTemporaly(index);
                              }, 
                              icon: const Icon(Icons.delete)
                            ),
                        ]
                    )
                );
              }
            );
            
          },
        );
    }
    
  }
  

