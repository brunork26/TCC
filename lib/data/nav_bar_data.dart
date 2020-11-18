import 'package:flutter/material.dart';

import 'estrutura_basica.dart';

class NavBarData extends EstruturaBasica {
  final List<dynamic> conteudo;
  NavBarData({id, mini, @required this.conteudo}) : super(id: id, mini: mini);
}
