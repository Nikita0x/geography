import 'package:flutter/cupertino.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();

    // Ждём 3 секунды и переходим на "/"
    Future.delayed(const Duration(milliseconds: 1300), () {
      // Проверяем, что виджет ещё в дереве
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/',
          (route) => false, // очищаем стек, чтобы назад нельзя было
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Center(child: Text('Загрузка...')),
    );
  }
}
