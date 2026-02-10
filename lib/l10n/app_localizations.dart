import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('kk'),
    Locale('ru')
  ];

  /// No description provided for @test.
  ///
  /// In en, this message translates to:
  /// **'This is a test string for English localization.'**
  String get test;

  /// No description provided for @dressCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'DRESS CODE'**
  String get dressCodeLabel;

  /// No description provided for @smartCasual.
  ///
  /// In en, this message translates to:
  /// **'Smart Casual'**
  String get smartCasual;

  /// No description provided for @freeClassicStyle.
  ///
  /// In en, this message translates to:
  /// **'Free Classic Style'**
  String get freeClassicStyle;

  /// No description provided for @dressCodeDescription.
  ///
  /// In en, this message translates to:
  /// **'We invite you to join us in an atmosphere of modern elegance. Think clean lines, monochrome palettes, and sophisticated comfort suitable for our urban Astana celebration.'**
  String get dressCodeDescription;

  /// No description provided for @paletteLabel.
  ///
  /// In en, this message translates to:
  /// **'PALETTE'**
  String get paletteLabel;

  /// No description provided for @colorBlack.
  ///
  /// In en, this message translates to:
  /// **'Black'**
  String get colorBlack;

  /// No description provided for @colorGrey.
  ///
  /// In en, this message translates to:
  /// **'Grey'**
  String get colorGrey;

  /// No description provided for @colorWhite.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get colorWhite;

  /// No description provided for @colorRed.
  ///
  /// In en, this message translates to:
  /// **'Red Accent'**
  String get colorRed;

  /// No description provided for @guidelineMonochromeTitle.
  ///
  /// In en, this message translates to:
  /// **'Monochrome'**
  String get guidelineMonochromeTitle;

  /// No description provided for @guidelineMonochromeDesc.
  ///
  /// In en, this message translates to:
  /// **'Stick to black, white, grey, or muted earth tones. We are aiming for a cohesive, editorial vibe for our wedding photos.'**
  String get guidelineMonochromeDesc;

  /// No description provided for @guidelineModernTitle.
  ///
  /// In en, this message translates to:
  /// **'Modern Silhouettes'**
  String get guidelineModernTitle;

  /// No description provided for @guidelineModernDesc.
  ///
  /// In en, this message translates to:
  /// **'Opt for tailored suits, slip dresses, and structured blazers. Clean lines over complex patterns.'**
  String get guidelineModernDesc;

  /// No description provided for @guidelineComfortTitle.
  ///
  /// In en, this message translates to:
  /// **'Comfortable Elegance'**
  String get guidelineComfortTitle;

  /// No description provided for @guidelineComfortDesc.
  ///
  /// In en, this message translates to:
  /// **'Look sharp but feel free to move. No stiff tuxedos required. Smart casual means polished but relaxed.'**
  String get guidelineComfortDesc;

  /// No description provided for @aestheticTitle.
  ///
  /// In en, this message translates to:
  /// **'The Aesthetic'**
  String get aestheticTitle;

  /// No description provided for @inspirationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Curated Inspiration'**
  String get inspirationSubtitle;

  /// No description provided for @inspirationMensTailoring.
  ///
  /// In en, this message translates to:
  /// **'Men\'s Tailoring'**
  String get inspirationMensTailoring;

  /// No description provided for @inspirationMinimalist.
  ///
  /// In en, this message translates to:
  /// **'Minimalist Silhouettes'**
  String get inspirationMinimalist;

  /// No description provided for @inspirationFootwear.
  ///
  /// In en, this message translates to:
  /// **'Polished Footwear'**
  String get inspirationFootwear;

  /// No description provided for @inspirationModern.
  ///
  /// In en, this message translates to:
  /// **'Modern Elegance'**
  String get inspirationModern;

  /// No description provided for @doListTitle.
  ///
  /// In en, this message translates to:
  /// **'PLEASE DO'**
  String get doListTitle;

  /// No description provided for @doItem1.
  ///
  /// In en, this message translates to:
  /// **'Wear Blazers, Loafers, Slip Dresses, and Jumpsuits.'**
  String get doItem1;

  /// No description provided for @doItem2.
  ///
  /// In en, this message translates to:
  /// **'Choose monochrome palettes (Black, White, Grey).'**
  String get doItem2;

  /// No description provided for @doItem3.
  ///
  /// In en, this message translates to:
  /// **'Opt for midi lengths, silk fabrics, and minimal jewelry.'**
  String get doItem3;

  /// No description provided for @doItem4.
  ///
  /// In en, this message translates to:
  /// **'Feel comfortable. Relaxed tailoring is encouraged.'**
  String get doItem4;

  /// No description provided for @dontListTitle.
  ///
  /// In en, this message translates to:
  /// **'PLEASE DON\'T'**
  String get dontListTitle;

  /// No description provided for @dontItem1.
  ///
  /// In en, this message translates to:
  /// **'Wear Jeans, T-shirts, or Athletic Sneakers.'**
  String get dontItem1;

  /// No description provided for @dontItem2.
  ///
  /// In en, this message translates to:
  /// **'Wear Neon or overly bright colors.'**
  String get dontItem2;

  /// No description provided for @dontItem3.
  ///
  /// In en, this message translates to:
  /// **'Wear heavily patterned or branded clothing.'**
  String get dontItem3;

  /// No description provided for @dontItem4.
  ///
  /// In en, this message translates to:
  /// **'Feel pressured to wear a full tuxedo.'**
  String get dontItem4;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'kk', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'kk': return AppLocalizationsKk();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
