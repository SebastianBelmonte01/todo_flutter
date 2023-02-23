import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/components/my-label.dart';
import 'package:todo_flutter/providers/label-provider.dart';

import 'classes/Label.dart';
import 'components/my-label-list.dart';

class MyNewLabel extends StatefulWidget {
  const MyNewLabel({super.key});

  @override
  State<MyNewLabel> createState() => _MyNewLabelState();
}

class _MyNewLabelState extends State<MyNewLabel> {
  final labelController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    labelController.clear();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<Label> auxList = [...context.read<LabelList>().labelList];

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
            context.read<LabelList>().removeTemp(auxList);
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
              child: MyLabelList(myLabelList: auxList),
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  //TODO PARA MODIFFICCAR UNA ETIQUETA SE DEBE MODIFICAR DESDE EL WIDHGET HIJO
                  context.read<LabelList>().addLabel(Label("", true));
                  print("MI NUEVO TAMAÑO DE ETIQUETA ES DE ${auxList.length}");
                });
              }, 
              child: Text("Añadir")),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  // show all the labels in auxList
                  for(int i = 0; i < auxList.length; i++){
                    print("Etiqueta ${i+1}: ${auxList[i].info}");
                  }
                  // guardar
                  context.read<LabelList>().setLabelList(auxList);
                });
              },
              child: Text("Guardar")),
            ElevatedButton(onPressed: (){}, child: Text("Cerrar")),
          ],
        ),
      ),
    );
  }
}