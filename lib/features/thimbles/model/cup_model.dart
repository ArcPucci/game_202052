import 'package:flutter/animation.dart';

class CupModel {
  int id = 0;
  double top = 0;
  double left = 0;
  bool hasDice = false;
  AnimationController? controller;

  void swapPosition(CupModel cup) {
    final id = this.id;
    final top = this.top;
    final left = this.left;
    this.id = cup.id;
    this.top = cup.top;
    this.left = cup.left;
    cup.id = id;
    cup.top = top;
    cup.left = left;
  }

  CupModel({this.id = 0, this.top = 0, this.left = 0, this.hasDice = false});
}
