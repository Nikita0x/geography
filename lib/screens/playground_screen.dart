import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:geography/stores/app_store.dart';
import 'package:signals/signals_flutter.dart';

class PlaygroundScreen extends StatefulWidget {
  const PlaygroundScreen({super.key});

  @override
  State<PlaygroundScreen> createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Playground')),
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.yellow, Colors.blue, Colors.green],
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  child: Watch(
                    (context) => Text(
                      "click me. Current counter: ${appStore.counter.value}",
                    ),
                  ),
                  onTap: () {
                    appStore.counter.value++;
                    print("${appStore.counter.value}");
                  },
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(color: Colors.black, width: 50, height: 50),
              ),
              Align(
                alignment: Alignment(-0.8, -0.9),
                child: Container(color: Colors.green, width: 50, height: 50),
              ),
              Align(
                alignment: Alignment(-0.6, -0.8),
                child: Container(color: Colors.green, width: 50, height: 50),
              ),
              Align(
                alignment: Alignment(-0.4, -0.7),
                child: Container(color: Colors.orange, width: 50, height: 50),
              ),
              Align(
                alignment: Alignment(-0.2, -0.6),
                child: Container(color: Colors.blue, width: 50, height: 50),
              ),
              Align(
                alignment: Alignment(0, -0.5),
                child: Container(color: Colors.red, width: 50, height: 50),
              ),
              Align(
                alignment: Alignment(0.2, -0.4),
                child: Container(color: Colors.blueGrey, width: 50, height: 50),
              ),
              Align(
                alignment: Alignment(0.4, -0.3),
                child: Container(
                  color: Colors.greenAccent,
                  width: 50,
                  height: 50,
                ),
              ),
              Align(
                alignment: Alignment(0.6, -0.2),
                child: Container(color: Colors.purple, width: 50, height: 50),
              ),
              Align(
                alignment: Alignment(0.8, -0.1),
                child: Container(
                  color: Colors.deepOrangeAccent,
                  width: 50,
                  height: 50,
                ),
              ),
              Align(
                alignment: Alignment(1, 0),
                child: Container(color: Colors.red, width: 50, height: 50),
              ),
              Align(
                alignment: Alignment(0.8, 0.1),
                child: Container(
                  color: Colors.cyanAccent,
                  width: 50,
                  height: 50,
                ),
              ),
              Align(
                alignment: Alignment(0.6, 0.2),
                child: Container(
                  color: Colors.deepPurpleAccent,
                  width: 50,
                  height: 50,
                ),
              ),

              Align(
                alignment: Alignment(0.4, 0.3),
                child: Container(color: Colors.lime, width: 50, height: 50),
              ),
              Align(
                alignment: Alignment(0.2, 0.4),
                child: Container(
                  color: Colors.pinkAccent,
                  width: 50,
                  height: 50,
                ),
              ),
              Align(
                alignment: Alignment(0, 0.5),
                child: Container(color: Colors.black, width: 50, height: 50),
              ),
              Align(
                alignment: Alignment(-0.2, 0.6),
                child: Container(color: Colors.blue, width: 50, height: 50),
              ),
              Align(
                alignment: Alignment(-0.4, 0.7),
                child: Container(
                  color: Colors.amberAccent,
                  width: 50,
                  height: 50,
                ),
              ),
              Align(
                alignment: Alignment(-0.6, 0.8),
                child: Container(color: Colors.brown, width: 50, height: 50),
              ),
              Align(
                alignment: Alignment(-0.8, 0.9),
                child: Container(
                  color: Colors.indigoAccent,
                  width: 50,
                  height: 50,
                ),
              ),
              Align(
                alignment: Alignment(-1, 1),
                child: Container(
                  color: Colors.redAccent,
                  width: 50,
                  height: 50,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Align within a Stack'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
