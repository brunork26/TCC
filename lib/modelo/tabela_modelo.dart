import 'package:flutter/material.dart';
import 'package:tcc/modelo/info_basica.dart';

class TabelaModelo extends InfoBasica {
  final String imagem;
  final List<Widget> conteudoLista;

  TabelaModelo({
    key,
    tipo,
    id,
    mini,
    indexLinha,
    indexColuna,
    tamanhoNaLinha,
    tamanhoNaColuna,
    descricao,
    this.imagem,
    this.conteudoLista,
  }) : super(
          key: key,
          tipo: tipo,
          id: id,
          mini: mini,
          indexLinha: indexLinha,
          indexColuna: indexColuna,
          tamanhoNaLinha: tamanhoNaLinha,
          tamanhoNaColuna: tamanhoNaColuna,
          descricao: descricao,
        );
}
