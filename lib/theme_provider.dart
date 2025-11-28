import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {

  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  static const String _themeKey = 'theme_key';

  String _username = "";
  String get username => _username;

  static const String _usernameKey = "username_key";

  ThemeProvider() {
    _loadTheme();
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    final isDark = prefs.getBool(_themeKey) ?? false;
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;

    _username = prefs.getString(_usernameKey) ?? "";

    notifyListeners();
  }

  void toggleTheme(bool isOn) async {
    _themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_themeKey, isOn);
  }

  // Simpan username
  void setUsername(String value) async {
    _username = value;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_usernameKey, value);
  }
}