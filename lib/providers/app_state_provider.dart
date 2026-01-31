import 'package:flutter/material.dart';
import 'dart:io';

class AppStateProvider extends ChangeNotifier {
  // --- 1. THEME STATE ---
  ThemeMode _themeMode = ThemeMode.dark; 
  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;
  
  void toggleTheme(bool isOn) {
    _themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  // --- 2. USER PROFILE STATE ---
  File? _imageFile;
  String _userName = "Abdelhalim"; // Default value prevents null errors in UI

  File? get imageFile => _imageFile;
  String get userName => _userName;

  void updateImage(File? newFile) {
    _imageFile = newFile;
    notifyListeners();
  }
  
  void updateName(String name) {
    if (name.trim().isNotEmpty) {
      _userName = name;
      notifyListeners();
    }
  }

  // --- 3. LANGUAGE STATE ---
  Locale _locale = const Locale('en');
  Locale get locale => _locale;

  // This matches the trailing text in your Settings rows perfectly
  String get currentLanguageDisplayName {
    switch (_locale.languageCode) {
      case 'ar': return "العربية";
      case 'ur': return "اردو";
      case 'ms': return "Malay";
      case 'fr': return "Français";
      default: return "English";
    }
  }

  void setLocale(String langCode) {
    _locale = Locale(langCode);
    notifyListeners(); // Updates AppStrings and SettingsPage immediately
  }

  // --- 4. AUDIO & PREFERENCES ---
  bool soundEnabled = true;
  bool vibrations = false;

  void toggleSound(bool value) {
    soundEnabled = value;
    notifyListeners();
  }

  void toggleVibration(bool value) {
    vibrations = value;
    notifyListeners();
  }
}