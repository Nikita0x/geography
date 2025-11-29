import 'dart:math' as math;

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
        child: Center(
          child: const SizedBox(
            width: 250,
            height: 250,
            child: PizzaWidget(sliceCount: 4),
          ),
        ),
      ),
    );
  }
}

class PizzaWidget extends StatelessWidget {
  const PizzaWidget({super.key, required this.sliceCount});

  final int sliceCount;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: PizzaPainter(sliceCount: sliceCount));
  }
}

class PizzaPainter extends CustomPainter {
  PizzaPainter({required this.sliceCount});

  final int sliceCount;

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = math.min(size.width, size.height) / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    final Paint basePaint =
        Paint()
          ..style = PaintingStyle.fill
          ..color = const Color(0xFFFFE0B2); // light pizza base

    canvas.drawCircle(center, radius, basePaint);

    final double sliceAngle = 2 * math.pi / sliceCount;
    final List<Color> colors = <Color>[
      Colors.redAccent,
      Colors.orangeAccent,
      Colors.yellowAccent,
      Colors.greenAccent,
      Colors.blueAccent,
      Colors.purpleAccent,
    ];

    for (int i = 0; i < sliceCount; i++) {
      final Paint slicePaint =
          Paint()
            ..style = PaintingStyle.fill
            ..color = colors[i % colors.length].withOpacity(0.8);

      final double startAngle = -math.pi / 2 + i * sliceAngle;

      final Path path =
          Path()
            ..moveTo(center.dx, center.dy)
            ..arcTo(
              Rect.fromCircle(center: center, radius: radius),
              startAngle,
              sliceAngle,
              false,
            )
            ..close();

      canvas.drawPath(path, slicePaint);
    }

    final Paint borderPaint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = Colors.brown.shade700;

    canvas.drawCircle(center, radius, borderPaint);
  }

  @override
  bool shouldRepaint(covariant PizzaPainter oldDelegate) {
    return oldDelegate.sliceCount != sliceCount;
  }
}
