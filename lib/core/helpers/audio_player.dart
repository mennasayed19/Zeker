import 'package:audioplayers/audioplayers.dart';

class CustomAudioPlayer {
  static final player = AudioPlayer();

  static Future<void> play({required String url}) async {
    await player.play(UrlSource(url));
  }

  static Future<void> stop() async {
    await player.stop();
  }
  static Future<void> pause() async {
    await player.pause();
  }
}
