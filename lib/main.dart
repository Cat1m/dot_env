import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    print("Error loading .env file: $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiKey = dotenv.env['API_KEY']; // Lấy giá trị của API_KEY từ .env
    print(dotenv.env); // In ra các biến môi trường để kiểm tra
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Securing API Keys Example'),
        ),
        body: Center(
          child: Text('API Key: $apiKey'), // Sử dụng API key
        ),
      ),
    );
  }
}
