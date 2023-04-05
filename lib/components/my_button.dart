import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const MyButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed(); 
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(100, 45),
        primary: Color(0xFF0D47A1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(
              text, 
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255)
              ),
            ),

    );
  }
}