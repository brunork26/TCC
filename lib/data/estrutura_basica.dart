import 'package:flutter/material.dart';
import 'package:tcc/constantes.dart';

class EstruturaBasica {
  final int id;
  final Image mini;
  final String descricao;
  String texto;
  final TiposWidget tipo;
  final int indexLinha;
  final int indexColuna;
  final int tamanhoNaLinha;
  final int tamanhoNaColuna;
  final Function(dynamic) onTap;
  EstruturaBasica({
    this.id,
    this.mini,
    this.descricao,
    //this.texto,
    this.tipo,
    this.indexLinha,
    this.indexColuna,
    this.tamanhoNaColuna,
    this.tamanhoNaLinha,
    this.onTap,
  });
}
