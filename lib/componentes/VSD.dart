import 'package:flutter/material.dart';
import '../constantes.dart';
import 'widget_basico.dart';
import 'listaFrases.dart';
import 'package:tcc/constantes.dart' as Const;
import 'VSDConteudo.dart';
import 'text_hotspots.dart';

class VSD extends WidgetBasico {
  final String imagem;
  final List<String> conteudoLista;
  Widget th;
  Widget contemLista;
  List<Widget> linha = [];

  VSD({
    id,
    mini,
    tipo,
    indexLinha,
    indexColuna,
    tamanhoNaColuna,
    tamanhoNaLinha,
    descricao,
    @required this.imagem,
    @required this.conteudoLista,
  }) : super(
          id: id,
          mini: Image.asset(imagem),
          tipo: TiposWidget.VSD,
          indexLinha: indexLinha,
          indexColuna: indexColuna,
          tamanhoNaColuna: tamanhoNaColuna,
          tamanhoNaLinha: tamanhoNaLinha,
          descricao: descricao,
        ) {
    if (conteudoLista == null) {
      contemLista = Container(
        child: null,
      );
    } else {
      contemLista = ListaFrases(conteudo: conteudoLista);
    }
    th = cria(descricao);
  }

  Widget cria(String descricao) {
    print('teste');
    return TextHotspots(
      // mudaTexto: (texto) {
      //   setState(() {
      //     print(texto);
      //     textoCaixa = texto;
      //   });
      // },
      texto: descricao,
    );
  }

  @override
  Widget build(BuildContext context) {
    linha = [
      Expanded(
        flex: 3,
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: Const.kBordaCircular,
          child: VSDConteudo(
            imagem: imagem,
          ),
        ),
      ),
      contemLista
    ];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: linha,
    );
  }
}
