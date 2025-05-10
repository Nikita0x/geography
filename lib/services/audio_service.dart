import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MyAudioButton extends StatefulWidget {
  const MyAudioButton({super.key});

  @override
  State<MyAudioButton> createState() => _MyAudioButtonState();
}

class _MyAudioButtonState extends State<MyAudioButton> {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;

  Future<void> _playSound() async {
    try {
      if (_isPlaying) {
        await _player.stop();
        setState(() => _isPlaying = false);
        return;
      }

      await _player.setAsset('assets/sounds/theme.mp3'); // Load audio
      await _player.play(); // Play after loading
      setState(() => _isPlaying = true);

      // Update state when playback completes
      _player.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          setState(() => _isPlaying = false);
        }
      });
    } catch (e) {
      debugPrint("Audio error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Failed to play audio")));
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _playSound,
      child: Text(_isPlaying ? 'Stop Sound' : 'Play Sound'),
    );
  }
}
