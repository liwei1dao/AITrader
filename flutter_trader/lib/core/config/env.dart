import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

class Env {
  static final Map<String, String> _values = {};

  static Future<void> init(String envName) async {
    final path = 'assets/env/.env.$envName';
    final content = await rootBundle.loadString(path);
    for (final line in content.split('\n')) {
      final trimmed = line.trim();
      if (trimmed.isEmpty || trimmed.startsWith('#')) continue;
      final idx = trimmed.indexOf('=');
      if (idx <= 0) continue;
      final key = trimmed.substring(0, idx).trim();
      final val = trimmed.substring(idx + 1).trim();
      _values[key] = val;
    }
  }

  static String? get(String key) => _values[key];
}
