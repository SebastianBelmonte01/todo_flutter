import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_flutter/classes/Label.dart';

part 'label_list_state.dart';

class LabelListCubit extends Cubit<LabelListState> {
  LabelListCubit() : super(LabelListState(listOfLabels: [Label("label", false)]));

  void addLabel(String label) {
    List<Label> list = state.listOfLabels;
    list.add(Label(label, false));
    emit(LabelListState(listOfLabels: list));
  }

  void removeLabel(String label) {
    List<Label> list = state.listOfLabels;
    list.removeWhere((element) => element.info == label);
    emit(LabelListState(listOfLabels: list));
  }
  

}
