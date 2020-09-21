import 'package:flutter/material.dart';
import 'package:tcc/constantes.dart';

class BotaoMenu extends StatelessWidget {
  BotaoMenu({this.color, @required this.text, @required this.onPressed});

  final String text;
  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: FlatButton(
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        color: color,
        child: Text(
          text,
          style: TextStyle(fontSize: 22.0),
        ),
        onPressed: onPressed,
        highlightColor: kLaranja,
      ),
    );
  }
}

/*
Container(
      height: 80.0,
      margin: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
 */
