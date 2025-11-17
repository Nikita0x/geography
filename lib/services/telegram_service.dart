import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> sendMessage(String message) async {
  const String botToken = '7227649156:AAHoN6EAAvOr7qEUEN5elfz3FIcdo4iPjXk';
  const String chatId = '-1002444491463';
  const String apiUrl = 'https://api.telegram.org/bot$botToken/sendMessage';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'chat_id': chatId, 'text': message}),
    );

    if (response.statusCode == 200) {
      print("Message sent successfully!");
    } else {
      print("Failed to send message: ${response.body}");
    }
  } catch (e) {
    print("Error: $e");
  }
}
