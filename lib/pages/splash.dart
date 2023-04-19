import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  void initState(){
    super.initState();
    _myHomePage();
  }

  void _myHomePage() async {
    await Future.delayed(const Duration(milliseconds: 10000));
    Navigator.pushReplacementNamed(context, "/login");  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/checklist.png'),
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("My Todo", style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w900, fontSize: 30),),
          ]
        ),
      )
    );
  }
}