import '../constantes.dart';
import 'widget_basico.dart';
import 'package:flutter/material.dart';

class CartaoTabela extends WidgetBasico {
  final Image imagem;
  final String texto;
  CartaoTabela(
      {id,
      mini,
      indexLinha,
      indexColuna,
      tamanhoNaColuna,
      tamanhoNaLinha,
      this.imagem,
      this.texto})
      : super(
          id: id,
          mini: imagem,
          tipo: TiposWidget.CARD_TABELA,
          indexLinha: indexLinha,
          indexColuna: indexColuna,
          tamanhoNaColuna: tamanhoNaColuna,
          tamanhoNaLinha: tamanhoNaLinha,
        );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: imagem,
            ),
            Expanded(
              child: Center(
                child: Text(
                  texto,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
