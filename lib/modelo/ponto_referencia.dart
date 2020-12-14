import 'package:flutter/material.dart';

class PontoReferencia extends Rect {
  final String text;
  final Key key;
  PontoReferencia.fromPoints(Offset a, Offset b, this.text, this.key)
      : super.fromPoints(a, b);
}
