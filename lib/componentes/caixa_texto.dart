import 'package:flutter/material.dart';
import 'package:tcc/constantes.dart' as Const;
import 'widget_basico.dart';

class CaixaTexto extends WidgetBasico {
  final _controller = TextEditingController();
  CaixaTexto({
    id,
    mini,
    indexLinha,
    indexColuna,
    tamanhoNaColuna,
    tamanhoNaLinha,
  }) : super(
          id: id,
          mini: Image.asset(Const.kCaixaDeTexto),
          indexLinha: indexLinha,
          indexColuna: indexColuna,
          tamanhoNaColuna: tamanhoNaColuna,
          tamanhoNaLinha: tamanhoNaLinha,
        );

  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      //width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: TextField(
                controller: _controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Escreva aqui',
                ),
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: FlatButton(
                onPressed: () {
                  Const.kPlayTTS.speak(_controller.text);
                },
                child: Icon(
                  Icons.play_circle_outline,
                  size: 28.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
