import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings with ChangeNotifier {
  final SharedPreferences _prefs;

  Settings._(this._prefs);

  String get installLocation => _prefs.getString("install_location") ?? "user";
  set installLocation(String value) {
    _prefs.setString("install_location", value);
    notifyListeners();
  }

  static Settings? _instance;

  static Settings get instance {
    if (_instance == null) {
      throw Exception(
          "Settings not initialized. Call Settings.ensureInitialized() first.");
    }
    return _instance!;
  }

  static Future<void> ensureInitialized() async {
    final prefs = await SharedPreferences.getInstance();
    _instance = Settings._(prefs);
  }
}

final settingsProvider = ChangeNotifierProvider<Settings>((ref) {
  return Settings.instance;
});
