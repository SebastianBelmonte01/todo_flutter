import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter/providers/task-provider.dart';
import 'package:todo_flutter/register-new-task.dart';
import 'package:todo_flutter/components/my-list-view.dart';
import 'package:todo_flutter/classes/Task.dart';

import 'bloc/todo-list-cubit.dart';


// class ToDoOption extends StatelessWidget {

//   const ToDoOption({super.key, required List<Task> listOfTasks});

//   @override
//   Widget build(BuildContext context) {
//     return const MyListView();

//   }

// }

// class DoneOption extends StatelessWidget {
//   const DoneOption({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return
//         ListView(
//           children: [
//            _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
//           ],
//         );
//   }
//   ListTile _tile(String title, String subtitle, IconData icon) {
//     return ListTile(
//       title: Text(title,
//           style: const TextStyle(
//             fontWeight: FontWeight.w500,
//             fontSize: 20,
//           )),
//       subtitle: Text(subtitle),
//       leading: Icon(
//         icon,
//         color: Colors.blue[500],
//       ),
//     );
//   }
// }  

class MyTodo extends StatefulWidget {
  MyTodo({super.key});
  @override
  State<MyTodo> createState() => _MyTodoState();
}

class _MyTodoState extends State<MyTodo> {
  
  @override
  Widget build(BuildContext context) {
    List<Task> myTodoList = context.watch<TodoListCubit>().state;
    
    return Scaffold(
      appBar: AppBar(title: const Text("ToDo List", style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w900, fontSize: 30)), backgroundColor: Colors.blue[900],),
      body: MyListView(myList: myTodoList,),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          //Se debe pasar la lista vacia
           // Navigator.pushNamed(context, '/register-new-tasks')
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyRegistrationTask()
            )
          )
        },
        child: const Icon(Icons.add),
      ),
      
    );
  }
}