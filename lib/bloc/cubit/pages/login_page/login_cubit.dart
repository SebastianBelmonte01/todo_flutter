
import 'package:bloc/bloc.dart';
import 'package:todo_flutter/bloc/cubit/pages/page_status.dart';
import 'package:todo_flutter/services/login_service.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> login(String username, String password) async {
    print("Nuevo login");
    emit(state.copyWith(status: PageStatus.loading));
    try {
      await LoginService.login(username, password);
      emit(state.copyWith(status: PageStatus.success));
    } catch (e) {
      emit(state.copyWith(status: PageStatus.failure));
    }
  }

  void chageStateToInitial() {
    emit(state.copyWith(status: PageStatus.success));
  }

  void reset() {
    emit(const LoginState());
  }

}