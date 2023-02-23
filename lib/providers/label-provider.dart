import 'package:flutter/material.dart';

import '../classes/Label.dart';

class LabelList extends ChangeNotifier{
  List<Label> _labelList = [Label("NUMERO"), Label("NUMERO  2")];
  List<Label> get labelList => this._labelList;

  int get size => _labelList.length;

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