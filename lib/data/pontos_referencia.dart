import 'estrutura_basica.dart';
import 'package:flutter/material.dart';

class PontosReferencia extends EstruturaBasica {
  final Key key;
  final String texto;

  PontosReferencia({id, mini, this.texto, this.key})
      : super(id: id, mini: mini);
}
