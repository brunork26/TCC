import 'package:expanded_grid/expanded_grid.dart';

import '../componentes/ponto_referencia.dart';
import 'widget_basico.dart';
import 'package:flutter/material.dart';

class VSDConteudo extends WidgetBasico {
  final String imagem;
  List<ExpandedGridContent> _lista = [];
  VSDConteudo({
    id,
    mini,
    tipo,
    indexLinha,
    indexColuna,
    tamanhoNaColuna,
    tamanhoNaLinha,
    this.imagem,
  }) : super(
          id: id,
          mini: mini,
          indexLinha: indexLinha,
          indexColuna: indexColuna,
          tamanhoNaColuna: tamanhoNaColuna,
          tamanhoNaLinha: tamanhoNaLinha,
        ) {
    constroiMatrizGrade();
  }
  void constroiMatrizGrade() {
    for (int i = 0; i < 14; i++) {
      for (int j = 0; j < 21; j++) {
        //_lista.add(addPontoReferencia(i, j));
      }
      //matriz.add(listaNova);
    }
  }

  ExpandedGridContent addPontoReferencia(int linha, int coluna) {
    return ExpandedGridContent(
      rowIndex: linha,
      columnIndex: coluna,
      rowSpan: 1,
      columnSpan: 1,
      child: PontoReferencia(
        indexLinha: linha,
        indexColuna: coluna,
        tamanhoNaLinha: 1,
        tamanhoNaColuna: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Image(
              image: AssetImage(imagem),
            ),
          ),
          ExpandedGrid(
            column: 21,
            row: 14,
            children: _lista,
          ),
        ],
      ),
    );
  }
}
