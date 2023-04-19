import 'package:todo_flutter/dto/auth_response.dart';

class ApiResponse {
  String code;
  AuthResponse response;
  String errorMessage;

  ApiResponse({
    required this.code,
    required this.response,
    required this.errorMessage,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        code: json["code"],
        response: AuthResponse.fromJson(json["response"]),
        errorMessage: "Error",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "response": response.toJson(),
        "errorMessage": errorMessage,
      };  
}