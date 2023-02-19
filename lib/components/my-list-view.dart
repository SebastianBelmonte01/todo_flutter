import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
          children: [
           _tile('Hacer la Práctica', '24/02/2023 \nEtiqueta ', Icons.theaters),
           _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
          ],
    );
  }
  
  Container _tile(String title, String subtitle, IconData icon) {
    return  Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black45
        ) 
      ),
      child: ListTile(
        title: Text(title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text(subtitle),
        trailing : Icon(
          icon,
          color: Colors.blue[500],
        ), 
        isThreeLine: true,
        onLongPress: () {
          print("Completado");
        },
      ),
    );
    
  }
}