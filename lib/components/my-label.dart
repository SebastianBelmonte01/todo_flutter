import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../classes/Label.dart';
import '../providers/label-provider.dart';

class MyLabel extends StatefulWidget {
  Label label;
  int index;
  MyLabel({super.key, required this.label, required this.index});
  @override
  State<MyLabel> createState() => _MyLabelState();
}

class _MyLabelState extends State<MyLabel> {

  final labelController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    labelController.text = widget.label.getInfo;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    labelController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
              children: <Widget> [
                Expanded(
                  child: TextFormField(
                    initialValue: widget.label.info,
                    onChanged: (value){
                      //SE DEBE GUARDAR EN UNA VARIABLE EL CAMBIO PERO SE DEBE ACTAULIZAR 
                      widget.label.isModified = true;
                      widget.label.newInfo = value;

                    },
                    decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Etiqueta',
                        ),
                  ), 
                ),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      context.read<LabelList>().labelList[widget.index].isRemoved = true;
                    });
                    for(int i = 0; i < context.read<LabelList>().labelList.length; i++){
                      print("Etiqueta ${i+1}: ${context.read<LabelList>().labelList[i].getInfo}");
                    }
                  }, 
                  child: const Icon(Icons.delete)
                ),
            ]
        );
  }
}