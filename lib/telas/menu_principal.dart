import 'package:flutter/material.dart';
import 'package:tcc/componentes/botao_menu.dart';
import 'package:tcc/componentes/layout_basico_menu.dart';
import 'package:tcc/constantes.dart';
import 'tela_edicao.dart';
import 'tela_adultos.dart';
import 'tela_CCD.dart';
import 'tela_CCDG.dart';
import 'tela_SDD.dart';

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
              text: 'Crie seu Layout',
              color: kVerdeLimao,
              onPressed: () {
                Navigator.pushNamed(context, TelaEdicao.id);
              },
            ),
            BotaoMenu(
              text: 'Tela Criancas Com Deficiência',
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, TelaCCD.id);
              },
            ),
            BotaoMenu(
              text: 'Tela para Crianças com Síndrome de Down',
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, TelaSDD.id);
              },
            ),
            BotaoMenu(
              text: 'Tela Criancas Com Deficiência (Grid)',
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, TelaCCDG.id);
              },
            ),
            BotaoMenu(
              text: 'Layout para Adultos',
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, TelaAdultos.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
