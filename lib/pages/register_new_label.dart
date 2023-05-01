import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/bloc/cubit/pages/label_repository/label_repository_cubit.dart';
import 'package:todo_flutter/pages/error.dart';
import 'package:todo_flutter/pages/register_new_task.dart';

import '../bloc/cubit/label/label_list_cubit.dart';
import '../bloc/cubit/pages/page_status.dart';
import '../classes/Label.dart';
import '../components/my_button.dart';
import '../components/my_label_view.dart';


class MyNewLabel extends StatelessWidget {
  const MyNewLabel({super.key});

  @override
  Widget build(BuildContext context) {
    //LabelListCubit labelListCubit = context.read<LabelListCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Administrador de Etiquetas",
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w900, fontSize: 20
          )
        ),
        backgroundColor: Colors.blue[900],
        leading: BackButton(
          onPressed: (){
            //context.read<LabelList>().removeTemp(auxList);
            Navigator.pop(context);
          },
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("Etiquetas", style: TextStyle(fontFamily: "Roboto", fontSize: 15, fontWeight: FontWeight.w800),),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: MyLabelList()
            ),
            MyButton(
              onPressed: (){
                BlocProvider.of<LabelRepositoryCubit>(context).addTemporalLabel();
              },
              text: "Añadir",
            ),
            MyButton(
              onPressed: (){
                BlocProvider.of<LabelRepositoryCubit>(context).updateLabelList();
                // BlocProvider.of<LabelList>(context).addNewLabel();
                // Navigator.pop(context);
              },
              text: "Guardar"
            ),
            MyButton(
              onPressed: (){
                Navigator.pop(context);
              },
              text: "Cerrar"
            ),
          ],
        ),
      ),
    );
  }
}

class MyNewLabelLoading extends StatelessWidget {
  const MyNewLabelLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Administrador de Etiquetas",
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w900, fontSize: 20
          )
        ),
        backgroundColor: Colors.blue[900],
        leading: BackButton(
          onPressed: (){
            //context.read<LabelList>().removeTemp(auxList);
            Navigator.pop(context);
          },
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("Etiquetas", style: TextStyle(fontFamily: "Roboto", fontSize: 15, fontWeight: FontWeight.w800),),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: const MyLoadingLabelList()
            ),
            MyButton(
              onPressed: (){
              },
              text: "Añadir",
            ),
            MyButton(
              onPressed: (){
              },
              text: "Guardar"
            ),
            MyButton(
              onPressed: (){
              },
              text: "Cerrar"
            ),
          ],
        ),
      ),
    );
  }
}

class MyNewLabelScreen extends StatelessWidget {
  const MyNewLabelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LabelRepositoryCubit, LabelRepositoryState>(
      builder: (context, state) {
        if (state.status == PageStatus.initial) {
          return const MyNewLabel();
        } else if(state.status == PageStatus.loading) {
          return const MyNewLabelLoading();
        } else if (state.status == PageStatus.success) {
          return const MyNewLabel();
        } else if (state.status == PageStatus.failure) {
          return const MyError();
        }
        else {
          print("Error en Register new Label" );
          return const MyError();
        }
      },
    );
  }
}

// class MyTodoScreen extends StatelessWidget {
//   const MyTodoScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TaskRepository, TaskRepositoryState>(
//       builder: (context, state) {
//         if(state.status == PageStatus.loading) {
//           return const LoadingMyToDo();
//         } else if (state.status == PageStatus.success) {
//           return const MyTodo();
//         } else {
//           return const MyError();
//         }
//       },
//     );
//   }
// }