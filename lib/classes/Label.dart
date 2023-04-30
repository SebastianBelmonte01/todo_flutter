import 'package:flutter/material.dart';

class Label {
  int? id;
  String? info;
  bool isTemp = true;
  bool isModified = false;
  bool isRemoved = false;
  String newInfo = "";



  Label (int id, String info){
    this.id = id;
    this.info = info;
    this.isTemp = true;
    this.isModified = false;
    this.isRemoved = false;
    this.newInfo = "";
  }

  factory Label.fromJson(Map<String, dynamic> json){
    return Label(
      json["labelId"],
      json['name']
    );
  }

    Map<String, dynamic> toJson() => {
    'labelId': id,
    'name': info,
  };

  

}