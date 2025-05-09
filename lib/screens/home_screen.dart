import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Guess a Flag')),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              child: const Text("Start Game"),
              onPressed: () {
                Navigator.pushNamed(context, '/modes');
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
