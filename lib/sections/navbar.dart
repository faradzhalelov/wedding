import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/responsive_builder.dart';

class NavItem {
  const NavItem(this.label, this.onTap);
  final String label;
  final VoidCallback onTap;
}

/// Sticky navbar. Full links on desktop, hamburger on mobile.
/// Matches the frosted glass style from the HTML designs.
class Navbar extends StatelessWidget {
  const Navbar({super.key, required this.navItems, required this.onRsvpTap});

  final List<NavItem> navItems;
  final VoidCallback onRsvpTap;

  @override
  Widget build(BuildContext context) {
    final screenSize = screenSizeOf(context);
    final showMobileMenu =
        screenSize == ScreenSize.mobile || screenSize == ScreenSize.tablet;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.85),
        border: const Border(
          bottom: BorderSide(color: AppColors.neutralBorder),
        ),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ColorFilter.mode(
            Colors.white.withValues(alpha: 0.1),
            BlendMode.srcOver,
          ),
          child: ContentContainer(
            maxWidth: 1200,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                // Logo
                _Logo(),
                const Spacer(),
                // Desktop nav
                if (!showMobileMenu) ...[
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (final item in navItems)
                          _NavLink(label: item.label, onTap: item.onTap),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  _RsvpButton(onTap: onRsvpTap),
                ],
                // Mobile hamburger
                if (showMobileMenu)
                  _MobileMenuButton(navItems: navItems, onRsvpTap: onRsvpTap),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.favorite, size: 16, color: AppColors.primary),
        ),
        const SizedBox(width: 10),
        Text(
          'R',
          style: GoogleFonts.playfairDisplay(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          '&',
          style: GoogleFonts.playfairDisplay(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
        Text(
          'F',
          style: GoogleFonts.playfairDisplay(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: AppTextStyles.navLink.copyWith(
              color: _hovered
                  ? AppColors.primary
                  : AppColors.textPrimary.withValues(alpha: 0.7),
            ),
            child: Text(widget.label.toUpperCase()),
          ),
        ),
      ),
    );
  }
}

class _RsvpButton extends StatefulWidget {
  const _RsvpButton({required this.onTap});
  final VoidCallback onTap;

  @override
  State<_RsvpButton> createState() => _RsvpButtonState();
}

class _RsvpButtonState extends State<_RsvpButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.primaryDark : AppColors.primary,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.25),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            'RSVP NOW',
            style: AppTextStyles.button.copyWith(letterSpacing: 2),
          ),
        ),
      ),
    );
  }
}

class _MobileMenuButton extends StatelessWidget {
  const _MobileMenuButton({required this.navItems, required this.onRsvpTap});

  final List<NavItem> navItems;
  final VoidCallback onRsvpTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu, color: AppColors.textPrimary),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          builder: (ctx) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 24,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.neutral200,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 32),
                    for (final item in navItems)
                      ListTile(
                        title: Text(
                          item.label,
                          style: AppTextStyles.heading3.copyWith(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          Navigator.pop(ctx);
                          item.onTap();
                        },
                      ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(ctx);
                          onRsvpTap();
                        },
                        child: Text('RSVP NOW', style: AppTextStyles.button),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
