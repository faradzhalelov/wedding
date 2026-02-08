import 'package:flutter/material.dart';

import 'sections/navbar.dart';
import 'sections/hero_section.dart';
import 'sections/gallery_section.dart';
import 'sections/event_details_section.dart';
import 'sections/dress_code_section.dart';
import 'sections/rsvp_section.dart';
import 'sections/footer_section.dart';

/// Single scroll landing page composing all sections.
/// Uses GlobalKey + ScrollController for smooth scroll navigation.
///
/// Why not GoRouter? There are no routes. Everything is on one page.
/// Scroll-to-section via GlobalKey is simpler and more reliable for
/// a single-page wedding invitation.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  // Section keys for scroll targeting
  final _heroKey = GlobalKey();
  final _galleryKey = GlobalKey();
  final _detailsKey = GlobalKey();
  final _dressCodeKey = GlobalKey();
  final _rsvpKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  List<NavItem> get _navItems => [
        NavItem('Our Story', () => _scrollToSection(_galleryKey)),
        NavItem('Details', () => _scrollToSection(_detailsKey)),
        NavItem('Dress Code', () => _scrollToSection(_dressCodeKey)),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Top padding for sticky navbar
                const SizedBox(height: 72),
                _Section(key: _heroKey, child: HeroSection(
                  onConfirmTap: () => _scrollToSection(_rsvpKey),
                )),
                _Section(key: _galleryKey, child: const GallerySection()),
                _Section(key: _detailsKey, child: const EventDetailsSection()),
                _Section(key: _dressCodeKey, child: const DressCodeSection()),
                _Section(key: _rsvpKey, child: const RsvpSection()),
                const FooterSection(),
              ],
            ),
          ),
          // Sticky navbar on top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              navItems: _navItems,
              onRsvpTap: () => _scrollToSection(_rsvpKey),
            ),
          ),
        ],
      ),
    );
  }
}

/// Thin wrapper — just holds a key for scroll targeting.
/// No extra padding or decoration to avoid interfering with
/// each section's own layout.
class _Section extends StatelessWidget {
  const _Section({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => child;
}
