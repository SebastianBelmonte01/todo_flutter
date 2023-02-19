import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Administrador de Etiquetas", style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w900, fontSize: 20)), backgroundColor: Colors.blue[900],),
      body: Column(
        children: [
          const Text("Etiquetas", style: const TextStyle(fontFamily: "Roboto", fontSize: 15, fontWeight: FontWeight.w800),),
                
          Row(
              children: <Widget> [
                Expanded(
                  child: TextField(
                    controller: labelController,
                    decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Etiqueta',
                        ),
                  ), 
                ),
                ElevatedButton(
                  onPressed: (){}, 
                  child: const Icon(Icons.delete)
                ),
            ]
          ),
        ],
      ),
    );
    
  }
}