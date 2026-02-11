import 'dart:async';
import 'dart:developer';
import 'dart:html' as html;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wedding/firebase_options.dart';
import 'package:wedding/providers/guest_provider.dart';
import 'home_page.dart';
import 'l10n/app_localizations.dart';
import 'theme/app_theme.dart';

Future<void> main() async =>  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
  await _initFirebase();
 
    runApp(const ProviderScope(child: WeddingApp()));
  }, (e, s) {
    // Handle uncaught errors here, e.g., log to an error reporting service
    log('Uncaught error: $e');
    log('Stack trace: $s');
  });

 Future<void> _initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

class WeddingApp extends ConsumerStatefulWidget {
  const WeddingApp({super.key});

  @override
  ConsumerState<WeddingApp> createState() => _WeddingAppState();
}

class _WeddingAppState extends ConsumerState<WeddingApp> {
  @override
  void initState() {
    super.initState();
    _parseUrlAndSetGuest();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   try {
    //     final loader = FirebaseService();
    //     await loader.seedGuestsFromJson();
    //     log('Firebase seeding completed successfully.');
    //   } catch (e, s) {
    //     log('Error during Firebase seeding: $e');
    //     log('Stack trace: $s');
    //   }
    // });
  }

  /// Parse URL path and extract guest ID
  void _parseUrlAndSetGuest() {
    try {
      final path = html.window.location.pathname ?? '/';
      log('Current path: $path');
      
      // Path format: / or /guestId
      if (path.length > 1) {
        final guestId = path.substring(1); // Remove leading '/'
        if (guestId.isNotEmpty) {
          log('Guest ID from URL: $guestId');
          // Delay modification to after widget tree is built
          Future.microtask(() {
            ref.read(guestIdProvider.notifier).set(guestId);
          });
        }
      }
    } catch (e, s) {
      log('Error parsing URL: $e');
      log('Stack trace: $s');
    }
  }

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
