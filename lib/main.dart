import 'package:flutter/material.dart';
import 'package:tcc/telas/menu_principal.dart';
import 'package:tcc/telas/grade.dart';
import 'package:tcc/telas/inicio.dart';
import 'package:tcc/telas/reordenavel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: MenuPrincipal.id,
      routes: {
        MenuPrincipal.id: (context) => MenuPrincipal(),
        Grade.id: (context) => Grade(),
        Inicio.id: (context) => Inicio(),
        MyHomePage.id: (context) => MyHomePage(),
      },
    );
  }
}
