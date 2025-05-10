import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../services/audio_service.dart';
import 'package:geography/services/audio_service.dart';
import 'package:universal_io/io.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _audioService = AudioService();

  @override
  void initState() {
    if (!kIsWeb) {
      _audioService.playBackgroundMusic();
    }

    super.initState();
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Guess a Flag')),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              child: Text('pause music'),
              onPressed: () {
                _audioService.pauseMusic();
              },
            ),
            CupertinoButton(
              child: Text('resume music'),
              onPressed: () {
                _audioService.resumeMusic();
              },
            ),
            CupertinoButton(
              child: Text('stop music'),
              onPressed: () {
                _audioService.stop();
              },
            ),
            CupertinoButton(
              child: const Text("Start Game"),
              onPressed: () async {
                Navigator.pushNamed(context, '/modes');
                if (!_audioService.isAlreadyPlaying) {
                  await _audioService.playBackgroundMusic();
                }
              },
            ),
            CupertinoButton(
              child: const Text("Playground"),
              onPressed: () {
                Navigator.pushNamed(context, '/playground');
              },
            ),
          ],
        ),
      ),
    );
  }
}
