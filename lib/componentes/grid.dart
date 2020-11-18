import 'package:flutter/material.dart';
import 'package:expanded_grid/expanded_grid.dart';
import '../componentes/posicao_grid.dart';
import '../constantes.dart';
import '../constantes.dart' as Const;
import '../data/nav_bar_data.dart';
import 'VSD.dart';
import 'cartao_tabela.dart';
import 'nav_bar.dart';
import 'widget_basico.dart';
import '../data/estrutura_basica.dart';

class Grid extends StatefulWidget {
  final int tamanhoLinha;
  final int tamanhoColuna;

  Grid({this.tamanhoColuna, this.tamanhoLinha});

  GridState gridState;

  void adicionaWidget(EstruturaBasica widget) {
    gridState.adicionaWidget(widget);
  }

  @override
  GridState createState() {
    gridState =
        GridState(tamanhoColuna: tamanhoColuna, tamanhoLinha: tamanhoLinha);
    return gridState;
  }

  static GridState of(BuildContext context) =>
      context.findAncestorStateOfType<GridState>();
}

class GridState extends State<Grid> {
  List<List<int>> matriz = [];
  List<ExpandedGridContent> _listaVazia = [];
  List<ExpandedGridContent> _lista = [];
  int tl;
  int tc;
  int incremendaId = 0;

  GridState({tamanhoColuna, tamanhoLinha}) {
    tl = tamanhoLinha;
    tc = tamanhoColuna;
    constroiMatrizGrade();
  }

  Function funcao = () {};

  void constroiMatrizGrade() {
    for (int i = 0; i < tl; i++) {
      List<int> listaNova = new List<int>();
      for (int j = 0; j < tc; j++) {
        listaNova.add(0);
        _listaVazia.add(celulaPlaceHolder(i, j));
      }
      matriz.add(listaNova);
    }
  }

  bool adicionandoElemento = false;
  TiposWidget widgetSelecionado;
  int tamNovoWidgeLinha;
  int tamNovoWidgeColuna;

  void adicionaWidget(EstruturaBasica widget) {
    adicionandoElemento = true;
    widgetSelecionado = widget.tipo;
    tamNovoWidgeLinha = widget.tamanhoNaLinha;
    tamNovoWidgeColuna = widget.tamanhoNaColuna;
  }

  bool verificaPosicao(int tamLinha, int tamColuna) {
    for (int i = 0; i < 10; i++) {
      // Verifica se posição está vazia
      for (int j = 0; j < 10; j++) {}
    }

    return true;
  }

  void onTapCard(int v1, int v2) {
    print('Linha $v1 | Coluna $v2');
    print('Aperta card');

    String imprime = 'Tem: \n';
    for (int i = 0; i < tl; i++) {
      for (int j = 0; j < tc; j++) {
        imprime += '${matriz[i][j]} ';
      }
      imprime += '\n';
    }
    print(imprime);

    WidgetBasico novoWidget = defineWidget(v1, v2);

    // TODO: informar que não pode ser adicionado
    int distanciaLinhaMax = novoWidget.tamanhoNaLinha + v1;
    int distanciaColunaMax = novoWidget.tamanhoNaColuna + v2;

    // Recusa por causa de overflow da tabela
    if (distanciaLinhaMax > tl || distanciaColunaMax > tc) {
      print('Widget recusado');
      incremendaId--;
      return;
    }

    // Recusa por já existir widget na posição
    for (int i = v1; i < distanciaLinhaMax; i++) {
      for (int j = v2; j < distanciaColunaMax; j++) {
        if (matriz[i][j] != 0) {
          incremendaId--;
          print('Widget recusado');
          return;
        }
      }
    }

    print('Tamanho Linha: ${novoWidget.tamanhoNaLinha}');
    print('Tamanho Coluna: ${novoWidget.tamanhoNaColuna}');
    // adiciona widget na matriz
    for (int i = v1; i < distanciaLinhaMax; i++) {
      for (int j = v2; j < distanciaColunaMax; j++) {
        matriz[i][j] = novoWidget.id;
      }
    }
    imprime = 'Sai: \n';
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        imprime += '${matriz[i][j]} ';
      }
      imprime += '\n';
    }
    print(imprime);
    _lista.add(widgetNovo(novoWidget));
    adicionandoElemento = false;
  }

  WidgetBasico defineWidget(int v1, int v2) {
    incremendaId++;
    print('id: $incremendaId');
    print('Linha: $v1');
    print('Coluna: $v2');
    switch (widgetSelecionado) {
      case TiposWidget.VSD:
        print('vsd');
        return VSD(
          id: incremendaId,
          imagem: Const.kImgs[0],
          conteudoLista: null,
          indexLinha: v1,
          indexColuna: v2,
          tamanhoNaColuna: tamNovoWidgeColuna,
          tamanhoNaLinha: tamNovoWidgeLinha,
        );
      case TiposWidget.NAR_BAR:
        print('NavBar');
        return NavBar(
          id: incremendaId,
          data: NavBarData(conteudo: []),
          indexLinha: v1,
          indexColuna: v2,
          tamanhoNaColuna: tamNovoWidgeColuna,
          tamanhoNaLinha: tamNovoWidgeLinha,
        );
      case TiposWidget.CARD_TABELA:
        print('Cardtabela');
        return CartaoTabela(
          id: incremendaId,
          imagem: Image.asset(Const.kImgs[4]),
          texto: 'teste',
          indexLinha: v1,
          indexColuna: v2,
          tamanhoNaColuna: tamNovoWidgeColuna,
          tamanhoNaLinha: tamNovoWidgeLinha,
        );
      case TiposWidget.LISTA_FRASES:
        print('ListaFrases');
        break;
      default:
        print('Erro');
        break;
    }
    return null;
  }

  ExpandedGridContent widgetNovo(WidgetBasico widgetBasico) {
    return ExpandedGridContent(
      rowIndex: widgetBasico.indexLinha,
      columnIndex: widgetBasico.indexColuna,
      rowSpan: widgetBasico.tamanhoNaLinha,
      columnSpan: widgetBasico.tamanhoNaColuna,
      child: widgetBasico,
    );
  }

  ExpandedGridContent celulaPlaceHolder(int linha, int coluna) {
    return ExpandedGridContent(
      rowIndex: linha,
      columnIndex: coluna,
      rowSpan: 1,
      columnSpan: 1,
      child: PosicaoGrid(
        callback: (val1, val2) {
          setState(() {
            if (adicionandoElemento == true) {
              onTapCard(val1, val2);
            }
          });
        },
        indexLinha: linha,
        indexColuna: coluna,
        tamanhoNaLinha: 1,
        tamanhoNaColuna: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ExpandedGrid(
              column: tc,
              row: tl,
              children: _listaVazia,
            ),
            ExpandedGrid(
              column: tc,
              row: tl,
              children: _lista,
            ),
          ],
        ),
      ),
    );
  }
}
