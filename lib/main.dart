import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hoster/core/locale/application_locale.dart';
import 'package:hoster/core/locale/locale_constant.dart';
import 'package:hoster/splash_screen.dart';
import 'package:hoster/theme/dark_theme_provider.dart';
import 'package:hoster/theme/dark_theme_styles.dart';
import 'package:url_strategy/url_strategy.dart';
//
import 'package:provider/provider.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            title: 'Hoster',
            supportedLocales: const [
              Locale('en', ''),
              Locale('fr', ''),
              Locale('gu', ''),
              Locale('hi', ''),
              Locale('es', ''),
            ],
            localizationsDelegates: const [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: _locale,
            // routeInformationProvider: _appRouter!.routeInformationProvider,
            // routeInformationParser: _appRouter!.routeInformationParser,
            // routerDelegate: _appRouter!.routerDelegate,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
