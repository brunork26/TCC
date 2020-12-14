import 'package:expanded_grid/expanded_grid.dart';
import 'package:flutter/material.dart';
import '../data/nav_bar_data.dart';
import '../componentes/nav_bar.dart';
import '../componentes/text_hotspots.dart';
import 'package:tcc/constantes.dart' as Const;
import 'package:tcc/data/estrutura_basica.dart';
import 'package:tcc/componentes/VSD.dart';
import '../dados.dart' as Dados;

// Tela sindrome de down
class TelaSDD extends StatefulWidget {
  static const String id = 'TelaSDD';
  @override
  _TelaSDDState createState() => _TelaSDDState();
}

class _TelaSDDState extends State<TelaSDD> {
  NavBarData navBarData = Dados.ccddata;
  int idText = 0;
  Widget textHotspotVisicel;
  String textoCaixa;
  Key keyText = Key('0');

  @override
  void initState() {
    navBarData = Dados.ccddata;
    idText = 0;

    super.initState();
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
              rowIndex: 8,
              columnIndex: 0,
              rowSpan: 2,
              columnSpan: 10,
              child: TextHotspots(
                key: keyText,
                mudaTexto: (texto) {
                  this.setState(() {
                    textoCaixa = texto;
                  });
                },
                texto: textoCaixa ?? navBarData.conteudo[idText].descricao,
              ),
            ),
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
              rowIndex: 2,
              columnIndex: 1,
              rowSpan: 6,
              columnSpan: 8,
              child: VSD(
                key: navBarData.conteudo[idText].key,
                imagem: navBarData.conteudo[idText].imagem,
                conteudoLista: null,
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
