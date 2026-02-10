import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;

  double get height => MediaQuery.sizeOf(this).height;

  double get bottom => MediaQuery.paddingOf(this).bottom;

  double get top => MediaQuery.paddingOf(this).top;
}
