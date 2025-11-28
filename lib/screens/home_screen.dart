import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geography/main.dart' show Routes;
import 'package:geography/screens/paywall_screen.dart';

class AnimatedHomeBackground extends StatefulWidget {
  const AnimatedHomeBackground({super.key});

  @override
  State<AnimatedHomeBackground> createState() => _AnimatedHomeBackgroundState();
}

class _AnimatedHomeBackgroundState extends State<AnimatedHomeBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;
  late final List<_Particle> particles;

  static const int _particleCount = 150;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat(reverse: true);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    particles = _generateParticles(_particleCount);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final double t = animation.value;
        final Alignment beginAlignment = Alignment(-1.0 + t * 0.5, -1.0);
        final Alignment endAlignment = Alignment(1.0, 1.0 - t * 0.5);

        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: beginAlignment,
                  end: endAlignment,
                  colors: [
                    Colors.black,
                    Colors.indigo.shade900,
                    Colors.deepPurple.shade900,
                    Colors.black,
                  ],
                  stops: const [0.0, 0.35, 0.7, 1.0],
                ),
              ),
            ),
            CustomPaint(
              painter: _ParticlesPainter(progress: t, particles: particles),
              size: Size.infinite,
            ),
          ],
        );
      },
    );
  }
}

class _Particle {
  _Particle({
    required this.x,
    required this.y,
    required this.radius,
    required this.amplitude,
    required this.angle,
    required this.opacity,
  });

  final double x;
  final double y;
  final double radius;
  final double amplitude;
  final double angle;
  final double opacity;
}

List<_Particle> _generateParticles(int count) {
  final Random random = Random();

  return List<_Particle>.generate(count, (int index) {
    final double baseX = random.nextDouble();
    final double baseY = random.nextDouble();
    final double radius = 1.5 + random.nextDouble() * 2.0;
    final double amplitude = 0.02 + random.nextDouble() * 0.04;
    final double angle = random.nextDouble() * 2 * pi;
    final double opacity = 0.15 + random.nextDouble() * 0.25;

    return _Particle(
      x: baseX,
      y: baseY,
      radius: radius,
      amplitude: amplitude,
      angle: angle,
      opacity: opacity,
    );
  });
}

class _ParticlesPainter extends CustomPainter {
  _ParticlesPainter({required this.progress, required this.particles});

  final double progress;
  final List<_Particle> particles;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..style = PaintingStyle.fill
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

    for (final _Particle particle in particles) {
      final double offsetFactor = (progress - 0.5) * 2.0;
      final double dx = (particle.x +
              cos(particle.angle) * particle.amplitude * offsetFactor)
          .clamp(0.0, 1.0);
      final double dy = (particle.y +
              sin(particle.angle) * particle.amplitude * offsetFactor)
          .clamp(0.0, 1.0);

      final Offset center = Offset(dx * size.width, dy * size.height);

      paint.color = Colors.white.withOpacity(particle.opacity);

      canvas.drawCircle(center, particle.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlesPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        !identical(oldDelegate.particles, particles);
  }
}

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
    Mode('Guess Country from Capital', Routes.capitalsGuessCountryFromCapital),
    Mode('Guess Capital from Country', Routes.countriesGuessCapitalFromCountry),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: const CupertinoNavigationBar(middle: Text('Guess a Flag')),
      backgroundColor: Colors.black,
      child: Stack(
        children: [
          const Positioned.fill(child: AnimatedHomeBackground()),
          SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ...modes.map((item) {
                        return Card(
                          elevation: 0,
                          color: Colors.white.withOpacity(0.05),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.only(bottom: 12),
                          child: CupertinoButton(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 12,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                item.name,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            onPressed:
                                () => Navigator.pushNamed(context, item.route),
                          ),
                        );
                      }),
                      Card(
                        elevation: 0,
                        color: Colors.white.withOpacity(0.05),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        margin: const EdgeInsets.only(bottom: 12),
                        child: CupertinoButton(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 12,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Hearts",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          onPressed:
                              () => Navigator.pushNamed(context, Routes.hearts),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CupertinoButton(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.circular(16),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: const Text("Start Game"),
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.modes);
                        },
                      ),
                      const SizedBox(height: 8),
                      CupertinoButton(
                        color: Colors.red[900],
                        borderRadius: BorderRadius.circular(16),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: const Text("Playground"),
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.playground);
                        },
                      ),
                      const SizedBox(height: 8),
                      CupertinoButton(
                        color: Colors.green[900],
                        borderRadius: BorderRadius.circular(16),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: const Text("Test Button"),
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.test);
                        },
                      ),
                      const SizedBox(height: 8),
                      CupertinoButton(
                        color: Colors.purple[900],
                        borderRadius: BorderRadius.circular(16),
                        padding: const EdgeInsets.symmetric(vertical: 16),
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
        ],
      ),
    );
  }
}
