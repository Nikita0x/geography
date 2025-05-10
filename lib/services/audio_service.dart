import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:universal_io/io.dart';

class MyAudioButton extends StatefulWidget {
  const MyAudioButton({super.key});

  @override
  State<MyAudioButton> createState() => _MyAudioButtonState();
}

class _MyAudioButtonState extends State<MyAudioButton> {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;
  double _volume = 0;

  Future<void> _playSound() async {
    try {
      if (_isPlaying) {
        await _player.stop();
        setState(() => _isPlaying = false);
        return;
      }

      await _player.setAsset('assets/sounds/theme.mp3');
      await _player.play();

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

  Future<void> setupAudio() async {
    // if (Platform.isLinux) {
    //   debugPrint("Linux. Sound is not available temporarily.");
    //   return;
    // }

    await _player.setAsset('assets/sounds/theme.mp3');
    await _player.setLoopMode(LoopMode.one);
    await _player.play();
  }

  @override
  void initState() {
    super.initState();
    _volume = _player.volume;
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(onTap: setupAudio, child: Text('play Audio')),
        ElevatedButton(
          onPressed: _playSound,
          // onPressed: setupAudio,
          child: Column(
            children: [
              Text(_isPlaying ? 'Stop Sound' : 'Play Sound'),
              Text('Duration: ${_player.duration}'),
              Slider(
                value: _volume,
                onChanged: (value) async {
                  setState(() {
                    _volume = value;
                  });
                  await _player.setVolume(value);
                  print('Volume set to: $value');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
