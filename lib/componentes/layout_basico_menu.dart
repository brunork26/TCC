import 'package:flutter/material.dart';
import 'package:tcc/componentes/botao_menu.dart';

class LayoutBasicoMenu extends StatelessWidget {
  LayoutBasicoMenu({this.color, @required this.botoesMenu});

  final Color color;
  final List<BotaoMenu> botoesMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: botoesMenu,
      ),
    );
  }
}
