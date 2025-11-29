import 'package:purchases_flutter/purchases_flutter.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

Future<void> initializeRevenueCat() async {
  if (kIsWeb) {
    print('‼️RevenueCat initialization skipped on web');
    return;
  }
  // Platform-specific API keys
  String apiKey;
  if (Platform.isIOS) {
    apiKey = 'test_HNqtjvDmRbXWXZDeMeGreTleQep';
  } else if (Platform.isAndroid) {
    apiKey = 'test_HNqtjvDmRbXWXZDeMeGreTleQep';
  } else {
    throw UnsupportedError('Platform not supported');
  }

  await Purchases.configure(PurchasesConfiguration(apiKey));
}
