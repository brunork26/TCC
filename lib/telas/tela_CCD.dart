import 'package:expanded_grid/expanded_grid.dart';
import 'package:flutter/material.dart';
import '../componentes/VSD.dart';
import '../constantes.dart' as Const;
import '../data/nav_bar_data.dart';
import '../componentes/nav_bar.dart';
import '../componentes/text_hotspots.dart';
import '../dados.dart' as Dados;

// TelaCriancasComDeficiencia
class TelaCCD extends StatefulWidget {
  static const String id = 'TelaCCD';
  @override
  _TelaCCDState createState() => _TelaCCDState();
}

class _TelaCCDState extends State<TelaCCD> {
  NavBarData navBarData = Dados.ccddata;

  Widget conteudoVisivel;
  int idText = 0;
  VSD teste;
  String textoCaixa;
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
                child:
                    //TextHotspots(
                    // mudaTexto: (texto) {
                    //   setState(() {
                    //     print(texto);
                    //     textoCaixa = texto;
                    //   });
                    // },
                    //  texto: 'Teste',
                    //),
                    navBarData.conteudo[idText].th),
            ExpandedGridContent(
              rowIndex: 8,
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
                          conteudoVisivel = navBarData.conteudo[id];
                          idText = id;
                          teste = conteudoVisivel;
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
              child: conteudoVisivel ?? navBarData.conteudo[0],
            )
          ],
        ),
      ),
    );
  }
}
