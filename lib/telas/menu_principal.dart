import 'package:flutter/material.dart';
import 'package:tcc/componentes/botao_menu.dart';
import 'package:tcc/componentes/layout_basico_menu.dart';
import 'package:tcc/constantes.dart';

class MenuPrincipal extends StatefulWidget {
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
              text: 'CONTENT',
              color: kVerdeLimao,
              onPressed: () {
                print('green');
              },
            ),
            BotaoMenu(
              text: 'CONTENT',
              color: Colors.green,
              onPressed: () {
                print('green');
              },
            ),
            BotaoMenu(
              text: 'CONTENT',
              color: Colors.green,
              onPressed: () {
                print('green');
              },
            ),
          ],
        ),
      ),
    );
  }
}
