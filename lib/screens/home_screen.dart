import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geography/main.dart' show Routes;
import 'package:geography/screens/paywall_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: const CupertinoNavigationBar(middle: Text('Guess a Flag')),
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoButton(
                    color: Colors.blue[900],
                    child: const Text("Start Game"),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.modes);
                    },
                  ),
                  CupertinoButton(
                    color: Colors.red[900],
                    child: const Text("Playground"),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.playground);
                    },
                  ),
                  CupertinoButton(
                    color: Colors.green[900],
                    child: const Text("Test Button"),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.test);
                    },
                  ),
                  CupertinoButton(
                    color: Colors.purple[900],
                    child: const Text("Open Paywall"),
                    onPressed: () {
                      Navigator.of(context).push(PaywallRoute());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
