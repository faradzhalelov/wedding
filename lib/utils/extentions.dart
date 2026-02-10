import 'package:flutter/widgets.dart';
import 'package:wedding/l10n/app_localizations.dart';

extension ContextLocalization on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;
}


extension MediaQueryExtension on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;

  double get height => MediaQuery.sizeOf(this).height;

  double get bottom =>MediaQuery.paddingOf(this).bottom;

  double get top =>MediaQuery.paddingOf(this).top;
}
