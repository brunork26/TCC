import 'package:flutter/material.dart';
import '../componentes/grid.dart';
import 'package:tcc/constantes.dart' as Const;
import '../constantes.dart';
import '../data/estrutura_basica.dart';

class TelaEdicao extends StatefulWidget {
  static const String id = 'TelaEdicao';
  @override
  _TelaEdicaoState createState() => _TelaEdicaoState();
}

class _TelaEdicaoState extends State<TelaEdicao> {
  _TelaEdicaoState();

  Grid gridStateController;

  @override
  void initState() {
    super.initState();
    gridStateController = Grid(
      tamanhoColuna: Const.kTamanhosGrid['grande'],
      tamanhoLinha: Const.kTamanhosGrid['grande'],
    );
  }

  void _showCustomMenu() {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 100, 100, 100),
      items: [
        PopupMenuItem(
          child: Text("Add VSD"),
          value: EstruturaBasica(
              tipo: TiposWidget.VSD,
              tamanhoNaLinha: 7,
              tamanhoNaColuna: 7), // TiposWidget.VSD,
        ),
        PopupMenuItem(
          child: Text("Add Nav_bar"),
          value: EstruturaBasica(
              tipo: TiposWidget.NAR_BAR,
              tamanhoNaLinha: 2,
              tamanhoNaColuna: 10),
        ),
        PopupMenuItem(
          child: Text("Add Card_Tabela"),
          value: EstruturaBasica(
              tipo: TiposWidget.CARD_TABELA,
              tamanhoNaLinha: 2,
              tamanhoNaColuna: 1),
        ),
        PopupMenuItem(
          child: Text("Add Lista_Frases"),
          value: EstruturaBasica(
              tipo: TiposWidget.LISTA_FRASES,
              tamanhoNaLinha: 2,
              tamanhoNaColuna: 10),
        ),
      ],
      elevation: 8.0,
    )
        // This is how you handle user selection
        .then<void>((EstruturaBasica tipo) {
      gridStateController.adicionaWidget(tipo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 100,
            ),
            Expanded(
              child: gridStateController,
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 100,
        width: 100,
        child: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
            _showCustomMenu();
          },
          child: kEngrenagem,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
