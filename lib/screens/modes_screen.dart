import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ModesScreen extends StatelessWidget {
  ModesScreen({super.key});

  List modes = ['Europe'];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Select Mode')),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                // Wrap GridView with Expanded
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  padding: EdgeInsets.all(5),
                  children:
                      modes.map((flagOption) {
                        return Container(
                          color: Colors.blue,
                          child: CupertinoButton(
                            child: Text(
                              'Europe',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed:
                                () => {Navigator.pushNamed(context, '/flags')},
                          ),
                        );
                      }).toList(),
                ),
              ),

              // You can add more widgets here if necessary
            ],
          ),
        ),
      ),
    );
  }
}
