import 'package:flutter/material.dart';
import 'package:tcc/modelo/ponto_referencia.dart';

class RetanguloPaint extends CustomPainter {
  PontoReferencia pr;

  RetanguloPaint({this.pr});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      new Rect.fromLTRB(pr.left, pr.top, pr.right, pr.bottom),
      new Paint()
        ..color = Colors.green
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5.0, //..color = new Color(0xFF0099FF),
    );
  }

  @override
  bool shouldRepaint(RetanguloPaint oldDelegate) {
    return false;
  }
}
