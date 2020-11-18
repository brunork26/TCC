import 'package:flutter/material.dart';
import 'package:tcc/telas/menu_principal.dart';
import 'package:tcc/telas/tela_edicao.dart';
import 'package:tcc/telas/tela_CCD.dart';
import 'package:tcc/telas/tela_CCDG.dart';
import 'package:tcc/telas/tela_SDD.dart';
import 'package:tcc/telas/tela_adultos.dart';
import 'constantes.dart' as Const;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    Const.kPlayTTS.setLanguage('pt-BR');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: MenuPrincipal.id,
      routes: {
        MenuPrincipal.id: (context) => MenuPrincipal(),
        TelaEdicao.id: (context) => TelaEdicao(),
        TelaCCDG.id: (context) => TelaCCDG(),
        TelaCCD.id: (context) => TelaCCD(),
        TelaSDD.id: (context) => TelaSDD(),
        TelaAdultos.id: (context) => TelaAdultos(),
      },
    );
  }
}
