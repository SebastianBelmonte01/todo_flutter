import 'dart:convert';

import 'package:todo_flutter/dto/api_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../data/provider/api.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<ApiResponse> login(String username, String password) async {
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
      print("AUTH TOKEN: ${jsonDecode(response.body)['response']['authToken']}");

      var responseBody = jsonDecode(response.body);

      const storage = FlutterSecureStorage();
      storage.write(
          key: 'authToken', value: responseBody['response']['authToken']);

      return ApiResponse.fromJson(responseBody);
    } else {
      print("La API NO respondio");
      print(response.body);
      throw Exception('Failed to login');
    }
  }
}
