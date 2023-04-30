import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todo_flutter/bloc/cubit/pages/label_repository/label_repository_cubit.dart';
import 'package:todo_flutter/bloc/cubit/pages/page_status.dart';

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
        return BlocBuilder<LabelRepositoryCubit,LabelRepositoryState>(
          builder: (context, state) {
            print("Nuevas Labels?");
            print(state.labels.length);

            return ListView.builder(
              itemCount: state.labels.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                          children: <Widget> [
                            Expanded(
                              child: TextFormField(
                                initialValue: state.labels[index].info,
                                onChanged: (value){
                                  //labelListCubit.updateLabel(index, value);
                                  BlocProvider.of<LabelRepositoryCubit>(context).updateLabel(index, value);
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
                                BlocProvider.of<LabelRepositoryCubit>(context).removeLabelTemporaly(index);
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

  class MyLoadingLabelList extends StatelessWidget {
  const MyLoadingLabelList({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!, 
      child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, __) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                          children: <Widget> [
                            Expanded(
                              child: Container(
                                height: 50,
                                color: Colors.white
                              ,
                              ) 
                            ),
                            MyIconButton(
                              onPressed: (){
                              }, 
                              icon: const Icon(Icons.delete)
                            ),
                        ]
                    )
                );
              }
            )
    );
  }
}
  

