import 'package:flutter/material.dart';

class Label {
  String info  = "";
  bool isTemp = false;

 set setIsTemp(bool isTemp) => this.isTemp = isTemp;

 String get getInfo => this.info ;

 set setLabel(String info ) => this.info  = info  ;

 Label (String info, bool isTemp){
  this.info = info;
  this.isTemp = isTemp;
 }

}