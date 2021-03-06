import 'widget_basico.dart';
import 'package:tcc/constantes.dart' as Const;
import 'package:flutter/material.dart';

class ListaFrases extends WidgetBasico {
  final List<String> conteudo;
  ListaFrases({
    id,
    mini,
    this.conteudo,
  }) : super(id: id, mini: mini);

  Widget botaoLista(String frase) {
    return Expanded(
      child: ButtonTheme(
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.black),
        ),
        child: FlatButton(
          onPressed: () {
            Const.kPlayTTS.speak(frase);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    frase,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.play_circle_outline,
                size: 28.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> conteudoWidget() {
    List<Widget> list = [];
    for (int i = 0; i < conteudo.length; i++) {
      list.add(botaoLista(conteudo[i]));
      list.add(SizedBox(height: 5));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        //width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: conteudoWidget(),
        ),
      ),
    );
  }
}
