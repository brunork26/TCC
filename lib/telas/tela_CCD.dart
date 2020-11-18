import 'package:expanded_grid/expanded_grid.dart';
import 'package:flutter/material.dart';
import '../componentes/VSD.dart';
import '../constantes.dart' as Const;
import '../data/nav_bar_data.dart';
import '../componentes/nav_bar.dart';
import '../componentes/text_hotspots.dart';

// TelaCriancasComDeficiencia
class TelaCCD extends StatefulWidget {
  static const String id = 'TelaCCD';
  @override
  _TelaCCDState createState() => _TelaCCDState();
}

class _TelaCCDState extends State<TelaCCD> {
  NavBarData navBarData = NavBarData(
    conteudo: [
      VSD(
        id: 0,
        imagem: Const.kImgs[0],
        conteudoLista: null,
        indexLinha: 2,
        indexColuna: 2,
        tamanhoNaColuna: 6,
        tamanhoNaLinha: 6,
        descricao: 'Bolo',
      ),
      VSD(
        id: 1,
        imagem: Const.kImgs[1],
        conteudoLista: null,
        indexLinha: 2,
        indexColuna: 2,
        tamanhoNaColuna: 6,
        tamanhoNaLinha: 6,
        descricao: 'Casa',
      ),
      VSD(
        id: 2,
        imagem: Const.kImgs[2],
        conteudoLista: null,
        indexLinha: 2,
        indexColuna: 2,
        tamanhoNaColuna: 6,
        tamanhoNaLinha: 6,
        descricao: 'Comida',
      ),
      VSD(
        id: 3,
        imagem: Const.kImgs[3],
        conteudoLista: null,
        indexLinha: 2,
        indexColuna: 2,
        tamanhoNaColuna: 6,
        tamanhoNaLinha: 6,
        descricao: 'Futebol',
      ),
      VSD(
        id: 4,
        imagem: Const.kImgs[4],
        conteudoLista: null,
        indexLinha: 2,
        indexColuna: 2,
        tamanhoNaColuna: 6,
        tamanhoNaLinha: 6,
        descricao: 'Gatos',
      ),
      VSD(
        id: 5,
        imagem: Const.kImgs[5],
        conteudoLista: null,
        indexLinha: 2,
        indexColuna: 2,
        tamanhoNaColuna: 6,
        tamanhoNaLinha: 6,
        descricao: 'Video Game',
      ),
      VSD(
        id: 6,
        imagem: Const.kImgs[6],
        conteudoLista: null,
        indexLinha: 2,
        indexColuna: 2,
        tamanhoNaColuna: 6,
        tamanhoNaLinha: 6,
        descricao: 'Crianças',
      ),
      VSD(
        id: 7,
        imagem: Const.kImgs[7],
        conteudoLista: null,
        indexLinha: 2,
        indexColuna: 2,
        tamanhoNaColuna: 6,
        tamanhoNaLinha: 6,
        descricao: 'Hamburgers',
      ),
      VSD(
        id: 8,
        imagem: Const.kImgs[8],
        conteudoLista: null,
        indexLinha: 2,
        indexColuna: 2,
        tamanhoNaColuna: 6,
        tamanhoNaLinha: 6,
        descricao: 'Mudança',
      ),
      VSD(
        id: 9,
        imagem: Const.kImgs[9],
        conteudoLista: null,
        indexLinha: 2,
        indexColuna: 2,
        tamanhoNaColuna: 6,
        tamanhoNaLinha: 6,
        descricao: 'Bebê',
      ),
    ],
  );

  dynamic conteudoVisivel;
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
                    // conteudoVisivel.th ??
                    navBarData.conteudo[0].th),
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
