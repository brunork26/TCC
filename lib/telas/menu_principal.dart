import 'package:flutter/material.dart';
import 'package:tcc/componentes/botao_menu.dart';
import 'package:tcc/componentes/layout_basico_menu.dart';
import 'package:tcc/constantes.dart';
import 'package:tcc/telas/grade.dart';
import 'package:tcc/telas/inicio.dart';
import 'reordenavel.dart';

class MenuPrincipal extends StatefulWidget {
  static const String id = 'menu-principal';

  MenuPrincipal();
  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBasicoMenu(
          color: kAzulEscuro,
          botoesMenu: [
            BotaoMenu(
              text: 'Grid',
              color: kVerdeLimao,
              onPressed: () {
                Navigator.pushNamed(context, Grade.id);
              },
            ),
            BotaoMenu(
              text: 'Inicio',
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, Inicio.id);
              },
            ),
            BotaoMenu(
              text: 'CONTENT',
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, MyHomePage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
