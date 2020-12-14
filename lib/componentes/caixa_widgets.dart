import 'package:flutter/material.dart';
import 'package:tcc/constantes.dart' as Const;
import 'package:tcc/data/estrutura_basica.dart';

class CaixaWidgets extends StatefulWidget {
  final EstruturaBasica estruturaBasica;
  CaixaWidgets({this.estruturaBasica});

  CaixaWidgetsState caixaWidgetsState;

  void adicionaWidget(Image imagem, String descricao) {
    caixaWidgetsState.adicionaWidget(imagem, descricao);
  }

  @override
  CaixaWidgetsState createState() {
    caixaWidgetsState = CaixaWidgetsState(estruturaBasica: estruturaBasica);
    return caixaWidgetsState;
  }

  static CaixaWidgetsState of(BuildContext context) =>
      context.findAncestorStateOfType<CaixaWidgetsState>();
}

class CaixaWidgetsState extends State<CaixaWidgets> {
  EstruturaBasica eb;
  List<Widget> lista = [];
  List<String> leitura = [];

  CaixaWidgetsState({estruturaBasica}) {
    eb = estruturaBasica;
  }

  void adicionaWidget(Image imagem, String descricao) {
    setState(() {
      leitura.add(descricao);
      lista.add(
        Expanded(
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: imagem == null ? 0 : 3,
                  child: imagem ?? Container(),
                ),
                Flexible(
                  //flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      descricao,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  void removeWidget() {
    setState(() {
      if (lista.length > 0) {
        leitura.removeLast();
        lista.removeLast();
      }
    });
  }

  void leFrase() {
    if (lista.length > 0) {
      String ler = '';
      for (int i = 0; i < leitura.length; i++) {
        ler += leitura[i] + ' ';
      }
      Const.kPlayTTS.speak(ler);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 100.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: lista,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: FlatButton(
                  onPressed: () {
                    removeWidget();
                  },
                  child: Icon(
                    Icons.skip_previous,
                    size: 28.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: FlatButton(
                  onPressed: () {
                    leFrase();
                  },
                  child: Icon(
                    Icons.play_arrow,
                    size: 28.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
class CaixaWidgets extends WidgetBasico {
  //final Function onTap;
  String texto;
  final Function(String) mudaTexto;
  List<Widget> widgets = [];
  CaixaWidgets({
    id,
    mini,
    indexLinha,
    indexColuna,
    tamanhoNaColuna,
    tamanhoNaLinha,
    this.texto,
    this.mudaTexto,
    //this.onTap,
  }) : super(
          id: id,
          mini: mini,
          tipo: TiposWidget.CAIXA_WIDGETS,
          indexLinha: indexLinha,
          indexColuna: indexColuna,
          tamanhoNaColuna: tamanhoNaColuna,
          tamanhoNaLinha: tamanhoNaLinha,
        );

  @override
  
}
*/
