import 'package:expanded_grid/expanded_grid.dart';
import 'package:flutter/material.dart';
import 'package:tcc/componentes/caixa_texto.dart';
import 'package:tcc/componentes/cartao_tabela.dart';
import 'package:tcc/componentes/tabela_wigets.dart';
import 'package:tcc/constantes.dart' as Const;
import 'package:tcc/data/estrutura_basica.dart';
import '../dados.dart' as Dados;
import '../data/nav_bar_data.dart';
import '../componentes/nav_bar.dart';
import 'package:tcc/componentes/caixa_widgets.dart';
import 'package:tcc/modelo/tabela_modelo.dart';

class TelaCCDG extends StatefulWidget {
  static const String id = 'TelaCCDG';
  @override
  _TelaCCDGState createState() => _TelaCCDGState();
}

class _TelaCCDGState extends State<TelaCCDG> {
  NavBarData navBarData = Dados.ccdgdata;
  NavBarData navBarData2 = NavBarData(conteudo: []);
  CaixaWidgets caixaWidgetsController;
  int idText = 0;

  @override
  void initState() {
    super.initState();
    caixaWidgetsController = CaixaWidgets(
      estruturaBasica: EstruturaBasica(),
    );

    for (int i = 0; i < navBarData.conteudo.length; i++) {
      List<Widget> cards = [];
      for (int j = 0; j < navBarData.conteudo[i].conteudoLista.length; j++) {
        cards.add(
          CartaoTabela(
            imagem: navBarData.conteudo[i].conteudoLista[j].imagem,
            texto: navBarData.conteudo[i].conteudoLista[j].texto,
            indexColuna: navBarData.conteudo[i].conteudoLista[j].indexColuna,
            indexLinha: navBarData.conteudo[i].conteudoLista[j].indexLinha,
            tamanhoNaColuna:
                navBarData.conteudo[i].conteudoLista[j].tamanhoNaColuna,
            tamanhoNaLinha:
                navBarData.conteudo[i].conteudoLista[j].tamanhoNaLinha,
            onTap: (oi) {
              setState(() {
                caixaWidgetsController.adicionaWidget(
                  navBarData.conteudo[i].conteudoLista[j].imagem,
                  navBarData.conteudo[i].conteudoLista[j].texto,
                );
              });
            },
          ),
        );
      }
      navBarData2.conteudo.add(TabelaModelo(
        key: navBarData.conteudo[i].key,
        id: navBarData.conteudo[i].id,
        mini: navBarData.conteudo[i].mini,
        descricao: navBarData.conteudo[i].descricao,
        imagem: navBarData.conteudo[i].imagem,
        conteudoLista: cards,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ExpandedGrid(
          column: 10,
          row: 10,
          children: [
            ExpandedGridContent(
              rowIndex: 0,
              columnIndex: 0,
              rowSpan: 2,
              columnSpan: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: NavBar(
                      selecionaVSD: (id) {
                        setState(() {
                          idText = id;
                        });
                      },
                      data: navBarData2,
                    ),
                  ),
                ],
              ),
            ),
            ExpandedGridContent(
              rowIndex: 2,
              columnIndex: 0,
              rowSpan: 6,
              columnSpan: 10,
              child: TabelaWidget(
                key: navBarData2.conteudo[idText].key,
                conteudoLista: navBarData2.conteudo[idText].conteudoLista,
              ),
            ),
            ExpandedGridContent(
              rowIndex: 7,
              columnIndex: 0,
              rowSpan: 2,
              columnSpan: 10,
              child: caixaWidgetsController,
            ),
            ExpandedGridContent(
              rowIndex: 9,
              columnIndex: 0,
              rowSpan: 1,
              columnSpan: 10,
              child: CaixaTexto(),
            ),
          ],
        ),
      ),
      floatingActionButton: Const.kFAB(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
