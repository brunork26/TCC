import 'package:flutter/material.dart';
import 'package:tcc/constantes.dart';

class EstruturaBasica {
  final int id;
  final Image mini;
  final TiposWidget tipo;
  final int indexLinha;
  final int indexColuna;
  final int tamanhoNaLinha;
  final int tamanhoNaColuna;
  EstruturaBasica(
      {this.id,
      this.mini,
      this.tipo,
      this.indexLinha,
      this.indexColuna,
      this.tamanhoNaColuna,
      this.tamanhoNaLinha});
}
