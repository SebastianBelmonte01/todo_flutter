import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/pages/register_new_task.dart';

import '../bloc/cubit/label/label_list_cubit.dart';
import '../classes/Label.dart';
import '../components/my_button.dart';
import '../components/my_label_view.dart';


class MyNewLabel extends StatelessWidget {
  const MyNewLabel({super.key});

  @override
  Widget build(BuildContext context) {
    //LabelListCubit labelListCubit = context.read<LabelListCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Administrador de Etiquetas",
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w900, fontSize: 20
          )
        ),
        backgroundColor: Colors.blue[900],
        leading: BackButton(
          onPressed: (){
            //context.read<LabelList>().removeTemp(auxList);
            Navigator.pop(context);
          },
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("Etiquetas", style: TextStyle(fontFamily: "Roboto", fontSize: 15, fontWeight: FontWeight.w800),),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: MyLabelList()
            ),
            MyButton(
              onPressed: (){
                BlocProvider.of<LabelListCubit>(context).addTemporalLabel();
              },
              text: "Añadir", 
            ),
            MyButton(
              onPressed: (){
                BlocProvider.of<LabelListCubit>(context).updateLabelList();
                Navigator.pop(context);
              },
              text: "Guardar"
            ),
            MyButton(
              onPressed: (){
                Navigator.pop(context);
              },
              text: "Cerrar"
            ),
          ],
        ),
      ),
    );
  }
}