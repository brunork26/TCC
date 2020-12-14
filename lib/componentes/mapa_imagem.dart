import 'package:flutter/material.dart';
import 'package:tcc/componentes/retangulo_paint.dart';
import '../modelo/ponto_referencia.dart';

class ImageMap extends StatelessWidget {
  const ImageMap({
    Key key,
    @required this.image,
    @required this.onTap,
    @required this.regions,
  }) : super(key: key);

  final Widget image;
  final List<PontoReferencia> regions;

  /// Callback that will be invoked with the index of the tapped region.
  final void Function(String, Key) onTap;

  void _onTap(BuildContext context, Offset globalPosition) {
    RenderObject renderBox = context.findRenderObject();
    if (renderBox is RenderBox) {
      final localPosition = renderBox.globalToLocal(globalPosition);
      print(localPosition);
      for (int i = 0; i < regions.length; i++) {
        if (regions[i].contains(localPosition)) {
          onTap(regions[i].text, regions[i].key);
        }
      }
    }
  }

  List<Widget> constroi(context) {
    if (regions == null) return [];
    List<Widget> lista = [
      GestureDetector(
        onTapDown: (details) => _onTap(context, details.globalPosition),
        child: image,
      ),
    ];
    for (int i = 0; i < regions.length; i++) {
      lista.add(Container(
        child: CustomPaint(
          painter: RetanguloPaint(
            pr: regions[i],
          ),
        ),
      ));
    }
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: constroi(context),
    );
  }
}

// dia 9/12 18h
// [

//         Container(
//           // width: 50,
//           // height: 50,
//           child: CustomPaint(
//             painter: (RetanguloPaint(
//               pr: PontoReferencia.fromPoints(
//                 Offset(0.0, 0.0),
//                 Offset(100.0, 100.0),
//                 'Morango',
//                 Key('P0'),
//               ),
//             )),
//           ),
//         ),
//       ],
