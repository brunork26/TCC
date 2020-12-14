import '../constantes.dart';
import 'widget_basico.dart';
import 'package:flutter/material.dart';

class CartaoTabela extends WidgetBasico {
  final Image imagem;
  final String texto;
  final Function(String) onTap;
  CartaoTabela({
    id,
    mini,
    indexLinha,
    indexColuna,
    tamanhoNaColuna,
    tamanhoNaLinha,
    this.imagem,
    this.texto,
    this.onTap,
  }) : super(
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
        child: InkWell(
          onTap: () {
            onTap('oi');
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: imagem == null ? 0 : 3,
                child: imagem ?? Container(),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    child: Text(
                      texto,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
