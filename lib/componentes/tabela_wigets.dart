import 'package:flutter/material.dart';
import 'package:tcc/data/estrutura_basica.dart';
import 'widget_basico.dart';
import 'package:tcc/constantes.dart' as Const;
import 'package:expanded_grid/expanded_grid.dart';

class TabelaWidget extends StatefulWidget {
  final EstruturaBasica estruturaBasica;
  final String imagem;
  final List<Widget> conteudoLista;
  final Key key;

  TabelaWidget(
      {this.estruturaBasica, this.imagem, this.conteudoLista, this.key});

  TabelaWidgetState tabelaWidgetState;

  @override
  TabelaWidgetState createState() {
    tabelaWidgetState = TabelaWidgetState(
      estruturaBasica: estruturaBasica,
      imagem: imagem,
      conteudoLista: conteudoLista,
      key: key,
    );
    return tabelaWidgetState;
  }

  static TabelaWidgetState of(BuildContext context) =>
      context.findAncestorStateOfType<TabelaWidgetState>();
}

class TabelaWidgetState extends State<TabelaWidget> {
  final String imagem;
  final List<Widget> conteudoLista;
  final Key key;
  final EstruturaBasica estruturaBasica;
  List<ExpandedGridContent> _lista = [];

  TabelaWidgetState({
    this.estruturaBasica,
    this.imagem,
    this.conteudoLista,
    this.key,
  }) {
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
      row: 8,
      children: _lista,
    );
  }
}
