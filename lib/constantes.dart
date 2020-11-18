import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

// Widgets simples
BoxDecoration kBordaCircular = BoxDecoration(
  borderRadius: BorderRadius.circular(10.0),
  border: Border.all(color: Colors.black),
  color: Colors.white,
);

const kAzulEscuro = Color(0xFF0F2B5B);
const kVerdeLimao = Color(0xFFCEE007);
const kAzulClaro = Color(0xFF51B5E0);
const kLaranja = Color(0xFFF77F00);
const kVerdeMarcatexto = Color(0xFF00FF0A);

// ----- Imagens básicas

const List<String> kImgs = [
  './imagens/cake.jpg',
  './imagens/beach-house.jpg',
  './imagens/comendo.jpg',
  './imagens/futebol.jpg',
  './imagens/gatinhos.jpg',
  './imagens/controle-nintendo.jpg',
  './imagens/foto-familia.jpg',
  './imagens/hamburguer.jpg',
  './imagens/mudanca.jpg',
  './imagens/nene.jpg',
  './imagens/sala-tv.jpg',
  './imagens/tomando.jpg',
];

// Enum tipos widgets

enum TiposWidget {
  VSD,
  NAR_BAR,
  CARD_TABELA,
  LISTA_FRASES,
  POSICAO_GRID,
  PONTO_REFERENCIA,
  TEXT_HOTSPOTS,
}

// Componente do text to speach
FlutterTts kPlayTTS = FlutterTts();

// Imagens do sistema
const String kCaixaDeTexto = './assets/caixadetexto.png';

// Tamanhos de grid
const kTamanhosGrid = {"pequena": 6, "media": 8, "grande": 10};

// ----- Icones -----

// celula place holder
const Icon kCelulaPlaceHolder = Icon(Icons.crop_free);

const Icon kEngrenagem = Icon(
  Icons.settings,
  size: 70,
  color: Colors.black,
);
