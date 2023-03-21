import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;
  const MyIconButton({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed(); 
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(50, 30),
        primary: Color(0xFF0D47A1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          
        ),
        
      ),
      child: icon,

    );
  }
}