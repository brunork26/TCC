import 'package:flutter/material.dart';
import 'package:tcc/constantes.dart';

class InfoBasica {
  final Key key;
  final TiposWidget tipo;
  final Image mini;
  final int id;
  final int indexLinha;
  final int indexColuna;
  final int tamanhoNaLinha;
  final int tamanhoNaColuna;
  final String descricao;

  InfoBasica({
    this.key,
    this.tipo,
    this.mini,
    this.id,
    this.indexLinha,
    this.indexColuna,
    this.tamanhoNaLinha,
    this.tamanhoNaColuna,
    this.descricao,
  });
}
