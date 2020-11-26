import 'package:flutter/material.dart';
import 'package:tcc/constantes.dart' as Const;

import '../constantes.dart';
import 'widget_basico.dart';

class TextHotspots extends WidgetBasico {
  //final Function onTap;
  String texto;
  final Function(String) mudaTexto;
  TextHotspots({
    id,
    mini,
    indexLinha,
    indexColuna,
    tamanhoNaColuna,
    tamanhoNaLinha,
    this.texto,
    this.mudaTexto,
    //this.onTap,
  }) : super(
          id: id,
          mini: mini,
          tipo: TiposWidget.TEXT_HOTSPOTS,
          indexLinha: indexLinha,
          indexColuna: indexColuna,
          tamanhoNaColuna: tamanhoNaColuna,
          tamanhoNaLinha: tamanhoNaLinha,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 100.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: Text(
          texto,
          style: TextStyle(fontSize: 88, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
