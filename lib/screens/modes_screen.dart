import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class Mode {
  final String name;
  final String route;

  Mode(this.name, this.route);
}

class ModesScreen extends StatelessWidget {
  ModesScreen({super.key});

  List<Mode> modes = [
    Mode('Europe', '/flags/eu'),
    Mode('Africa', '/flags/afr'),
  ];

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
                      modes.map((item) {
                        return Card(
                          elevation: 5,
                          child: CupertinoButton(
                            child: Text(item.name),
                            onPressed:
                                () => Navigator.pushNamed(context, item.route),
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
