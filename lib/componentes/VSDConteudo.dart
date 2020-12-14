import 'dart:ui';

import 'package:tcc/modelo/ponto_referencia.dart';
import 'package:tcc/data/estrutura_basica.dart';
import 'package:flutter/material.dart';
import '../componentes/mapa_imagem.dart';

class VSDConteudo extends StatefulWidget {
  final EstruturaBasica estruturaBasica;
  final String imagem;
  final List<PontoReferencia> regioes;
  final Key key;

  final void Function(String, Key) onTap;

  VSDConteudo({
    this.estruturaBasica,
    this.imagem,
    this.regioes,
    this.key,
    this.onTap,
  });

  VSDConteudoState vsdConteudoState;

  @override
  VSDConteudoState createState() {
    vsdConteudoState = VSDConteudoState(
        estruturaBasica: estruturaBasica,
        imagem: imagem,
        regioes: regioes,
        onTap: onTap);
    return vsdConteudoState;
  }

  static VSDConteudoState of(BuildContext context) =>
      context.findAncestorStateOfType<VSDConteudoState>();
}

class VSDConteudoState extends State<VSDConteudo> {
  final EstruturaBasica estruturaBasica;
  final String imagem;
  final List<PontoReferencia> regioes;
  final Key key;
  final void Function(String, Key) onTap;
  VSDConteudoState({
    this.estruturaBasica,
    this.imagem,
    this.regioes,
    this.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ImageMap(
          image: Image(
            image: AssetImage(imagem ?? './assets/cards/pronomes/default.png'),
          ),
          onTap: (texto, key) {
            setState(() {
              onTap(texto, key);
            });
          },
          regions: regioes,
        ),
      ),
    );
  }
}
