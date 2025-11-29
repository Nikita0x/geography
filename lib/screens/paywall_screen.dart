import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = CupertinoTheme.of(context).textTheme;
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFF0B0D17),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
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
                  child: const Icon(CupertinoIcons.clear, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              const SizedBox(height: 16),
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
                subtitle: 'Enjoy a clean experience with zero interruptions.',
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
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
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
                    const SizedBox(height: 8),
                    Text(
                      '\$4.99 / month after trial',
                      style: textTheme.tabLabelTextStyle.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 16),
                    CupertinoButton.filled(
                      borderRadius: BorderRadius.circular(16),
                      onPressed: () {},
                      child: const Text('Continue'),
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
