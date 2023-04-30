import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter/bloc/cubit/pages/page_status.dart';

import '../../../../classes/Label.dart';
import '../../../../services/label_service.dart';

part 'label_repository_state.dart';

class LabelRepositoryCubit extends Cubit<LabelRepositoryState> {
  LabelRepositoryCubit() : super(const LabelRepositoryState());

  Future<void> getLabels() async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      print("LabelRepository: getLabels");
      List<Label> labels = await LabelService.getLabels();
      emit(state.copyWith(status: PageStatus.success, labels: labels));
    } catch (e) {
      emit(state.copyWith(status: PageStatus.failure));
    }
  }

  void addTemporalLabel() {
    print("Entro en addTemporalLabel");
    List<Label> newList = [...state.labels];
    newList.add(Label(newList.length + 1, ""));
    print(newList.toString());
    emit(state.copyWith(labels: newList));
  }

  void removeLabelTemporaly(int index) {
    print("Entro en removeLabelTemporaly");
    List<Label> newList = [...state.labels];
    newList[index].isRemoved = true;
    print("Removed label: ${newList[index].info}");
    emit(state.copyWith(labels: newList));
  }

  void updateLabel(int index, String newLabel) {
    print("Entro en updateLabel");
    print("NEW LABEL: $newLabel");
    List<Label> newList = [...state.labels];
    newList[index].newInfo = newLabel;
    newList[index].isModified = true;
    if (newList[index].info == "") {
      newList[index].info = newLabel;
    }
    emit(state.copyWith(labels: newList));
  }

  Future <void> updateLabelList() async {
    emit(state.copyWith(status: PageStatus.loading));
    print("Entro en updateLabelList");
    List<Label> newList = [...state.labels];
    List<Label> aux = [];
    for (Label label in newList) {
      print("LABEL: ${label.info} in");
      if (label.info != "" && !label.isRemoved) {
        if (label.isModified) {
          label.isModified = false;
          label.info = label.newInfo;
        }
        aux.add(label);
      }
    }
    try {
      print("Entrando a updateLabels");
      await LabelService.updateLabels(aux);
      emit(state.copyWith(status: PageStatus.success, labels: aux));
    } catch (e) {
      emit(state.copyWith(status: PageStatus.failure));
    }
  }


  /*

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


  */
}
