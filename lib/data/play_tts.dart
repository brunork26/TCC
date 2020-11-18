// import 'dart:async';
// import 'dart:io' show Platform;
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter_tts/flutter_tts.dart';

// enum TtsState { playing, stopped, paused, continued }

// class PlayTTS {
//   FlutterTts flutterTts;
//   dynamic languages;
//   String language;
//   double volume = 0.5;
//   double pitch = 1.0;
//   double rate = 0.5;

//   // cria como singleton
//   static final PlayTTS _tts = PlayTTS._internal();
//   PlayTTS._internal();
//   static PlayTTS get instance => _tts;

//   // inicia em stopped
//   TtsState ttsState = TtsState.stopped;

//   get isPlaying => ttsState == TtsState.playing;

//   get isStopped => ttsState == TtsState.stopped;

//   get isPaused => ttsState == TtsState.paused;

//   get isContinued => ttsState == TtsState.continued;

//   initState() {
//     initTts();
//   }

//   initTts() {
//     flutterTts = FlutterTts();

//     _getLanguages();

//     if (!kIsWeb) {
//       if (Platform.isAndroid) {
//         _getEngines();
//       }
//     }

//     flutterTts.setStartHandler(() {
//       print("Playing");
//       ttsState = TtsState.playing;
//     });

//     flutterTts.setCompletionHandler(() {
//       print("Complete");
//       ttsState = TtsState.stopped;
//     });

//     flutterTts.setCancelHandler(() {
//       print("Cancel");
//       ttsState = TtsState.stopped;
//     });

//     if (kIsWeb || Platform.isIOS) {
//       flutterTts.setPauseHandler(() {
//         print("Paused");
//         ttsState = TtsState.paused;
//       });

//       flutterTts.setContinueHandler(() {
//         print("Continued");
//         ttsState = TtsState.continued;
//       });
//     }

//     flutterTts.setErrorHandler((msg) {
//       print("error: $msg");
//       ttsState = TtsState.stopped;
//     });
//   }

//   Future _getLanguages() async {
//     languages = await flutterTts.getLanguages;
//     if (languages != null) () => languages;
//   }

//   Future _getEngines() async {
//     var engines = await flutterTts.getEngines;
//     if (engines != null) {
//       for (dynamic engine in engines) {
//         print(engine);
//       }
//     }
//   }

//   Future speak(String newVoiceText) async {
//     await flutterTts.setVolume(volume);
//     await flutterTts.setSpeechRate(rate);
//     await flutterTts.setPitch(pitch);

//     print('speak');

//     if (newVoiceText != null) {
//       if (newVoiceText.isNotEmpty) {
//         await flutterTts.awaitSpeakCompletion(true);
//         await flutterTts.speak(newVoiceText);
//       }
//     }
//   }

//   Future _stop() async {
//     var result = await flutterTts.stop();
//     if (result == 1) () => ttsState = TtsState.stopped;
//   }

//   Future _pause() async {
//     var result = await flutterTts.pause();
//     if (result == 1) () => ttsState = TtsState.paused;
//   }

//   @override
//   void dispose() {
//     flutterTts.stop();
//   }
// }
