import 'package:flutter/material.dart';

import '../constantes.dart';

/**
 (
  {id,
  mini,
  tipo,
  indexLinha,
  indexColuna,
  tamanhoNaColuna,
  tamanhoNaLinha,
  descricao,
})
  : super(
  id: id,
  mini: mini,
  indexLinha: indexLinha,
  indexColuna: indexColuna,
  tamanhoNaColuna: tamanhoNaColuna,
  tamanhoNaLinha: tamanhoNaLinha,
  descricao: descricao,
);
 */
class WidgetBasico extends StatelessWidget {
  final TiposWidget tipo;
  final Image mini;
  final int id;
  final int indexLinha;
  final int indexColuna;
  final int tamanhoNaLinha;
  final int tamanhoNaColuna;
  final String descricao;

  WidgetBasico({
    this.id,
    this.mini,
    this.tipo,
    this.indexLinha,
    this.indexColuna,
    this.tamanhoNaColuna,
    this.tamanhoNaLinha,
    this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
