import 'package:flutter/material.dart';
import 'package:hoster/core/locale/language.dart';
import 'package:hoster/core/locale/language_en.dart';
import 'package:hoster/core/locale/language_es.dart';
import 'package:hoster/core/locale/language_fr.dart';
import 'package:hoster/core/locale/language_gu.dart';
import 'package:hoster/core/locale/language_hi.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'fr', 'gu', 'hi', 'es'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      case 'fr':
        return LanguageFr();
      case 'gu':
        return LanguageGU();
      case 'hi':
        return LanguageHi();
      case 'es':
        return LanguageEs();
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
