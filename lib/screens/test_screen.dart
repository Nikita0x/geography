import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geography/components/background.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(child: TestBackground()),
        SafeArea(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
            itemBuilder: (context, index) {
              final destination = _heroDestinations[index];
              return _DestinationCard(destination: destination);
            },
            separatorBuilder: (_, __) => const SizedBox(height: 20),
            itemCount: _heroDestinations.length,
          ),
        ),
      ],
    );
  }
}

class _DestinationCard extends StatelessWidget {
  const _DestinationCard({required this.destination});

  final _HeroDestination destination;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (_) => _DestinationDetailsScreen(destination: destination),
          ),
        );
      },
      child: Hero(
        tag: destination.tag,
        flightShuttleBuilder: (
          context,
          animation,
          direction,
          fromContext,
          toContext,
        ) {
          // Slight fade during the hero flight keeps the transition feeling soft.
          return FadeTransition(
            opacity: animation.drive(CurveTween(curve: Curves.easeOut)),
            child: toContext.widget,
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Container(
            height: 170,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [destination.primaryColor, destination.secondaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destination.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        destination.subtitle,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 16,
                  child: Icon(
                    destination.icon,
                    size: 48,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DestinationDetailsScreen extends StatelessWidget {
  const _DestinationDetailsScreen({required this.destination});

  final _HeroDestination destination;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(destination.title),
        previousPageTitle: 'Назад',
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Hero(
                tag: destination.tag,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Container(
                    height: 260,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          destination.primaryColor,
                          destination.secondaryColor,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Icon(
                          destination.icon,
                          size: 80,
                          color: Colors.white.withOpacity(0.95),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                destination.subtitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  destination.description,
                  style: const TextStyle(fontSize: 16, height: 1.4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroDestination {
  const _HeroDestination({
    required this.tag,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.primaryColor,
    required this.secondaryColor,
    required this.icon,
  });

  final String tag;
  final String title;
  final String subtitle;
  final String description;
  final Color primaryColor;
  final Color secondaryColor;
  final IconData icon;
}

const List<_HeroDestination> _heroDestinations = [
  _HeroDestination(
    tag: 'aurora',
    title: 'Aurora Borealis',
    subtitle: 'Тур по северу Исландии',
    description:
        'Когда пользователь нажимает на карточку, виджет Hero клонирует дочерний элемент и воспроизводит перелёт между двумя экранами. В результате создаётся ощущение, будто сам блок плавно растягивается и перемещается на новый экран.',
    primaryColor: Color(0xFF4E54C8),
    secondaryColor: Color(0xFF8F94FB),
    icon: CupertinoIcons.moon_stars,
  ),
  _HeroDestination(
    tag: 'safari',
    title: 'Savanna Safari',
    subtitle: 'Африка на воздушном шаре',
    description:
        'Hero требует всего два элемента — одинаковый tag и одинаковую иерархию дочернего виджета. В детальном экране можно добавить больше текста, графику и другие элементы, сохраняя плавность анимации.',
    primaryColor: Color(0xFFFFA726),
    secondaryColor: Color(0xFFFF7043),
    icon: CupertinoIcons.sun_max_fill,
  ),
  _HeroDestination(
    tag: 'reef',
    title: 'Coral Reef',
    subtitle: 'Дайвинг на Большом Барьере',
    description:
        'Попробуйте добавить в Hero изображение из сети или фон с ClipRRect — Flutter автоматически интерполирует форму, позицию и размер между стартовой и конечной точками.',
    primaryColor: Color(0xFF26D0CE),
    secondaryColor: Color(0xFF1A2980),
    icon: CupertinoIcons.drop_fill,
  ),
];
