import 'package:just_audio/just_audio.dart';

class CustomAudioPlayerr {
  static final _player = AudioPlayer();

  static Future<void> play({required String url}) async {
    try {
      await _player.setUrl(url);
      _player.play();
    } catch (e) {
      throw Exception('Failed to play audio: $e');
    }
  }

  static Future<void> stop() async {
    await _player.stop();
  }

  static Future<void> pause() async {
    await _player.pause();
  }
}
