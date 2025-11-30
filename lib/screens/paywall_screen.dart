import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _kPaywallBlurSigma = 40;
const double _kPaywallTopRightRadiusFactor = 0.38;
const double _kPaywallBottomLeftRadiusFactor = 0.42;
const double _kPaywallCenterRadiusFactor = 0.52;

class PaywallAnimatedBackground extends StatefulWidget {
  const PaywallAnimatedBackground({super.key});

  @override
  State<PaywallAnimatedBackground> createState() =>
      _PaywallAnimatedBackgroundState();
}

class _PaywallAnimatedBackgroundState extends State<PaywallAnimatedBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 50),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final double t = _controller.value;

        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF0B0D17), Color(0xFF17203A), Color(0xFF1A1446)],
            ),
          ),
          child: CustomPaint(
            painter: _PaywallGlowPainter(progress: t),
            size: Size.infinite,
          ),
        );
      },
    );
  }
}

class _PaywallGlowPainter extends CustomPainter {
  _PaywallGlowPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..style = PaintingStyle.fill
          ..maskFilter = const MaskFilter.blur(
            BlurStyle.normal,
            _kPaywallBlurSigma,
          );

    final double t = progress;

    final double loop = math.sin(t * 2 * math.pi); // -1..1, periodic по кругу
    final double loopInv = math.cos(t * 2 * math.pi);

    // Верхний правый круг движется по большой дуге, яркость циклична без скачка
    paint.color = const Color(0xFF5F5CFF).withOpacity(0.5 + 0.18 * loop);
    final Offset topRight = Offset(
      size.width * (0.7 + 0.25 * math.cos(t * 2 * math.pi)),
      size.height * (0.1 + 0.1 * math.sin(t * 2 * math.pi)),
    );
    canvas.drawCircle(
      topRight,
      size.width * _kPaywallTopRightRadiusFactor,
      paint,
    );

    // Нижний левый круг движется в противофазе, яркость тоже периодична
    paint.color = const Color(0xFF00C2FF).withOpacity(0.45 + 0.18 * (-loop));
    final Offset bottomLeft = Offset(
      size.width * (0.1 + 0.25 * math.sin(t * 2 * math.pi)),
      size.height * (0.8 + 0.1 * math.cos(t * 2 * math.pi)),
    );
    canvas.drawCircle(
      bottomLeft,
      size.width * _kPaywallBottomLeftRadiusFactor,
      paint,
    );

    // Центральная мягкая подсветка под CTA пульсирует синусоидально
    final double centerPulse = 0.5 + 0.5 * loopInv; // 0..1, плавный цикл
    paint.color = Colors.white.withOpacity(0.12 + 0.08 * centerPulse);
    final Offset center = Offset(size.width * 0.5, size.height * 0.7);
    canvas.drawCircle(
      center,
      size.width * (_kPaywallCenterRadiusFactor * (0.95 + 0.1 * centerPulse)),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _PaywallGlowPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = CupertinoTheme.of(context).textTheme;
    return CupertinoPageScaffold(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          const Positioned.fill(child: PaywallAnimatedBackground()),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: CupertinoButton(
                      padding: const EdgeInsets.all(4),
                      minSize: 36,
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20),
                      child: const Icon(
                        CupertinoIcons.clear,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Unlock Geography Pro',
                            style: textTheme.navLargeTitleTextStyle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Remove ads, unlock custom quiz sets, and help support ongoing development.',
                            style: textTheme.textStyle.copyWith(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 24),
                          _FeatureTile(
                            icon: CupertinoIcons.nosign,
                            title: 'No ads',
                            subtitle:
                                'Enjoy a clean experience with zero interruptions.',
                          ),
                          _FeatureTile(
                            icon: CupertinoIcons.slider_horizontal_3,
                            title: 'Custom quizzes',
                            subtitle:
                                'Build your own quiz sets from any countries and flags.',
                          ),
                          _FeatureTile(
                            icon: CupertinoIcons.heart_fill,
                            title: 'Support the developer',
                            subtitle:
                                'Your support helps keep the app improving with new modes and updates.',
                          ),
                          const SizedBox(height: 24),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: const LinearGradient(
                                colors: [Color(0xFF5F5CFF), Color(0xFF00C2FF)],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Start your 7-day free trial',
                                  style: textTheme.navTitleTextStyle.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  '\$4.99 / month after trial',
                                  style: textTheme.tabLabelTextStyle.copyWith(
                                    color: Colors.white70,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                SizedBox(
                                  width: double.infinity,
                                  child: CupertinoButton.filled(
                                    borderRadius: BorderRadius.circular(16),
                                    onPressed: () {},
                                    child: const Text('Continue'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Center(
                            child: Text(
                              'Restore purchases',
                              style: textTheme.tabLabelTextStyle.copyWith(
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(12),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CupertinoTheme.of(
                    context,
                  ).textTheme.textStyle.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: CupertinoTheme.of(context).textTheme.textStyle
                      .copyWith(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaywallRoute extends PageRouteBuilder<void> {
  PaywallRoute()
    : super(
        settings: const RouteSettings(name: '/paywall'),
        transitionDuration: const Duration(milliseconds: 450),
        reverseTransitionDuration: const Duration(milliseconds: 320),
        pageBuilder:
            (context, animation, secondaryAnimation) => const PaywallScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curved = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
            reverseCurve: Curves.easeInCubic,
          );

          return FadeTransition(
            opacity: curved,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.2, end: 1).animate(curved),
              child: child,
            ),
          );
        },
      );
}
