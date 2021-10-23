import 'package:flutter/material.dart';

import 'app_localizations.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const AppLocalizationsDelegate();
  static AppLocalizations? instance;
  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load();
    instance = localizations;
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
