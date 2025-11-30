import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromARGB(255, 16, 110, 108), Color(0xFF1A2980)],
            ),
          ),
        ),
        Positioned(
          top: 60,
          right: 24,
          child: Opacity(
            opacity: 0.06,
            child: Transform.rotate(
              angle: 0.18,
              child: const Icon(Icons.public, size: 56, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          bottom: 80,
          left: 32,
          child: Opacity(
            opacity: 0.05,
            child: Transform.rotate(
              angle: -0.25,
              child: const Icon(Icons.flag, size: 62, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: 370,
          left: 96,
          child: Opacity(
            opacity: 0.05,
            child: Transform.rotate(
              angle: 0.28,
              child: const Icon(
                Icons.location_on,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 130,
          right: 72,
          child: Opacity(
            opacity: 0.04,
            child: Transform.rotate(
              angle: -0.18,
              child: const Icon(Icons.public, size: 42, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: 290,
          right: 50,
          child: Opacity(
            opacity: 0.04,
            child: Transform.rotate(
              angle: 0.36,
              child: const Icon(Icons.flag, size: 48, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: 150,
          left: 15,
          child: Opacity(
            opacity: 0.05,
            child: Transform.rotate(
              angle: -0.50,
              child: const Icon(
                Icons.location_on,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PlaygroundBackground extends StatelessWidget {
  const PlaygroundBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 20,
          child: Opacity(
            opacity: 0.07,
            child: Transform.rotate(
              angle: -0.6,
              child: const Icon(Icons.public, size: 90, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: 280,
          right: 0,
          child: Opacity(
            opacity: 0.06,
            child: Transform.rotate(
              angle: 0.25,
              child: const Icon(
                Icons.location_on,
                size: 55,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          top: 150,
          right: 80,
          child: Opacity(
            opacity: 0.05,
            child: Transform.rotate(
              angle: -0.15,
              child: const Icon(Icons.flag, size: 65, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: 220,
          left: 60,
          child: Opacity(
            opacity: 0.05,
            child: Transform.rotate(
              angle: 0.2,
              child: const Icon(Icons.public, size: 45, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          bottom: 120,
          left: 40,
          child: Opacity(
            opacity: 0.04,
            child: Transform.rotate(
              angle: -0.25,
              child: const Icon(Icons.flag, size: 50, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 100,
          child: Opacity(
            opacity: 0.05,
            child: Transform.rotate(
              angle: 0.35,
              child: const Icon(
                Icons.location_on,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TestBackground extends StatelessWidget {
  const TestBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color(0xFF0F2027), Color(0xFF203A43)],
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 40,
          child: Opacity(
            opacity: 0.06,
            child: Transform.rotate(
              angle: -0.35,
              child: const Icon(Icons.flag, size: 58, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: 190,
          right: 40,
          child: Opacity(
            opacity: 0.05,
            child: Transform.rotate(
              angle: 0.2,
              child: const Icon(Icons.public, size: 52, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          bottom: 140,
          left: 30,
          child: Opacity(
            opacity: 0.04,
            child: Transform.rotate(
              angle: -0.18,
              child: const Icon(
                Icons.location_on,
                size: 48,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          top: 250,
          right: 90,
          child: Opacity(
            opacity: 0.05,
            child: Transform.rotate(
              angle: 0.3,
              child: const Icon(Icons.public, size: 44, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          bottom: 110,
          right: 120,
          child: Opacity(
            opacity: 0.04,
            child: Transform.rotate(
              angle: -0.28,
              child: const Icon(Icons.flag, size: 52, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          bottom: 40,
          left: 80,
          child: Opacity(
            opacity: 0.05,
            child: Transform.rotate(
              angle: 0.12,
              child: const Icon(
                Icons.location_on,
                size: 38,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
