import 'package:flutter/material.dart';
import 'package:todo_flutter/register-new-task.dart';
import 'package:todo_flutter/components/my-list-view.dart';


class ToDoOption extends StatelessWidget {
  const ToDoOption({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyListView();

  }

}

class DoneOption extends StatelessWidget {
  const DoneOption({super.key});
  @override
  Widget build(BuildContext context) {
    return
        ListView(
          children: [
           _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
          ],
        );
  }
  ListTile _tile(String title, String subtitle, IconData icon) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
    );
  }
}

class MyTodo extends StatefulWidget {
  const MyTodo({super.key});
  @override
  State<MyTodo> createState() => _MyTodoState();
}

class _MyTodoState extends State<MyTodo> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ToDoOption(),
    DoneOption()
    //MyRegistrationTask(restorationId: "main"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ToDo List", style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w900, fontSize: 30)), backgroundColor: Colors.blue[900],),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse_rounded),
            label: 'ToDo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Done',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: _selectedIndex==0?Colors.red[800]:Colors.green[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
            Navigator.pushNamed(context, '/register-new-tasks')
        },
        child: const Icon(Icons.add),
      ),
      
    );
  }
}