import 'dart:convert';
import 'package:todo_flutter/classes/Task.dart';
import 'package:todo_flutter/dto/api_response.dart';
import '../data/provider/api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TodoService {
  static Future<List<Task>> getTasks() async {
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');

    final response = await http.get(
      Uri.parse("${Api.url}/task"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken'
      },
    );
    if (response.statusCode == 200) {
      print("La API respondio");
      print(response.body);
      final List result = jsonDecode(response.body)['response'];
      return result.map((e) => Task.fromJson(e)).toList();
    } else {
      print("La API NO respondio");
      throw Exception('Failed to login');
    }
  }

  static Future<void> updateTask(Task task) async{
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');

    final response = await http.put(
      Uri.parse("${Api.url}/task/${task.id}"),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $authToken'
      }
    );

    if (response.statusCode == 200) {
      print("La API respondio");
      print(response.body);
    } else {
      print("La API NO respondio");
      throw Exception('Failed to login');
    }
  }



}
