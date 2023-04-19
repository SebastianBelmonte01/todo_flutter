import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {

  final LoginStatus? status;

  const LoginState({
    this.status = LoginStatus.initial,
  });

  LoginState copyWith({

    LoginStatus? status,
  }) {
    return LoginState(
      status: status ?? this.status,
    );
  }
  
  @override
  List<Object?> get props =>  [status];
  

}

