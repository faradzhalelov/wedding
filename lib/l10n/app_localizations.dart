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

  /// No description provided for @theCelebration.
  ///
  /// In en, this message translates to:
  /// **'THE CELEBRATION'**
  String get theCelebration;

  /// No description provided for @monthJune.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get monthJune;

  /// No description provided for @day24th.
  ///
  /// In en, this message translates to:
  /// **'27th'**
  String get day24th;

  /// No description provided for @year2025.
  ///
  /// In en, this message translates to:
  /// **'2026'**
  String get year2025;

  /// No description provided for @locationAstana.
  ///
  /// In en, this message translates to:
  /// **'Astana, Kazakhstan'**
  String get locationAstana;

  /// No description provided for @locationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The Capital City'**
  String get locationSubtitle;

  /// No description provided for @venueGuestHouse.
  ///
  /// In en, this message translates to:
  /// **'​Tumar Banquet Hall'**
  String get venueGuestHouse;

  /// No description provided for @venueMainBallroom.
  ///
  /// In en, this message translates to:
  /// **'Zheltoksan Street, 2t'**
  String get venueMainBallroom;

  /// No description provided for @addToCalendar.
  ///
  /// In en, this message translates to:
  /// **'Add to Calendar'**
  String get addToCalendar;

  /// No description provided for @gettingThere.
  ///
  /// In en, this message translates to:
  /// **'Getting There'**
  String get gettingThere;

  /// No description provided for @gettingThereDesc.
  ///
  /// In en, this message translates to:
  /// **'The Guest House is located in the heart of Astana.'**
  String get gettingThereDesc;

  /// No description provided for @venue.
  ///
  /// In en, this message translates to:
  /// **'Venue'**
  String get venue;

  /// No description provided for @getDirections.
  ///
  /// In en, this message translates to:
  /// **'Get Directions'**
  String get getDirections;

  /// No description provided for @orderOfEvents.
  ///
  /// In en, this message translates to:
  /// **'Order of Events'**
  String get orderOfEvents;

  /// No description provided for @orderOfEventsDesc.
  ///
  /// In en, this message translates to:
  /// **'A guide to our special day.'**
  String get orderOfEventsDesc;

  /// No description provided for @event1Time.
  ///
  /// In en, this message translates to:
  /// **'16:00'**
  String get event1Time;

  /// No description provided for @event1Tag.
  ///
  /// In en, this message translates to:
  /// **'Arrival'**
  String get event1Tag;

  /// No description provided for @event1Title.
  ///
  /// In en, this message translates to:
  /// **'Welcome Gathering'**
  String get event1Title;

  /// No description provided for @event1Desc.
  ///
  /// In en, this message translates to:
  /// **'Guests arrive. Light refreshments and cocktails will be served in the garden foyer.'**
  String get event1Desc;

  /// No description provided for @event2Time.
  ///
  /// In en, this message translates to:
  /// **'17:00'**
  String get event2Time;

  /// No description provided for @event2Tag.
  ///
  /// In en, this message translates to:
  /// **'Main Event'**
  String get event2Tag;

  /// No description provided for @event2Title.
  ///
  /// In en, this message translates to:
  /// **'The Ceremony'**
  String get event2Title;

  /// No description provided for @event2Desc.
  ///
  /// In en, this message translates to:
  /// **'We say \"I do\" in the Grand Hall. Please be seated by 16:45.'**
  String get event2Desc;

  /// No description provided for @event3Time.
  ///
  /// In en, this message translates to:
  /// **'18:00'**
  String get event3Time;

  /// No description provided for @event3Tag.
  ///
  /// In en, this message translates to:
  /// **'Reception'**
  String get event3Tag;

  /// No description provided for @event3Title.
  ///
  /// In en, this message translates to:
  /// **'Dinner & Toasts'**
  String get event3Title;

  /// No description provided for @event3Desc.
  ///
  /// In en, this message translates to:
  /// **'A three-course dinner featuring local delicacies, followed by speeches from family and friends.'**
  String get event3Desc;

  /// No description provided for @event4Time.
  ///
  /// In en, this message translates to:
  /// **'20:00'**
  String get event4Time;

  /// No description provided for @event4Tag.
  ///
  /// In en, this message translates to:
  /// **'Party'**
  String get event4Tag;

  /// No description provided for @event4Title.
  ///
  /// In en, this message translates to:
  /// **'Dancing'**
  String get event4Title;

  /// No description provided for @event4Desc.
  ///
  /// In en, this message translates to:
  /// **'Live music performance followed by a DJ set until midnight.'**
  String get event4Desc;

  /// No description provided for @event5Time.
  ///
  /// In en, this message translates to:
  /// **'23:00'**
  String get event5Time;

  /// No description provided for @event5Tag.
  ///
  /// In en, this message translates to:
  /// **'Finale'**
  String get event5Tag;

  /// No description provided for @event5Title.
  ///
  /// In en, this message translates to:
  /// **'Farewell'**
  String get event5Title;

  /// No description provided for @event5Desc.
  ///
  /// In en, this message translates to:
  /// **'Sparkler send-off for the newlyweds.'**
  String get event5Desc;

  /// No description provided for @canYouMakeIt.
  ///
  /// In en, this message translates to:
  /// **'Can you make it?'**
  String get canYouMakeIt;

  /// No description provided for @honoredToHaveYou.
  ///
  /// In en, this message translates to:
  /// **'We would be honored to have you celebrate with us.'**
  String get honoredToHaveYou;

  /// No description provided for @astanaCity.
  ///
  /// In en, this message translates to:
  /// **'ASTANA'**
  String get astanaCity;

  /// No description provided for @designedWithLove.
  ///
  /// In en, this message translates to:
  /// **'Designed with love for Riza & Farkhat'**
  String get designedWithLove;

  /// No description provided for @memoriesLabel.
  ///
  /// In en, this message translates to:
  /// **'Memories'**
  String get memoriesLabel;

  /// No description provided for @ourStoryInPhotos.
  ///
  /// In en, this message translates to:
  /// **'Our Story in Photos'**
  String get ourStoryInPhotos;

  /// No description provided for @memoriesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'From childhood memories to the journey that brought us together.'**
  String get memoriesSubtitle;

  /// No description provided for @twoLives.
  ///
  /// In en, this message translates to:
  /// **'Two Lives,'**
  String get twoLives;

  /// No description provided for @onePath.
  ///
  /// In en, this message translates to:
  /// **'One Path.'**
  String get onePath;

  /// No description provided for @memoryDescMobile.
  ///
  /// In en, this message translates to:
  /// **'From childhood memories in the streets of Astana to our journey together. A visual diary of the moments that shaped us.'**
  String get memoryDescMobile;

  /// No description provided for @memoryDescDesktop.
  ///
  /// In en, this message translates to:
  /// **'From childhood memories in the streets of Astana to our journey across the world together. A visual diary of the moments that shaped us.'**
  String get memoryDescDesktop;

  /// No description provided for @established.
  ///
  /// In en, this message translates to:
  /// **'ESTABLISHED'**
  String get established;

  /// No description provided for @year2018.
  ///
  /// In en, this message translates to:
  /// **'2018'**
  String get year2018;

  /// No description provided for @galleryRiza.
  ///
  /// In en, this message translates to:
  /// **'Riza'**
  String get galleryRiza;

  /// No description provided for @galleryRizaCaption.
  ///
  /// In en, this message translates to:
  /// **'With her favorite toy'**
  String get galleryRizaCaption;

  /// No description provided for @galleryFarkhat.
  ///
  /// In en, this message translates to:
  /// **'Farkhat'**
  String get galleryFarkhat;

  /// No description provided for @galleryFarkhatCaption.
  ///
  /// In en, this message translates to:
  /// **'In the circus'**
  String get galleryFarkhatCaption;

  /// No description provided for @galleryFirstDate.
  ///
  /// In en, this message translates to:
  /// **'First Date'**
  String get galleryFirstDate;

  /// No description provided for @galleryFirstDateCaption.
  ///
  /// In en, this message translates to:
  /// **'Sunny Line'**
  String get galleryFirstDateCaption;

  /// No description provided for @galleryTogether.
  ///
  /// In en, this message translates to:
  /// **'Together'**
  String get galleryTogether;

  /// No description provided for @galleryTogetherCaption.
  ///
  /// In en, this message translates to:
  /// **'A look that says everything.'**
  String get galleryTogetherCaption;

  /// No description provided for @galleryOurCity.
  ///
  /// In en, this message translates to:
  /// **'Our City'**
  String get galleryOurCity;

  /// No description provided for @galleryOurCityCaption.
  ///
  /// In en, this message translates to:
  /// **'Where it all began.'**
  String get galleryOurCityCaption;

  /// No description provided for @galleryTheYes.
  ///
  /// In en, this message translates to:
  /// **'The Yes'**
  String get galleryTheYes;

  /// No description provided for @galleryTheYesCaption.
  ///
  /// In en, this message translates to:
  /// **'A promise for forever.'**
  String get galleryTheYesCaption;

  /// No description provided for @galleryProposalDate.
  ///
  /// In en, this message translates to:
  /// **'31.01.2026'**
  String get galleryProposalDate;

  /// No description provided for @heroEyebrow.
  ///
  /// In en, this message translates to:
  /// **'THE WEDDING CELEBRATION'**
  String get heroEyebrow;

  /// No description provided for @heroLocation.
  ///
  /// In en, this message translates to:
  /// **'ASTANA, KAZAKHSTAN'**
  String get heroLocation;

  /// No description provided for @heroDate.
  ///
  /// In en, this message translates to:
  /// **'JUNE 2026'**
  String get heroDate;

  /// No description provided for @heroSaveTheDate.
  ///
  /// In en, this message translates to:
  /// **'Save the Date'**
  String get heroSaveTheDate;

  /// No description provided for @heroConfirmButton.
  ///
  /// In en, this message translates to:
  /// **'CONFIRM ATTENDANCE'**
  String get heroConfirmButton;

  /// No description provided for @navRsvpButton.
  ///
  /// In en, this message translates to:
  /// **'RSVP NOW'**
  String get navRsvpButton;

  /// No description provided for @rsvpYourName.
  ///
  /// In en, this message translates to:
  /// **'Your Name'**
  String get rsvpYourName;

  /// No description provided for @rsvpEnterFullName.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get rsvpEnterFullName;

  /// No description provided for @rsvpPleaseEnterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get rsvpPleaseEnterName;

  /// No description provided for @rsvpWillAttend.
  ///
  /// In en, this message translates to:
  /// **'Will you be attending?'**
  String get rsvpWillAttend;

  /// No description provided for @rsvpJoyfullyAccept.
  ///
  /// In en, this message translates to:
  /// **'Joyfully Accept'**
  String get rsvpJoyfullyAccept;

  /// No description provided for @rsvpCantWait.
  ///
  /// In en, this message translates to:
  /// **'Can\'t wait to celebrate!'**
  String get rsvpCantWait;

  /// No description provided for @rsvpRegretfullyDecline.
  ///
  /// In en, this message translates to:
  /// **'Regretfully Decline'**
  String get rsvpRegretfullyDecline;

  /// No description provided for @rsvpInSpirit.
  ///
  /// In en, this message translates to:
  /// **'Will be there in spirit'**
  String get rsvpInSpirit;

  /// No description provided for @rsvpNumberOfGuests.
  ///
  /// In en, this message translates to:
  /// **'Number of Guests'**
  String get rsvpNumberOfGuests;

  /// No description provided for @rsvpPeople.
  ///
  /// In en, this message translates to:
  /// **'people'**
  String get rsvpPeople;

  /// No description provided for @rsvpDietaryRequirements.
  ///
  /// In en, this message translates to:
  /// **'Dietary Requirements'**
  String get rsvpDietaryRequirements;

  /// No description provided for @rsvpAllergies.
  ///
  /// In en, this message translates to:
  /// **'Any allergies or special requests?'**
  String get rsvpAllergies;

  /// No description provided for @rsvpAccommodate.
  ///
  /// In en, this message translates to:
  /// **'We will do our best to accommodate your needs.'**
  String get rsvpAccommodate;

  /// No description provided for @rsvpYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Your Email'**
  String get rsvpYourEmail;

  /// No description provided for @rsvpEmailPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'email@example.com'**
  String get rsvpEmailPlaceholder;

  /// No description provided for @rsvpPleaseEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get rsvpPleaseEnterEmail;

  /// No description provided for @rsvpValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get rsvpValidEmail;

  /// No description provided for @rsvpRespondBy.
  ///
  /// In en, this message translates to:
  /// **'Please respond by the end of February'**
  String get rsvpRespondBy;

  /// No description provided for @rsvpConfirmButton.
  ///
  /// In en, this message translates to:
  /// **'CONFIRM ATTENDANCE'**
  String get rsvpConfirmButton;

  /// No description provided for @rsvpPleaseJoinUs.
  ///
  /// In en, this message translates to:
  /// **'PLEASE JOIN US'**
  String get rsvpPleaseJoinUs;

  /// No description provided for @rsvpLocation.
  ///
  /// In en, this message translates to:
  /// **'Astana, Kazakhstan'**
  String get rsvpLocation;

  /// No description provided for @rsvpThankYou.
  ///
  /// In en, this message translates to:
  /// **'Thank You!'**
  String get rsvpThankYou;

  /// No description provided for @rsvpResponseRecorded.
  ///
  /// In en, this message translates to:
  /// **'Your response has been recorded.\nWe look forward to celebrating with you!'**
  String get rsvpResponseRecorded;

  /// No description provided for @rsvpEventDate.
  ///
  /// In en, this message translates to:
  /// **'Astana  •  June 2026'**
  String get rsvpEventDate;

  /// No description provided for @navOurStory.
  ///
  /// In en, this message translates to:
  /// **'Our Story'**
  String get navOurStory;

  /// No description provided for @navDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get navDetails;

  /// No description provided for @navDressCode.
  ///
  /// In en, this message translates to:
  /// **'Dress Code'**
  String get navDressCode;
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
