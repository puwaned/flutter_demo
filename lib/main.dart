import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lpt_client/root.dart';

import 'environment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadEnvironment();

  runApp(const RootApp());
}

Future<void> loadEnvironment() async {
  await dotenv.load(fileName: Environment.fileName);
}
