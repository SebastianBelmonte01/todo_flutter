import 'package:flutter/material.dart';

class MyTextfield extends StatefulWidget {
  final TextEditingController myTextfieldController;
  final String hintText;
  const MyTextfield({super.key, required this.myTextfieldController, required this.hintText});

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.myTextfieldController,
      obscureText: widget.hintText == "Contraseña" ? true : false,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: widget.hintText,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFCFCFCF),
              width: 2,
          )
        ),
      )
    );
  }
}