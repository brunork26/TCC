import 'package:expanded_grid/expanded_grid.dart';
import 'package:flutter/material.dart';
import '../constantes.dart' as Const;
import '../dados.dart' as Dados;
import '../data/nav_bar_data.dart';
import '../componentes/nav_bar.dart';

class TelaCCDG extends StatefulWidget {
  static const String id = 'TelaCCDG';
  @override
  _TelaCCDGState createState() => _TelaCCDGState();
}

class _TelaCCDGState extends State<TelaCCDG> {
  NavBarData navBarData = Dados.ccdgdata;

  Widget conteudoVisivel;
  int idText = 0;
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
                          conteudoVisivel = navBarData.conteudo[id];
                          idText = id;
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
              columnIndex: 0,
              rowSpan: 8,
              columnSpan: 10,
              child: conteudoVisivel ?? navBarData.conteudo[0],
            ),
          ],
        ),
      ),
    );
  }
}
