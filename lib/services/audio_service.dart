import 'package:just_audio/just_audio.dart';

class AudioService {
  static final AudioService _instance = AudioService._internal();
  final AudioPlayer _player = AudioPlayer();
  bool _isInitialized = false;

  AudioService._internal();

  factory AudioService() => _instance;

  bool get isAlreadyPlaying => _isInitialized && _player.playing;

  Future<void> playBackgroundMusic() async {
    try {
      if (isAlreadyPlaying) {
        print('Music is already playing, not restarting');
        return;
      }

      // Set initialized FIRST to prevent duplicate calls
      _isInitialized = true;
      print('Initializing audio...');

      await _player.setAsset('assets/sounds/theme.mp3');
      await _player.setLoopMode(LoopMode.one);
      await _player.setVolume(0.10);
      await _player.play();

      print('Audio initialized and playing');
    } catch (e) {
      // If initialization fails, reset the flag
      _isInitialized = false;
      print('Audio error: $e');
      rethrow;
    }
  }

  Future<void> pauseMusic() async {
    if (_player.playing) {
      await _player.pause();
      print('Music paused');
      print('isInitialized: $_isInitialized');
    }
  }

  Future<void> resumeMusic() async {
    if (!_player.playing) {
      await _player.play();
      print('Music resumed');
      print('isInitialized: $_isInitialized');
    }
  }

  Future<void> stop() async {
    if (_player.playing) {
      await _player.stop();
      print('Music stopped');
      print('isInitialized: $_isInitialized');
    }
  }

  Future<void> dispose() async {
    if (_isInitialized) {
      await _player.dispose();
      _isInitialized = false;
      print('Audio service disposed');
    }
  }
}
