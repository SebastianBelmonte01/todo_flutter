import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_flutter/classes/Label.dart';

part 'label_list_state.dart';

class LabelListCubit extends Cubit<LabelListState> {
  LabelListCubit() : super(LabelListState(listOfLabels: [Label("label", false, 0)], selectedLabelIndex: 0));

  void addLabel(String label) {
    List<Label> list = state.listOfLabels;
    list.add(Label(label, false, list.length));
    emit(LabelListState(listOfLabels: list, selectedLabelIndex: 0));
  }

  void removeLabel(String label) {
    List<Label> list = state.listOfLabels;
    list.removeWhere((element) => element.info == label);
    emit(LabelListState(listOfLabels: list, selectedLabelIndex: 0));
  }

  void addTemporalLabel() {
    List<Label> list = state.listOfLabels;
    list.add(Label("", true, list.length));
    emit(LabelListState(listOfLabels: list, selectedLabelIndex: 0));
  }

  void removeLabelTemporaly(int index) {
    List<Label> list = state.listOfLabels;
    //Search in the list by index and modify the label with removed = true
    list[index].isRemoved = true;
    emit(LabelListState(listOfLabels: list, selectedLabelIndex: 0));
  }

  void updateLabel(int index, String newLabel) {
    List<Label> list = state.listOfLabels;
    //Search in the list by index and modify the label with newInfo
    print("NEW LABEL: $newLabel");
    list[index].newInfo = newLabel;
    list[index].isModified = true;
    if(list[index].info == ""){
        list[index].info = newLabel; 
    }
    emit(LabelListState(listOfLabels: list, selectedLabelIndex: 0));
  }

  void updateLabelList(){
    List<Label> list = state.listOfLabels;
    List<Label> aux = [];
    for (Label label in list) {
      print("LABEL: ${label.info} in");
      if (label.info != "" && !label.isRemoved) {
        if(label.isModified){
          label.isModified = false;
          label.info = label.newInfo;
        }
        aux.add(label);
      } 
    }
    emit(LabelListState(listOfLabels: aux, selectedLabelIndex: 0));
  }

  void updateSelectedLabel(String selectedLabel){
    int index = state.listOfLabels.indexWhere((element) => element.info == selectedLabel);
    print("El indice seleccionado ahora es el $index");
    emit(LabelListState(listOfLabels: state.listOfLabels, selectedLabelIndex: index));
  }


  

}
