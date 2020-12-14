import 'package:flutter/material.dart';
import 'package:tcc/data/estrutura_basica.dart';
import 'package:tcc/modelo/ponto_referencia.dart';
import 'listaFrases.dart';
import 'package:tcc/constantes.dart' as Const;
import 'VSDConteudo.dart';
import 'text_hotspots.dart';

class VSD extends StatefulWidget {
  final EstruturaBasica estruturaBasica;
  final String imagem;
  final List<String> conteudoLista;
  final List<PontoReferencia> pontosReferencia;
  String text = '';

  final Key key;

  final void Function(String, Key) hotspot;

  VSD({
    this.estruturaBasica,
    this.imagem,
    this.conteudoLista,
    this.key,
    this.pontosReferencia,
    this.hotspot,
  });

  VSDState vsdState;

  @override
  VSDState createState() {
    vsdState = VSDState(
      text: text,
      estruturaBasica: estruturaBasica,
      imagem: imagem,
      conteudoLista: conteudoLista,
      pontosReferencia: pontosReferencia,
      hotspot: hotspot,
      //textHotspots: textHotspots,
    );
    return vsdState;
  }

  TextHotspots hotspotsWidget() {
    return vsdState.hotspotsWidget();
  }

  static VSDState of(BuildContext context) =>
      context.findAncestorStateOfType<VSDState>();
}

class VSDState extends State<VSD> {
  final String imagem;
  final Key key;
  final List<String> conteudoLista;
  final EstruturaBasica estruturaBasica;
  final List<PontoReferencia> pontosReferencia;
  final void Function(String, Key) hotspot;
  final TextHotspots textHotspots;
  Widget _contemLista;
  List<Widget> linha = [];
  String text = '';

  VSDState({
    text,
    this.estruturaBasica,
    this.imagem,
    this.conteudoLista,
    this.key,
    this.pontosReferencia,
    this.hotspot,
    this.textHotspots,
  }) {
    if (conteudoLista == null) {
      _contemLista = Container(
        child: null,
      );
    } else {
      _contemLista = ListaFrases(conteudo: conteudoLista);
    }
    //th = cria(estruturaBasica.descricao);
  }

  @override
  void initState() {
    super.initState();
  }

  TextHotspots hotspotsWidget() {
    return TextHotspots(
      key: Key('t2'),
      mudaTexto: (texto) {
        this.setState(() {});
      },
      texto: text,
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
            key: key,
            regioes: pontosReferencia,
            onTap: (texto, key) {
              this.setState(() {
                text = texto;
                hotspot(text, key);
                print(text);
              });
            },
            imagem: this.imagem,
          ),
        ),
      ),
      _contemLista
    ];
    return Row(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: linha,
    );
  }
}
