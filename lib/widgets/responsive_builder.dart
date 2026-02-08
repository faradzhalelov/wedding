import 'package:flutter/material.dart';

/// Breakpoints from ABOUT.md spec:
/// <600 mobile | 600–1100 tablet | >1100 desktop
enum ScreenSize { mobile, tablet, desktop }

ScreenSize getScreenSize(double width) {
  if (width < 600) return ScreenSize.mobile;
  if (width < 1100) return ScreenSize.tablet;
  return ScreenSize.desktop;
}

/// Builds different layouts per breakpoint.
/// Avoids "simply stacking everything" by forcing explicit layouts.
class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = getScreenSize(constraints.maxWidth);
        switch (size) {
          case ScreenSize.mobile:
            return mobile;
          case ScreenSize.tablet:
            return tablet ?? desktop;
          case ScreenSize.desktop:
            return desktop;
        }
      },
    );
  }
}

/// Helper to get screen size from context (uses full viewport width).
ScreenSize screenSizeOf(BuildContext context) {
  return getScreenSize(MediaQuery.sizeOf(context).width);
}

/// Consistent max-width wrapper for content sections.
class ContentContainer extends StatelessWidget {
  const ContentContainer({
    super.key,
    required this.child,
    this.maxWidth = 1200,
    this.padding,
  });

  final Widget child;
  final double maxWidth;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final isMobile = screenSizeOf(context) == ScreenSize.mobile;
    return Center(
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxWidth: maxWidth),
        padding: padding ??
            EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
        child: child,
      ),
    );
  }
}
