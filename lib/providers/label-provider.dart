import 'package:flutter/material.dart';

import '../classes/Label.dart';

class LabelList extends ChangeNotifier{
  List<Label> _labelList = [Label("Personal", false)];
  List<Label> get labelList => this._labelList;

  int get size => _labelList.length;

  void removeTemp(List<Label> newLabelList) {
    print("call removeTemp");
    _labelList = [];
    for(var label in newLabelList){
      if(!label.isTemp) {
        _labelList.add(label);
      } 
    }
    notifyListeners();
  }
  
  void setLabelList(List<Label> newLabelList){
    print("call setLabelList");
    _labelList = [];
    for(var label in newLabelList){
      if(label.info != "") {
        print("LABEL");
        print(label.info);
        label.isTemp = false;
        _labelList.add(label);
      }
    }
    notifyListeners();
  }
  
  void addLabel(Label label){
    _labelList.add(label);
    notifyListeners();
  }

  void updateLabels(List<Label> labelsList){
    for (Label label in labelsList) {
      if (label.isModified) {
        label.info = label.newInfo;
      } 
    }
  }

  List<String> getLabelFromList(){
    List<String> labels = [];
    for(Label label in _labelList){
      print("Labels: ${label.getInfo}");
      labels.add(label.getInfo);
    }
    return labels;
  }

  void removeLabel(List<Label> newLabelList){
    print("call setLabelList");
    _labelList = [];
    for(var label in newLabelList){
      if(label.info != "" && !label.isRemoved) {
        print("LABEL");
        print(label.info);
        label.isTemp = false;
        _labelList.add(label);
      }
    }
    notifyListeners();
  }



}