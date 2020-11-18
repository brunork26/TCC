import 'package:flutter/material.dart';
import '../componentes/VSD.dart';
import '../componentes/nav_bar.dart';
import '../componentes/tabela_wigets.dart';
import '../data/nav_bar_data.dart';
import '../componentes/caixa_texto.dart';
import '../componentes/cartao_tabela.dart';
import 'package:tcc/constantes.dart' as Const;

class TelaAdultos extends StatefulWidget {
  static const String id = 'TesteWidgets';
  @override
  _TelaAdultosState createState() => _TelaAdultosState();
}

class _TelaAdultosState extends State<TelaAdultos> {
  NavBarData navBarData = NavBarData(
    id: 1,
    mini: null,
    conteudo: [
      TabelaWidget(
        id: 4,
        imagem: Const.kImgs[4],
        conteudoLista: [
          // linha 1
          CartaoTabela(
            imagem: Image.asset(Const.kImgs[4]),
            texto: 'teste',
            tamanhoNaColuna: 2,
            tamanhoNaLinha: 2,
            indexLinha: 0,
            indexColuna: 0,
          ),
          CartaoTabela(
            imagem: Image.asset(Const.kImgs[4]),
            texto: 'teste',
            tamanhoNaColuna: 2,
            tamanhoNaLinha: 2,
            indexLinha: 0,
            indexColuna: 2,
          ),
          CartaoTabela(
            imagem: Image.asset(Const.kImgs[4]),
            texto: 'teste',
            tamanhoNaColuna: 2,
            tamanhoNaLinha: 2,
            indexLinha: 0,
            indexColuna: 4,
          ),
          CartaoTabela(
            imagem: Image.asset(Const.kImgs[4]),
            texto: 'teste',
            tamanhoNaColuna: 2,
            tamanhoNaLinha: 2,
            indexLinha: 0,
            indexColuna: 6,
          ),
          CartaoTabela(
            imagem: Image.asset(Const.kImgs[4]),
            texto: 'teste',
            tamanhoNaColuna: 2,
            tamanhoNaLinha: 2,
            indexLinha: 0,
            indexColuna: 8,
          ),
          // linha 2
          CartaoTabela(
            imagem: Image.asset(Const.kImgs[4]),
            texto: 'teste',
            tamanhoNaColuna: 2,
            tamanhoNaLinha: 2,
            indexLinha: 2,
            indexColuna: 0,
          ),
          CartaoTabela(
            imagem: Image.asset(Const.kImgs[4]),
            texto: 'teste',
            tamanhoNaColuna: 2,
            tamanhoNaLinha: 2,
            indexLinha: 2,
            indexColuna: 2,
          ),
          CartaoTabela(
            imagem: Image.asset(Const.kImgs[4]),
            texto: 'teste',
            tamanhoNaColuna: 2,
            tamanhoNaLinha: 2,
            indexLinha: 2,
            indexColuna: 4,
          ),
          CartaoTabela(
            imagem: Image.asset(Const.kImgs[4]),
            texto: 'teste',
            tamanhoNaColuna: 2,
            tamanhoNaLinha: 2,
            indexLinha: 2,
            indexColuna: 6,
          ),
          CartaoTabela(
            imagem: Image.asset(Const.kImgs[4]),
            texto: 'teste',
            tamanhoNaColuna: 2,
            tamanhoNaLinha: 2,
            indexLinha: 2,
            indexColuna: 8,
          ),

          // linha 3
          CartaoTabela(
            imagem: Image.asset(Const.kImgs[4]),
            texto: 'teste',
            tamanhoNaColuna: 2,
            tamanhoNaLinha: 2,
            indexLinha: 4,
            indexColuna: 0,
          ),
          CartaoTabela(
            imagem: Image.asset(Const.kImgs[4]),
            texto: 'teste',
            tamanhoNaColuna: 2,
            tamanhoNaLinha: 2,
            indexLinha: 4,
            indexColuna: 2,
          ),
          CartaoTabela(
            imagem: Image.asset(Const.kImgs[4]),
            texto: 'teste',
            tamanhoNaColuna: 2,
            tamanhoNaLinha: 2,
            indexLinha: 4,
            indexColuna: 4,
          ),
          CartaoTabela(
            imagem: Image.asset(Const.kImgs[4]),
            texto: 'teste',
            tamanhoNaColuna: 2,
            tamanhoNaLinha: 2,
            indexLinha: 4,
            indexColuna: 6,
          ),
          CartaoTabela(
            imagem: Image.asset(Const.kImgs[4]),
            texto: 'teste',
            tamanhoNaColuna: 2,
            tamanhoNaLinha: 2,
            indexLinha: 4,
            indexColuna: 8,
          ),
        ],
      ),
      VSD(
        id: 0,
        imagem: Const.kImgs[0],
        conteudoLista: null,
      ),
      VSD(
        id: 1,
        imagem: Const.kImgs[1],
        conteudoLista: null,
      ),
      VSD(
        id: 2,
        imagem: Const.kImgs[2],
        conteudoLista: [
          'A comida estava ótima',
          'Estou com fome!',
          'Quando é o almoço?'
        ],
      ),
      VSD(
        id: 3,
        imagem: Const.kImgs[3],
        conteudoLista: [
          'Quanto foi o jogo hoje?',
          'Quero jogar bola!',
          'A que horas é o jogo hoje?',
          'Quem ganhou?'
        ],
      )
    ],
  );
  Widget conteudoVisivel;
  Widget _corpoTesteWidgets() {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavBar(
              selecionaVSD: (id) {
                setState(() {
                  conteudoVisivel = navBarData.conteudo[id];
                });
              },
              data: navBarData,
            ),
            Expanded(
              child: conteudoVisivel ?? navBarData.conteudo[0],
            ),
            CaixaTexto(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _corpoTesteWidgets(),
      ),
    );
  }
}
