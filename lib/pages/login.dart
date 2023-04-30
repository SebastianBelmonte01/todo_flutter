import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todo_flutter/bloc/cubit/pages/login_page/login_cubit.dart';
import 'package:todo_flutter/components/my_list_view.dart';
import 'package:todo_flutter/components/my_textfield.dart';
import 'package:todo_flutter/pages/error.dart';
import 'package:todo_flutter/pages/register_new_task.dart';
import 'package:todo_flutter/pages/todo.dart';

import '../bloc/cubit/pages/login_page/login_state.dart';
import '../components/my_button.dart';


class MyCredentials extends StatefulWidget {
  const MyCredentials({super.key});

  @override
  State<MyCredentials> createState() => _MyCredentialsState();
}

class _MyCredentialsState extends State<MyCredentials> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void eraseCredentials() {
    usernameController.clear();
    passwordController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Login", style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w900, fontSize: 30)), backgroundColor: const Color(0xFF0D47A1),),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/user-calendar.png'), ),
            SizedBox(
              width: 300,
              child: MyTextfield(
                myTextfieldController: usernameController, 
                hintText: "Usuario",
              )
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: MyTextfield(
                myTextfieldController: passwordController,
                hintText: "Contraseña"
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MyButton(
              onPressed: () {  
                BlocProvider.of<LoginCubit>(context).login(usernameController.text, passwordController.text);
              }, 
              text: 'Enviar',
            ),
          ],
        )
    );
  }
}



class MyLogin extends StatelessWidget {
  const MyLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Container(
          child: state.status == LoginStatus.initial
                ? const MyCredentials() //We need to create a Loading for MyCredentials
                : state.status == LoginStatus.loading
                    ? const LoadingMyToDo()
                    : state.status == LoginStatus.success
                        ? const MyTodoScreen() //TODO need to change List view to the backend
                        : const MyError(),
            );
          }
        );
  }
}

