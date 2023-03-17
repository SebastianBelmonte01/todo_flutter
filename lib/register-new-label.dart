import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/components/my-label.dart';
import 'package:todo_flutter/providers/label-provider.dart';
import 'package:todo_flutter/register-new-task.dart';

import 'bloc/cubit/label/label_list_cubit.dart';
import 'classes/Label.dart';
import 'components/my-label-view.dart';


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
              onPressed: (){
                setState(() {
                  //context.read<LabelList>().addLabel(Label("", true));
                });
              }, 
              child: Text("Añadir")),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  // context.read<LabelList>().updateLabels(auxList);
                  // context.read<LabelList>().setLabelList(auxList);
                  // context.read<LabelList>().removeLabel(auxList);
                  Navigator.pop(context);
                });
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