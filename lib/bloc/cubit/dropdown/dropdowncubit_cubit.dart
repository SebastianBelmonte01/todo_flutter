import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dropdowncubit_state.dart';

class DropdownCubit extends Cubit<DropdownCubitState> {
  DropdownCubit() : super(DropdownCubitState(dropdownValue: ""));

  void updateDropdownValue(String value){
    emit(DropdownCubitState(dropdownValue: value));
  }
}
