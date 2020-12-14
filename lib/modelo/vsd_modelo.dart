import 'package:tcc/modelo/info_basica.dart';
import 'ponto_referencia.dart';

class VSDModelo extends InfoBasica {
  final String imagem;
  final List<String> conteudoLista;
  final List<PontoReferencia> pontosReferencia;

  final void Function(String) hotspot;

  VSDModelo({
    key,
    tipo,
    id,
    mini,
    indexLinha,
    indexColuna,
    tamanhoNaLinha,
    tamanhoNaColuna,
    descricao,
    this.imagem,
    this.conteudoLista,
    this.pontosReferencia,
    this.hotspot,
  }) : super(
          key: key,
          tipo: tipo,
          id: id,
          mini: mini,
          indexLinha: indexLinha,
          indexColuna: indexColuna,
          tamanhoNaLinha: tamanhoNaLinha,
          tamanhoNaColuna: tamanhoNaColuna,
          descricao: descricao,
        );
}
