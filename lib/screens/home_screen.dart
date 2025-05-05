import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Cupertino App'),
      ),
      child: Center(
        child: CupertinoButton(
          child: const Text("Go to Settings"),
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
      ),
    );
  }
}
