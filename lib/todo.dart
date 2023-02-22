import 'package:flutter/material.dart';
import 'package:todo_flutter/register-new-task.dart';
import 'package:todo_flutter/components/my-list-view.dart';
import 'package:todo_flutter/classes/Task.dart';


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
  List<Task> myTasks;
  MyTodo({super.key, required this.myTasks});
  @override
  State<MyTodo> createState() => _MyTodoState();
}

class _MyTodoState extends State<MyTodo> {
  

  Task task1 =  Task("Titulo 1", "Etiqueta 1", DateTime.now());
  Task task2 =  Task("Titulo 2", "Etiqueta 2", DateTime.now());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.myTasks.add(task1);
    widget.myTasks.add(task2);    
  }
  

  // int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static const List<Widget> _widgetOptions = <Widget>[

  //   //MyRegistrationTask(restorationId: "main"),
  // ];
  
  

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    print("HOLA MI TAMAÑO ES: ${widget.myTasks.length}");
    return Scaffold(
      appBar: AppBar(title: const Text("ToDo List", style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w900, fontSize: 30)), backgroundColor: Colors.blue[900],),
      body: MyListView(myList: widget.myTasks),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          //Se debe pasar la lista vacia
           // Navigator.pushNamed(context, '/register-new-tasks')
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyRegistrationTask(myList: widget.myTasks,)
            )
          )
        },
        child: const Icon(Icons.add),
      ),
      
    );
  }
}