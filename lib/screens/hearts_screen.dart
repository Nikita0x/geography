import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeartsScreen extends StatefulWidget {
  const HeartsScreen({super.key});

  @override
  State<HeartsScreen> createState() => _HeartsScreenState();
}

class _HeartsScreenState extends State<HeartsScreen> {
  int currentPage = 0;
  bool isOverlayVisible = false;
  double burnProgress = 0;

  Widget _buildInnerPage() {
    switch (currentPage) {
      case 0:
        return Container(
          key: const ValueKey<int>(0),
          color: Colors.white,
          alignment: Alignment.center,
          child: const Text(
            'Экран 1\n(базовый)',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
        );
      case 1:
        return Container(
          key: const ValueKey<int>(1),
          color: Colors.lightBlue[50],
          alignment: Alignment.center,
          child: const Text(
            'Экран 2\n(другой фон)',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
        );
      case 2:
        return Container(
          key: const ValueKey<int>(2),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepOrange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          alignment: Alignment.center,
          child: const Text(
            'Экран 3\n(градиент)',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Hearts')),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.favorite),
                  Icon(Icons.favorite),
                  Icon(Icons.favorite),
                  Icon(Icons.favorite_outline),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BurnClipper extends CustomClipper<Path> {
  BurnClipper({required this.progress});

  final double progress;

  @override
  Path getClip(Size size) {
    final Path path = Path();

    // progress 0.0 -> всё видно, 1.0 -> всё "сгорело" (ничего не видно)
    final double burnHeight = size.height * (1 - progress.clamp(0, 1));

    path.addRect(Rect.fromLTWH(0, 0, size.width, burnHeight));
    return path;
  }

  @override
  bool shouldReclip(covariant BurnClipper oldClipper) {
    return oldClipper.progress != progress;
  }
}

class FireEdgePainter extends CustomPainter {
  FireEdgePainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final double clamped = progress.clamp(0, 1);

    // Высота линии огня: там, где заканчивается видимая часть
    final double burnHeight = size.height * (1 - clamped);
    final double bandHeight = 24;

    final Path path = Path();
    path.moveTo(0, burnHeight);

    // Простая "зубчатая" линия: синусоидальные + случайные смещения по Y
    const int steps = 40;
    final double stepWidth = size.width / steps;

    for (int i = 0; i <= steps; i++) {
      final double x = i * stepWidth;
      final double t = i / steps;

      // Небольшой псевдо-шум на основе синуса, чтобы сделать край рваным
      final double noise =
          (math.sin(t * 12.0 + clamped * 6.0) + math.sin(t * 20.0)) * 2.0;
      final double y = burnHeight + noise;

      path.lineTo(x, y);
    }

    path.lineTo(size.width, burnHeight + bandHeight);
    path.lineTo(0, burnHeight + bandHeight);
    path.close();

    final Paint paint =
        Paint()
          ..shader = const LinearGradient(
            colors: [Color(0xFFFFF59D), Color(0xFFFFA726), Color(0xFFE65100)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(Rect.fromLTWH(0, burnHeight, size.width, bandHeight))
          ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant FireEdgePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
