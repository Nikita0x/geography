import 'package:signals/signals.dart';

class AppStore {
  final counter = signal(0);
  final userName = signal('Guest');
  late final greeting = computed(() => 'Hello, ${userName.value}!');
}

// Create a global instance of your store
final appStore = AppStore();
