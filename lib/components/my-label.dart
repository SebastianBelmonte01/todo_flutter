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
                      widget.label.info = value;
                    },
                    decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Etiqueta',
                        ),
                  ), 
                ),
                ElevatedButton(
                  onPressed: (){
                      context.read<LabelList>().removeLabel(widget.index);
                      print("TEXTO ${widget.label.getInfo}");
                      print("ELIMINACION MI NUEVO TAMAÑO DE ETIQUETA ES DE ${context.read<LabelList>().size}");
                  }, 
                  child: const Icon(Icons.delete)
                ),
            ]
        );
  }
}