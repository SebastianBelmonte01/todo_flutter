import 'package:flutter/material.dart';

class Label {
  String info  = "";
  bool isTemp = false;
  bool isModified = false;
  bool isRemoved = false;
  String newInfo = "";


 String get getInfo => this.info ;

 set setLabel(String info ) => this.info  = info  ;

 Label (String info, bool isTemp){
  this.info = info;
  this.isTemp = isTemp;
  this.isModified = false;
  this.isRemoved = false;
  this.newInfo = "";

 }

  void setIsTemp(bool bool) {
    this.isTemp = bool;
  }

  List<String> getLabels(List<Label> labelsList) {
    List<String> labels = [];
    for (Label label in labelsList){
      labels.add(label.getInfo);
    }
    return labels;
  }

}