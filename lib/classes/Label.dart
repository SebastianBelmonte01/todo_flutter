import 'package:flutter/material.dart';

class Label {
  String info  = "";
  bool isTemp = false;
  bool isModified = false;
  bool isRemoved = false;
  String newInfo = "";
  int index = 0;


  Label (String info, bool isTemp, int index){
    this.info = info;
    this.isTemp = isTemp;
    this.isModified = false;
    this.isRemoved = false;
    this.newInfo = "";
    this.index = index;
  }

  

}