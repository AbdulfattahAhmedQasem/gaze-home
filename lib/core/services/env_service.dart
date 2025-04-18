import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvService {
  const EnvService._();

  static Future<void> loadEnv() async => dotenv.load();
  static String get baseUrl => dotenv.env['BASE_URL'] ?? 'BASE_URL not found!';
  static String get imageBaseUrl1 =>
      dotenv.env['IMAGE_BASE_URL1'] ?? 'IMAGE_BASE_URL1 not found!';
  static String get imageBaseUrl2 =>
      dotenv.env['IMAGE_BASE_URL2'] ?? 'IMAGE_BASE_URL2 not found!';
  static String get apiKey => dotenv.env['API_KEY'] ?? 'API_KEY not found!';
}
