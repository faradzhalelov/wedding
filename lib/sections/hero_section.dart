import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/responsive_builder.dart';

/// Fullscreen hero section matching wedding_hero_section.html design.
/// Gradient blobs + noise texture + arch-top hero image.
class HeroSection extends StatefulWidget {
  const HeroSection({super.key, required this.onConfirmTap});

  final VoidCallback onConfirmTap;

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final List<Animation<double>> _fadeAnims;
  late final List<Animation<Offset>> _slideAnims;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // Staggered fade-in animations for hero elements
    _fadeAnims = List.generate(4, (i) {
      final start = i * 0.15;
      final end = (start + 0.4).clamp(0.0, 1.0);
      return CurvedAnimation(
        parent: _fadeController,
        curve: Interval(start, end, curve: Curves.easeOut),
      );
    });

    _slideAnims = List.generate(4, (i) {
      final start = i * 0.15;
      final end = (start + 0.4).clamp(0.0, 1.0);
      return Tween<Offset>(
        begin: const Offset(0, 20),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _fadeController,
        curve: Interval(start, end, curve: Curves.easeOutCubic),
      ));
    });

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = screenSizeOf(context);
    final isMobile = screen == ScreenSize.mobile;

    return ClipRect(
      child: SizedBox(
        width: double.infinity,
        // Paint background blobs via CustomPaint — avoids Stack unbounded constraint issue
        child: CustomPaint(
          painter: _BlobPainter(),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 24 : 48,
                  vertical: isMobile ? 80 : 100,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Eyebrow
                    _AnimatedElement(
                      fade: _fadeAnims[0],
                      slide: _slideAnims[0],
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 4),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.primary,
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: Text(
                          'THE WEDDING CELEBRATION',
                          style: AppTextStyles.label.copyWith(
                            color: AppColors.primary.withValues(alpha: 0.8),
                            fontSize: 11,
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: isMobile ? 24 : 32),
                    // Main title
                    _AnimatedElement(
                      fade: _fadeAnims[1],
                      slide: _slideAnims[1],
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: 'Riza '),
                            TextSpan(
                              text: '& ',
                              style: GoogleFonts.playfairDisplay(
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                                color: AppColors.primary,
                              ),
                            ),
                            TextSpan(text: 'Farkhat'),
                          ],
                        ),
                        style: isMobile
                            ? AppTextStyles.heroDisplayMobile
                            : AppTextStyles.heroDisplay,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: isMobile ? 24 : 36),
                    // Location & Date
                    _AnimatedElement(
                      fade: _fadeAnims[2],
                      slide: _slideAnims[2],
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 24,
                        runSpacing: 8,
                        children: [
                          Text(
                            'ASTANA, KAZAKHSTAN',
                            style: AppTextStyles.navLink.copyWith(
                              color: AppColors.neutral500,
                              letterSpacing: 2,
                            ),
                          ),
                          Container(
                            width: 32,
                            height: 1,
                            color: AppColors.neutral200,
                          ),
                          Text(
                            'JUNE 2025',
                            style: AppTextStyles.navLink.copyWith(
                              color: AppColors.neutral500,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: isMobile ? 32 : 48),
                    // Hero image
                    _AnimatedElement(
                      fade: _fadeAnims[3],
                      slide: _slideAnims[3],
                      child: _HeroImage(isMobile: isMobile),
                    ),
                    const SizedBox(height: 48),
                    // CTA
                    _AnimatedElement(
                      fade: _fadeAnims[3],
                      slide: _slideAnims[3],
                      child: _ConfirmButton(onTap: widget.onConfirmTap),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedElement extends StatelessWidget {
  const _AnimatedElement({
    required this.fade,
    required this.slide,
    required this.child,
  });

  final Animation<double> fade;
  final Animation<Offset> slide;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: fade,
      builder: (context, child) {
        return Transform.translate(
          offset: slide.value,
          child: Opacity(opacity: fade.value, child: child),
        );
      },
      child: child,
    );
  }
}

/// Paints soft gradient blobs behind the hero content.
/// Uses CustomPainter instead of a Stack to avoid unbounded constraint
/// issues when placed inside a SingleChildScrollView → Column.
class _BlobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _drawBlob(
      canvas,
      center: Offset(-50 + 200, -100 + 200),
      radius: 200,
      color: AppColors.primary.withValues(alpha: 0.05),
    );
    _drawBlob(
      canvas,
      center: Offset(size.width + 80 - 175, 200 + 175),
      radius: 175,
      color: const Color(0xFFF4A261).withValues(alpha: 0.08),
    );
    _drawBlob(
      canvas,
      center: Offset(150 + 125, size.height - 50 - 125),
      radius: 125,
      color: AppColors.primary.withValues(alpha: 0.04),
    );
  }

  void _drawBlob(Canvas canvas, {
    required Offset center,
    required double radius,
    required Color color,
  }) {
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [color, Colors.transparent],
      ).createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _HeroImage extends StatefulWidget {
  const _HeroImage({required this.isMobile});
  final bool isMobile;

  @override
  State<_HeroImage> createState() => _HeroImageState();
}

class _HeroImageState extends State<_HeroImage> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final width = widget.isMobile ? 280.0 : 520.0;
    final height = widget.isMobile ? 360.0 : 340.0;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(width / 2),
            topRight: Radius.circular(width / 2),
            bottomLeft: const Radius.circular(12),
            bottomRight: const Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 40,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedScale(
              scale: _hovered ? 1.05 : 1.0,
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOut,
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuB4T7u5g9GjaDQzvcRBPpmVjfDrENYE3HV79LY4LpRXb3pMnLDoGdLvozEnk-vma7CTy_-MNufM8ZEXxv3NYGy00EAg_uhH1KytoAWtkmCvx_L6xiT2qxyA_HocSeKVPzJZLEcWvplanSzPNBq-fOhvpoT2sxWShijlh2L5FqcY0AvCJna9OcGi7VGzutNy1omRgsNq8zRdPgce_VMTLfX18q3aaoh_4zj5JBNN6zl6BogBBH_divfiMCS_fXFZANVcKq2CyqtbyB0',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: AppColors.neutral100,
                  child: const Icon(Icons.image, size: 48, color: AppColors.neutral400),
                ),
              ),
            ),
            // Gradient overlay
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black38, Colors.transparent],
                ),
              ),
            ),
            // Save the date label
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Text(
                    'Save the Date',
                    style: AppTextStyles.body.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ConfirmButton extends StatefulWidget {
  const _ConfirmButton({required this.onTap});
  final VoidCallback onTap;

  @override
  State<_ConfirmButton> createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<_ConfirmButton> {
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
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.primaryDark : AppColors.textPrimary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'CONFIRM ATTENDANCE',
            style: AppTextStyles.button.copyWith(letterSpacing: 2),
          ),
        ),
      ),
    );
  }
}
