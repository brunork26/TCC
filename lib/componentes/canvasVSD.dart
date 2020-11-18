import 'package:flutter/material.dart';
import 'package:tcc/constantes.dart' as Const;

class CanvasVSD extends StatelessWidget {
  final Widget conteudo;

  CanvasVSD({@required this.conteudo});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Const.kBordaCircular,
      margin: EdgeInsets.all(10),
      child: conteudo,
    );
  }
}
