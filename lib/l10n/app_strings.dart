import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state_provider.dart';

class AppStrings {
  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'welcome': 'Welcome',
      'start_quiz': 'Start Quiz',
      'settings': 'Settings',
      'dark_mode': 'Dark Mode',
      'language': 'Language',
    },
    'ar': {
      'welcome': 'مرحباً بك',
      'start_quiz': 'ابدأ الاختبار',
      'settings': 'الإعدادات',
      'dark_mode': 'الوضع الداكن',
      'language': 'اللغة',
    },
    'ur': {
      'welcome': 'خوش آمدید',
      'start_quiz': 'کوئز شروع کریں',
      'settings': 'ترتیبات',
      'dark_mode': 'ڈارک موڈ',
      'language': 'زبان',
    },
  };

  static String of(BuildContext context, String key) {
    // 1. Get current language code safely (listen: true is required here for UI updates)
    final code = Provider.of<AppStateProvider>(context).locale.languageCode;
    
    // 2. SAFE LOOKUP:
    // Try the current language. 
    // If not found, try English. 
    // If English is also missing, return the key name so you know what's missing.
    return _localizedValues[code]?[key] ?? 
           _localizedValues['en']?[key] ?? 
           '[Missing: $key]'; 
  }
}