import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../classes/Label.dart';
import '../data/provider/api.dart';
import '../dto/api_response.dart';

class LabelService {
  static Future<List<Label>> getLabels() async {
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');

    final response =
        await http.get(Uri.parse("${Api.url}/label"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $authToken'
    });
    if (response.statusCode == 200) {
      print("La API respondio");
      print(response.body);
      final List result = jsonDecode(response.body)['response'];
      return result.map((e) => Label.fromJson(e)).toList();
    } else {
      print("La API NO respondio");
      throw Exception('Failed to login');
    }
  }

  static Future<void> addLabel(Label label) async {
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');

    final response = await http.post(Uri.parse("${Api.url}/label"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode(<dynamic, dynamic>{
          'labelId': label.id,
          'name': label.info,
        }));
    if (response.statusCode == 200) {
      print("La API respondio");
      print(response.body);
    } else {
      print("La API NO respondio");
      throw Exception('Failed to login');
    }
  }

  static Future<void> updateLabels(List<Label> updatedLabels) async {
    const storage = FlutterSecureStorage();
    final authToken = await storage.read(key: 'authToken');
    print("updateLabels");

    /*
    DEGUG
  */

    final response = await http
        .post(Uri.parse("${Api.url}/label"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $authToken'
    }, body: jsonEncode(
      updatedLabels
        .map(
            (label) => label.toJson()
        ).toList()
      )
    );
    print(response.body);
    if (response.statusCode == 200) {
      print("La API respondio");
      print(response.body);
    } else {
      print("La API NO respondio");
      throw Exception('Failed to login');
    }
  }
}
