import 'package:flutter/material.dart';

class Label {
  String info  = "";

 String get getInfo => this.info ;

 set setLabel(String info ) => this.info  = info  ;

 Label (String info){
  this.info = info;
 }

}