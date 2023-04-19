class AuthResponse {
  String authToken;
  String refreshToken;

  AuthResponse({
    required this.authToken,
    required this.refreshToken,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        authToken: json["authToken"],
        refreshToken: json["refreshToken"],
      );
  Map<String, dynamic> toJson() => {
        "authToken": authToken,
        "refreshToken": refreshToken,
      };
}