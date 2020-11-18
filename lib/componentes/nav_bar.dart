import 'package:flutter/material.dart';
import '../data/nav_bar_data.dart';
import 'widget_basico.dart';
import 'package:tcc/constantes.dart';

class NavBar extends WidgetBasico {
  final double width;
  final double height;
  final NavBarData data;
  final Function(int) selecionaVSD;

  final List<Widget> widgets = [];

  NavBar(
      {id,
      mini,
      tipo,
      indexLinha,
      indexColuna,
      tamanhoNaColuna,
      tamanhoNaLinha,
      this.height,
      this.width,
      @required this.data,
      this.selecionaVSD})
      : super(
          id: id,
          mini: mini,
          tipo: TiposWidget.NAR_BAR,
          indexLinha: indexLinha,
          indexColuna: indexColuna,
          tamanhoNaColuna: tamanhoNaColuna,
          tamanhoNaLinha: tamanhoNaLinha,
        ) {
    for (int i = 0; i < data.conteudo.length; i++) {
      widgets.add(
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                selecionaVSD(i);
              },
              child: Container(
                child: data.conteudo[i].mini,
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widgets,
      ),
    );
  }
}
