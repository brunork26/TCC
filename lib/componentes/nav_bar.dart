import 'package:flutter/material.dart';
import '../data/nav_bar_data.dart';
import 'widget_basico.dart';
import 'package:tcc/constantes.dart';
import '../data/estrutura_basica.dart';

class NavBar extends StatefulWidget {
  final EstruturaBasica estruturaBasica;
  final double width;
  final double height;
  final NavBarData data;
  final Function(int) selecionaVSD;

  NavBar(
      {this.estruturaBasica,
      this.width,
      this.height,
      this.data,
      this.selecionaVSD});

  NavBarState navBarState;

  @override
  NavBarState createState() {
    navBarState = NavBarState(
      estruturaBasica: estruturaBasica,
      data: data,
      selecionaVSD: selecionaVSD,
      width: width,
      height: height,
    );
    return navBarState;
  }

  static NavBarState of(BuildContext context) =>
      context.findAncestorStateOfType<NavBarState>();
}

class NavBarState extends State<NavBar> {
  final double width;
  final double height;
  final NavBarData data;
  final Function(int) selecionaVSD;
  final EstruturaBasica estruturaBasica;

  final List<Widget> widgets = [];
  int selecionado;
  NavBarState(
      {this.estruturaBasica,
      this.data,
      this.selecionaVSD,
      this.height,
      this.width}) {
    selecionado = 0;
    for (int i = 0; i < data.conteudo.length; i++) {
      widgets.add(
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                selecionaVSD(i);
                selecionado = i;
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: data.conteudo[i].mini,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        data.conteudo[i].descricao ?? '',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widgets,
      ),
    );
  }
}
