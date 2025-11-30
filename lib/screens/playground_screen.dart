import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:geography/components/background.dart';
import 'package:signals/signals_flutter.dart';

class PlaygroundScreen extends StatefulWidget {
  const PlaygroundScreen({super.key});

  @override
  State<PlaygroundScreen> createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> {
  final hearts = signal(3);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [PlaygroundBackground(), SafeArea(child: Text('hello'))],
    );
  }
}
