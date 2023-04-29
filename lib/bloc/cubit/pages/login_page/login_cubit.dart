
import 'package:bloc/bloc.dart';
import 'package:todo_flutter/services/login_service.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> login(String username, String password) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await LoginService.login(username, password);
      emit(state.copyWith(status: LoginStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }

  void chageStateToInitial() {
    emit(state.copyWith(status: LoginStatus.initial));
  }

}