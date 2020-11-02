import 'package:flutter/material.dart';

class BoxTeste extends StatelessWidget {
  BoxTeste({this.color, this.width, this.height});
  final Color color;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}
