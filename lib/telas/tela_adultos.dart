import 'package:expanded_grid/expanded_grid.dart';
import 'package:flutter/material.dart';
import 'package:tcc/componentes/caixa_texto.dart';
import '../data/nav_bar_data.dart';
import '../componentes/nav_bar.dart';
import '../componentes/text_hotspots.dart';
import 'package:tcc/componentes/VSD.dart';
import 'package:tcc/data/estrutura_basica.dart';
import 'package:tcc/constantes.dart' as Const;
import '../dados.dart' as Dados;

class TelaAdultos extends StatefulWidget {
  static const String id = 'TesteWidgets';
  @override
  _TelaAdultosState createState() => _TelaAdultosState();
}

class _TelaAdultosState extends State<TelaAdultos> {
  NavBarData navBarData = Dados.adultosData; // Dados.ccddata;
  int idText = 0;
  Widget textHotspotVisicel;
  String textoCaixa;
  Key keyText = Key('0');

  @override
  void initState() {
    navBarData = Dados.adultosData;
    idText = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    textHotspotVisicel = TextHotspots(
      key: Key('t1'),
      mudaTexto: (texto) {
        this.setState(() {
          textoCaixa = texto;
        });
      },
      texto: '',
    );
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
                        this.setState(() {
                          idText = id;
                          textoCaixa = navBarData.conteudo[idText].descricao;
                        });
                      },
                      data: navBarData,
                    ),
                  ),
                ],
              ),
            ),
            ExpandedGridContent(
              rowIndex: 9,
              columnIndex: 0,
              rowSpan: 1,
              columnSpan: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: CaixaTexto(),
                  ),
                ],
              ),
            ),
            ExpandedGridContent(
              rowIndex: 2,
              columnIndex: 0,
              rowSpan: 7,
              columnSpan: 10,
              child: VSD(
                key: navBarData.conteudo[idText].key,
                imagem: navBarData.conteudo[idText].imagem,
                conteudoLista: navBarData.conteudo[idText].conteudoLista,
                hotspot: (texto, key) {
                  print('=====');
                  print(texto);
                  setState(() {
                    textoCaixa = texto;
                    keyText = key;
                  });
                },
                pontosReferencia: navBarData.conteudo[idText].pontosReferencia,
                estruturaBasica: EstruturaBasica(
                    //id: navBarData.conteudo[idText].id,
                    //mini: navBarData.conteudo[idText].mini,
                    // indexLinha: 2,
                    // indexColuna: 2,
                    // tamanhoNaColuna: 6,
                    // tamanhoNaLinha: 6,
                    //descricao: navBarData.conteudo[idText].descricao,
                    ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Const.kFAB(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
