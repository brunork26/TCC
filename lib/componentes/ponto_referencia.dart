import '../constantes.dart';
import 'widget_basico.dart';
import 'package:flutter/material.dart';

class PontoReferencia extends WidgetBasico {
  //final Image imagem;
  final String texto;
  PontoReferencia(
      {id,
      mini,
      indexLinha,
      indexColuna,
      tamanhoNaColuna,
      tamanhoNaLinha,
      this.texto})
      : super(
          id: id,
          mini: mini,
          tipo: TiposWidget.PONTO_REFERENCIA,
          indexLinha: indexLinha,
          indexColuna: indexColuna,
          tamanhoNaColuna: tamanhoNaColuna,
          tamanhoNaLinha: tamanhoNaLinha,
        );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: InkWell(
        //splashColor: Colors.blue.withAlpha(30),
        onTap: () {},
        child: Container(
          //width: 50,
          //height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
          ),
        ),
      ),
    );
  }
}
