import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geography/main.dart' show Routes;
import 'package:geography/screens/paywall_screen.dart';

class Mode {
  final String name;
  final String route;

  Mode(this.name, this.route);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Mode> modes = [
    Mode('Guess Flag (Europe)', Routes.europeanFlags),
    Mode('Guess Flag (Europe)', Routes.europeanFlags),
    Mode('Africa', Routes.africanFlags),
    Mode('Asia', Routes.asianFlags),
    Mode('Guess Name from Flags', Routes.flagsGuessNameFromFlags),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: const CupertinoNavigationBar(middle: Text('Guess a Flag')),
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.green[300],
              height: double.infinity,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...modes.map((item) {
                    return Card(
                      elevation: 5,
                      child: CupertinoButton(
                        child: Text(item.name),
                        onPressed:
                            () => Navigator.pushNamed(context, item.route),
                      ),
                    );
                  }),
                  Card(
                    elevation: 5,
                    child: CupertinoButton(
                      child: Text("Hearts"),
                      onPressed:
                          () => Navigator.pushNamed(context, Routes.hearts),
                    ),
                  ),
                  CupertinoTextField(
                    placeholder: "Hello",
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ],
              ),
            ),
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
