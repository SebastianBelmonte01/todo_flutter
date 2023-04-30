import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/components/my_button.dart';
import 'package:todo_flutter/pages/login.dart';

import '../bloc/cubit/pages/login_page/login_cubit.dart';

class MyError extends StatelessWidget {
  const MyError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Error", style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w900, fontSize: 30)), backgroundColor: Color.fromARGB(255, 193, 16, 16),),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/computer.png'),
            width: 200,
            height: 200,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Ha ocurrido un error", style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w900, fontSize: 30),),
          MyButton(
            onPressed: () {
              BlocProvider.of<LoginCubit>(context).chageStateToInitial();
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyLogin()));

            }, 
            text: "Volver al login"
          )
  
        ]
      ),
      )
    );
  }
}