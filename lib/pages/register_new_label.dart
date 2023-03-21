import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/pages/register_new_task.dart';

import '../bloc/cubit/label/label_list_cubit.dart';
import '../classes/Label.dart';
import '../components/my_button.dart';
import '../components/my_label_view.dart';


class MyNewLabel extends StatefulWidget {
  const MyNewLabel({super.key});

  @override
  State<MyNewLabel> createState() => _MyNewLabelState();
}

class _MyNewLabelState extends State<MyNewLabel> {
  final labelController = TextEditingController();
  @override
  void dispose() {
    labelController.clear();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    LabelListCubit labelListCubit = context.read<LabelListCubit>();

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
            const Text("Etiquetas", style: const TextStyle(fontFamily: "Roboto", fontSize: 15, fontWeight: FontWeight.w800),),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              //Here we need to call the list of labels
              child: MyLabelList()
            ),
            MyButton(
              onPressed: (){
                labelListCubit.addTemporalLabel();
              },
              text: "Añadir", 
            ),
            MyButton(
              onPressed: (){
                labelListCubit.updateLabelList();
              },
              text: "Guardar"
            ),
            MyButton(
              onPressed: (){
                // context.read<LabelList>().setLabelList(auxList);
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