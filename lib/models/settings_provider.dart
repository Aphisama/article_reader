import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  bool _isDarkMode = false;
  double _fontSize = 14.0;
  String _fontFamily = 'Roboto';

  SettingsProvider() {
    _loadSettings();
  }

  bool get isDarkMode => _isDarkMode;
  double get fontSize => _fontSize;
  String get fontFamily => _fontFamily;

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _fontSize = prefs.getDouble('fontSize') ?? 14.0;
    _fontFamily = prefs.getString('fontFamily') ?? 'Roboto';
    notifyListeners();
  }

  Future<void> toggleDarkMode(bool value) async {
    _isDarkMode = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', value);
  }

  Future<void> updateFontSize(double size) async {
    _fontSize = size;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSize', size);
  }

  Future<void> updateFontFamily(String family) async {
    _fontFamily = family;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fontFamily', family);
  }
}