import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  Offset position1 = Offset.zero;
  double rotation1 = 0.0;

  void _showModal() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          height: 700,
          width: double.infinity,
          color: Colors.green,
          child: Column(
            children: [
              Text('Hello Cupertino! 1'),
              CupertinoButton(
                child: Text('Закрыть'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Test')),
      child: Center(
        child: Stack(
          children: [
            GestureDetector(onTap: _showModal, child: Text("Click me")),
            GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  position1 += details.delta;
                  rotation1 += details.delta.dx * 0.01;
                });
              },
              child: Transform.translate(
                offset: position1,
                child: Transform.rotate(
                  angle: rotation1,
                  child: Container(width: 300, height: 500, color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
