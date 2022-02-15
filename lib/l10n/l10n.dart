import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('ru'),
    const Locale('kk'),
    const Locale('en'),
  ];

 static String getFlag(String code) {
    switch (code) {
      case 'ru':
        return '🇷🇺 Русский';
      case 'kk':
        return '🇰🇿 Қазақша';
      case 'en':
        return '🇺🇸 English';
      default:
        return '🇺🇸 English';
    }
  }
}
