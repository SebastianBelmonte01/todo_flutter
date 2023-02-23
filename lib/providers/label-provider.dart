import 'package:flutter/material.dart';

import '../classes/Label.dart';

class LabelList extends ChangeNotifier{
  List<Label> _labelList = [Label("NUMERO", false), Label("NUMERO  2", false)];
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
  }
  
  void setLabelList(List<Label> newLabelList){
    print("call setLabelList");
    _labelList = [];
    for(var label in newLabelList){
      if(label.info != "") {
        label.isTemp = false;
        _labelList.add(label);
      }
    }
  }
  void addLabel(Label label){
    _labelList.add(label);
    notifyListeners();
  }

  void removeLabel(int index) {
    print("Presiono el indice ${index}");
    _labelList.removeAt(index);
    notifyListeners();
  }

}