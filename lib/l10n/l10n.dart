import 'package:flawtrack/const.dart';
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
        lang = 0;
        return '🇷🇺 Русский';
      case 'kk':
        lang = 1;
        return '🇰🇿 Қазақша';
      case 'en':
        lang = 2;
        return '🇺🇸 English';
      default:
        lang = 1;
        return '🇰🇿 Қазақша';
    }
  }
}
