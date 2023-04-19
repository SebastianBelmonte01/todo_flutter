import 'dart:convert';

import 'package:todo_flutter/dto/api_response.dart';

import '../data/provider/api.dart';
import 'package:http/http.dart' as http;

class LoginService{
  static Future<ApiResponse> login (String username, String password) async {
    print("Credenciales");
    print(username);
    print(password);
    final response = await http.post(
      Uri.parse("${Api.url}/auth/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      print("La API respondio");
      print(response.body);
      return ApiResponse.fromJson(jsonDecode(response.body));
    } else {
      print("La API respondio");
      throw Exception('Failed to login');
    }
  }
}