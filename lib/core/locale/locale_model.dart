import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

class LangModel extends Model {
  static const Locale enLocale = Locale('en');
  static const Locale frLocale = Locale('fr');
  static const Locale guLocale = Locale('gu');
  static const Locale hiLocale = Locale('hi');
  static const Locale esLocale = Locale('es');

  String? localeStr;

  late Locale _appLocale = const Locale('en');

  Locale get appLocal {
    notifyListeners();
    return _appLocale;
  }

  List<Locale> get supportedLocales =>
      [enLocale, frLocale, guLocale, hiLocale, esLocale];

  String getLocalStr() {
    if (appLocal == hiLocale) {
      return 'hi';
    }
    if (appLocal == guLocale) {
      return 'gu';
    }
    if (appLocal == frLocale) {
      return 'fr';
    }
    if (appLocal == esLocale) {
      return 'es';
    } else {
      return 'en';
    }
  }

  void changeLanguage(String lang) {
    if (lang == 'hi') {
      _appLocale = hiLocale;
      AppLanguage.appLanguage = 'hi';
    }
    if (lang == 'gu') {
      _appLocale = guLocale;
      AppLanguage.appLanguage = 'gu';
    }
    if (lang == 'fr') {
      _appLocale = frLocale;
      AppLanguage.appLanguage = 'fr';
    }
    if (lang == 'es') {
      _appLocale = esLocale;
      AppLanguage.appLanguage = 'es';
    } else {
      _appLocale = enLocale;
      AppLanguage.appLanguage = 'en';
    }
    notifyListeners();
  }
}

class AppLanguage {
  static String appLanguage = 'en';
}
