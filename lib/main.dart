import 'package:flutter/material.dart';
import 'home_page.dart';
import 'l10n/app_localizations.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WeddingApp());
}

class WeddingApp extends StatelessWidget {
  const WeddingApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final locale = ref.watch(localeProvider);
    return MaterialApp(
      title: 'Farkhat & Riza — Wedding',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('ru'),
      home: const HomePage(),
    );
  }
}
