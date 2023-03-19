import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/pages/register-new-task.dart';

import '../bloc/cubit/label/label_list_cubit.dart';
import '../classes/Label.dart';
import '../components/my-label-view.dart';


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
            
            ElevatedButton(
              //We have to add a new label to the list this shold be like Label("", true)
              onPressed: (){
                labelListCubit.addTemporalLabel();
              }, 
              child: Text("Añadir")),
            ElevatedButton(
              onPressed: (){
                labelListCubit.updateLabelList();
              },
              child: Text("Guardar")),
            ElevatedButton(
              onPressed: (){
                // context.read<LabelList>().setLabelList(auxList);
                Navigator.pop(context);
              },
              child: Text("Cerrar")),
          ],
        ),
      ),
    );
  }
}