import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName => kReleaseMode ? ".env.prod" : ".env.dev";
  static String get apiUrl => dotenv.env['API_URL'] ?? '';
  static String get appReleaseMode => dotenv.env['MODE'] ?? "";
}
