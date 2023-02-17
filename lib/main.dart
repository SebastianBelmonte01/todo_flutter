import 'package:flutter/material.dart';

class MyCredentials extends StatefulWidget {
  const MyCredentials({super.key});

  @override
  State<MyCredentials> createState() => _MyCredentialsState();
}

class _MyCredentialsState extends State<MyCredentials> {
  final usernameController = TextEditingController();
  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
        const Image(image: AssetImage('assets/user-calendar.png'), ),
        SizedBox(
          width: 300,
          child: TextField(
            controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Usuario',
              ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 300,
          child: TextField(
            controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Contraseña',
              ),
          ),
        ),
        ElevatedButton(
          onPressed: () => {print("La contraseña es ${usernameController.text}")},
          child: Text("Enviar")
        ),
        

      ],
    );
  }
}

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login", style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w900, fontSize: 30)), backgroundColor: Colors.blue[900],),
      body: const Center(
        child: MyCredentials()
      ),
    );
  }
}


void main() {
  runApp(const MaterialApp(
    home: MyLogin(),
  ));
}
