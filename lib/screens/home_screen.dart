import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            const SizedBox(height: 20),
            CupertinoButton(
              child: const Text("Playground"),
              onPressed: () {
                Navigator.pushNamed(context, '/playground');
              },
            ),
            CupertinoButton(
              child: const Text("Test Button"),
              onPressed: () {
                Navigator.pushNamed(context, '/test');
              },
            ),
          ],
        ),
      ),
    );
  }
}
