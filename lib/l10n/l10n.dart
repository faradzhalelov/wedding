import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('ru'),
    const Locale('en'),
    const Locale('kk'),
  ];
}

enum L10nEnum {
  ru('Русский'),
  kk('Қазақша'),
  en('English');

  const L10nEnum(this.localName);
  final String localName;
}
