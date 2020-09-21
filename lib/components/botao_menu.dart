import 'package:flutter/material.dart';

class BotaoMenu extends StatelessWidget {
  BotaoMenu({this.color, @required this.text, @required this.onPressed});

  final String text;
  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      margin: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: FlatButton(
        child: Text(
          text,
          style: TextStyle(fontSize: 22.0),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
