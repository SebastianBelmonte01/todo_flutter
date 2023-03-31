import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'datepicker_state.dart';

class DatepickerCubit extends Cubit<DatepickerState> {
  DatepickerCubit() : super(DatepickerState(datePicked: DateTime.now()));

  void updateDatedPicked(DateTime datePicked){
    emit(DatepickerState(datePicked: datePicked));
  }
  
  
}
