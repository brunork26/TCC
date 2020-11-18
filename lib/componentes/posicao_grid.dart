import 'package:flutter/material.dart';
import 'package:tcc/constantes.dart' as Const;

import '../constantes.dart';
import 'widget_basico.dart';

typedef void DataCallback(int teste1, int teste2);

class PosicaoGrid extends WidgetBasico {
  //final Function onTap;
  final DataCallback callback;
  PosicaoGrid({
    id,
    mini,
    indexLinha,
    indexColuna,
    tamanhoNaColuna,
    tamanhoNaLinha,
    //this.onTap,
    this.callback,
  }) : super(
          id: id,
          mini: mini,
          tipo: TiposWidget.POSICAO_GRID,
          indexLinha: indexLinha,
          indexColuna: indexColuna,
          tamanhoNaColuna: tamanhoNaColuna,
          tamanhoNaLinha: tamanhoNaLinha,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              callback(this.indexLinha, this.indexColuna);
            },
            child: Container(
              width: 50,
              height: 50,
              child: Const.kCelulaPlaceHolder,
            ),
          ),
        ),
      ),
    );
  }
}
