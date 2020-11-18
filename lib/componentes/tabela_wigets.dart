import 'package:flutter/material.dart';
import 'widget_basico.dart';
import 'package:tcc/constantes.dart' as Const;
import 'package:expanded_grid/expanded_grid.dart';

class TabelaWidget extends WidgetBasico {
  final String imagem;
  final List<Widget> conteudoLista;
  List<ExpandedGridContent> _lista = [];

  TabelaWidget({id, mini, this.imagem, this.conteudoLista})
      : super(id: id, mini: Image.asset(imagem)) {
    populaListaDeComponantes();
  }

  void populaListaDeComponantes() {
    for (int i = 0; i < conteudoLista.length; i++) {
      WidgetBasico conteudo = conteudoLista[i];
      _lista.add(
        ExpandedGridContent(
          rowIndex: conteudo.indexLinha,
          columnIndex: conteudo.indexColuna,
          rowSpan: conteudo.tamanhoNaLinha,
          columnSpan: conteudo.tamanhoNaColuna,
          child: conteudo,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ExpandedGrid(
      column: 10,
      row: 10,
      children: _lista,
    );
  }
}
/*
https://github.com/organic-nailer/expanded_grid
<ExpandedGridContent>[
        ExpandedGridContent(
          rowIndex: 0,
          columnIndex: 0,
          rowSpan: 2,
          columnSpan: 3,
          child: VSD(
            id: 0,
            imagem: Const.imgs[0],
            conteudoLista: null,
          ),
        ),
        ExpandedGridContent(
            rowIndex: 0,
            columnIndex: 3,
            rowSpan: 2,
            child: Container(
              color: Colors.green,
            )),
        ExpandedGridContent(
            rowIndex: 2,
            columnIndex: 0,
            rowSpan: 2,
            columnSpan: 2,
            child: Container(
              color: Colors.red,
            )),
        ExpandedGridContent(
            rowIndex: 2,
            columnIndex: 2,
            columnSpan: 2,
            child: Container(
              color: Colors.yellow,
            )),
        ExpandedGridContent(
            rowIndex: 3,
            columnIndex: 2,
            rowSpan: 2,
            child: Container(
              color: Colors.purple,
            )),
        ExpandedGridContent(
            rowIndex: 3,
            columnIndex: 3,
            rowSpan: 2,
            child: Container(
              color: Colors.amber,
            )),
        ExpandedGridContent(
            rowIndex: 4,
            columnIndex: 0,
            columnSpan: 2,
            child: Container(
              color: Colors.teal,
            )),
      ]
*/
