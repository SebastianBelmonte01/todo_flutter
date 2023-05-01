import 'package:equatable/equatable.dart';
import 'package:todo_flutter/bloc/cubit/pages/page_status.dart';


class LoginState extends Equatable {

  final PageStatus? status;

  const LoginState({
    this.status = PageStatus.initial,
  });

  LoginState copyWith({

    PageStatus? status,
  }) {
    return LoginState(
      status: status ?? this.status,
    );
  }
  
  @override
  List<Object?> get props =>  [status];
  

}

