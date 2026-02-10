import 'package:flutter/material.dart';
import 'package:wedding/utils/extentions.dart';

import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/fade_in_on_scroll.dart';
import '../widgets/responsive_builder.dart';
import '../widgets/section_heading.dart';

/// Gallery / Memories section matching memories_story.html design.
/// Desktop: mosaic grid. Mobile: vertical cards with staggered layout.
class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final screen = screenSizeOf(context);
    final isMobile = screen == ScreenSize.mobile;

    final images = [
      _GalleryImage(
        url:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAjCnq0gZ4HdmaI9UzfA91_pQ83B1IctfDiaJfAbS8AEjK5DUhzz4Fn8KbDkq8RS70jmyS-9Qc2Esg66kpVy5cqsOtV1Lbci6udOpphHF7TVEW72Xi37jLI1Zd11DyhBMswzfEv4AbAwGNa5ZUi50cX92YKrlvrPkA6bVd4HuldYyIA8XXcfoCQfBgM47KN9vIOuOj8--W9SPf-P_ky75nBnh2MRnZtLo79jdlw569DHPpBJGxzgR3PorCBRKtOfOgT0as0Dx1QpgU',
        alt: 'Childhood memory - Riza',
        label: l10n.galleryRiza,
        caption: l10n.galleryRizaCaption,
      ),
      _GalleryImage(
        url:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDYF8uqeoxUz-AQKaaIb3KQs4dW1hm35sDMwjHK5nC6pFjv74Bee4IWHF7182PKU5rukyIRWA1o2ljK4Ccjob506TClzz3heyVC0-VyPepfP09HPSWy34eDYpaRipOLlSRluuuHhriCWgQKBrymYL4LxLhrEki-9kR4n1JD7_IG4dZitNebQvmqIKPOp1q5h6-TFY6jSigmr5oeM2iJJE-0DSE-R70igmKKi-d_pP2atvBw84DMZ8i73_AM3DXLkED-k7ifRoSkFKY',
        alt: 'Childhood memory - Farkhat',
        label: l10n.galleryFarkhat,
        caption: l10n.galleryFarkhatCaption,
      ),
      _GalleryImage(
        url:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAiFP3yGXT93UKHCPnWrDlvtShW5tHTOjTdw0EWXhTpmVCIpRDiaB3fK6CqaO2k-_wAQK9ouvvhQ2VUqtmmHh1NSzZxPcdtQiiF0gAKGI2RkL7PzKsq0NkQ5nfeySs5PkGeh9_8Q7GOW2Un8hdcCvsX1cOUo-A2WjK6S4IXHiwzFmdzhaf2_VunccPY_REFF2Yx-2tOZIpH0BPlLxEigN8paUL2vLmYxfXhQ3c8aAG6ZmI1GA1dCmXS7bgerbiu05rnYe_ckwic5bM',
        alt: 'First date at the cafe',
        label: l10n.galleryFirstDate,
        caption: l10n.galleryFirstDateCaption,
      ),
      _GalleryImage(
        url:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAd-hjlqDDfCNhbIP0h6M4wC2bOENmg1jK31ERU08qnu-YhZOymv4UR2x1nrfCbo5eBSzDvQH6Ccv0W7_qzpSZGMhnbpHt1kkMKBSzGddhmt4rx3hTnXCazEwCEqFSB1bKvhG4OphhEjcART-McZbcI4u3bxDxEYBHNa72ZW-T_UHXfBxUcArjIXbQmKofyOO4Vb8oHKs_O5K6ItVJ5O3eAJw4eb5FHYxkjYa1CrYP8OpGYZI4q8CAgW9Bx5l5K8QqWtznVJT2a2Lw',
        alt: 'Together',
        label: l10n.galleryTogether,
        caption: l10n.galleryTogetherCaption,
      ),
      _GalleryImage(
        url:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAyc52vjWFmt8veN76nC0VLAbKg3hK-zNSIzsqxVz_DfEidDqc664qvm0a7ZCqQfXv6kOureXzy5TiCipgDwSy4bOzGiP7OBrK5bjnPRAxsj7HdBS3yOkMgZT-jV2UCkPn6xDI_WKEii3iPQfY4CSMTUOSvfLa053yidcG8sloGYZsLIOplnLl-RVNhcUqI9FjuZjB9G2itDLrWFeKOGXDjdnlaFGS5tqi1vfW0cub4gq6jZ5fnhOL0C4Y4mOFe75p8f5J4IgTLJxk',
        alt: 'Astana cityscape',
        label: l10n.galleryOurCity,
        caption: l10n.galleryOurCityCaption,
      ),
      _GalleryImage(
        url:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAGNepL2EkRDoOs7IwXcMzVmAuDbVLW7ylU3ly7JquuUuyhXsN0PYz-vD3i_138qK2YpIDRgyOq0nvQ0OL_7DPOb5hArhe0LueJWNJPmS32MCuw4q6F-g2lUVpMrhnqcaRh9rP7ElV5YRf9O_BqtRnfSiBDig0ANNrhSgYT2qjCM_LssYbDI2TfQk3H_WNidWMODK5gmi5ndGfnLkpaZydMl9N5-RwO0sOQj53CIEiKZtsHU2aMkfk2qVpYom_roxdKDKZ2e-2nFss',
        alt: 'The proposal',
        label: l10n.galleryTheYes,
        caption: l10n.galleryTheYesCaption,
      ),
    ];

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 64 : 100),
      child: ContentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInOnScroll(child: _HeroRow(isMobile: isMobile)),
            SizedBox(height: isMobile ? 48 : 80),
            FadeInOnScroll(
              delay: const Duration(milliseconds: 100),
              child: SectionHeading(
                label: l10n.memoriesLabel,
                title: l10n.ourStoryInPhotos,
                subtitle: l10n.memoriesSubtitle,
              ),
            ),
            const SizedBox(height: 48),
            if (isMobile)
              _MobileGallery(images: images)
            else
              _DesktopMosaicGrid(images: images),
          ],
        ),
      ),
    );
  }
}

class _GalleryImage {
  const _GalleryImage({
    required this.url,
    required this.alt,
    required this.label,
    required this.caption,
  });

  final String url;
  final String alt;
  final String label;
  final String caption;
}

class _HeroRow extends StatelessWidget {
  const _HeroRow({required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.twoLives,
            style: AppTextStyles.heading1.copyWith(
              fontSize: 42,
              letterSpacing: -1.5,
            ),
          ),
          Text(
            l10n.onePath,
            style: AppTextStyles.heading1.copyWith(
              fontSize: 42,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
              color: AppColors.neutral400,
              letterSpacing: -1.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(l10n.memoryDescMobile, style: AppTextStyles.bodyLarge),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.twoLives, style: AppTextStyles.heading1),
              Text(
                l10n.onePath,
                style: AppTextStyles.heading1.copyWith(
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  color: AppColors.neutral400,
                ),
              ),
              const SizedBox(height: 20),
              Text(l10n.memoryDescDesktop, style: AppTextStyles.bodyLarge),
            ],
          ),
        ),
        //const SizedBox(width: 48),
        // Established badge
        // Container(
        //   padding: const EdgeInsets.all(24),
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(12),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.black.withValues(alpha: 0.06),
        //         blurRadius: 24,
        //         offset: const Offset(0, 8),
        //       ),
        //     ],
        //   ),
        //   child: Column(
        //     children: [
        //       Text(
        //         l10n.established,
        //         style: AppTextStyles.bodySmall.copyWith(
        //           letterSpacing: 2,
        //           color: AppColors.neutral500,
        //         ),
        //       ),
        //       const SizedBox(height: 4),
        //       Text(
        //         l10n.year2018,
        //         style: AppTextStyles.heading2.copyWith(
        //           color: AppColors.primary,
        //           fontSize: 28,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class _DesktopMosaicGrid extends StatelessWidget {
  const _DesktopMosaicGrid({required this.images});
  final List<_GalleryImage> images;

  @override
  Widget build(BuildContext context) {
    // Custom mosaic layout matching the HTML design
    return Column(
      children: [
        // Row 1: Two portrait cards side by side (Origins)
        SizedBox(
          height: 500,
          child: Row(
            children: [
              Expanded(
                child: FadeInOnScroll(
                  delay: const Duration(milliseconds: 200),
                  child: _GalleryCard(
                    image: images[0],
                    aspectRatio: null,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: FadeInOnScroll(
                  delay: const Duration(milliseconds: 350),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: _GalleryCard(
                      image: images[1],
                      aspectRatio: null,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Row 2: Three cards — large + two stacked
        SizedBox(
          height: 450,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: FadeInOnScroll(
                  delay: const Duration(milliseconds: 400),
                  child: _GalleryCard(
                    image: images[2],
                    aspectRatio: null,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: FadeInOnScroll(
                        delay: const Duration(milliseconds: 500),
                        child: _GalleryCard(
                          image: images[3],
                          aspectRatio: null,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: FadeInOnScroll(
                        delay: const Duration(milliseconds: 600),
                        child: _GalleryCard(
                          image: images[4],
                          aspectRatio: null,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Row 3: Full width proposal
        FadeInOnScroll(
          delay: const Duration(milliseconds: 700),
          child: SizedBox(
            height: 400,
            width: double.infinity,
            child: _ProposalCard(image: images[5]),
          ),
        ),
      ],
    );
  }
}

class _MobileGallery extends StatelessWidget {
  const _MobileGallery({required this.images});
  final List<_GalleryImage> images;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < images.length; i++) ...[
          FadeInOnScroll(
            delay: Duration(milliseconds: 100 * i),
            child: _GalleryCard(
              image: images[i],
              aspectRatio: i == images.length - 1 ? 4 / 5 : 3 / 4,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          if (i < images.length - 1) const SizedBox(height: 20),
        ],
      ],
    );
  }
}

class _GalleryCard extends StatefulWidget {
  const _GalleryCard({
    required this.image,
    this.aspectRatio,
    required this.borderRadius,
  });

  final _GalleryImage image;
  final double? aspectRatio;
  final BorderRadius borderRadius;

  @override
  State<_GalleryCard> createState() => _GalleryCardState();
}

class _GalleryCardState extends State<_GalleryCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    Widget content = MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _hovered ? 0.12 : 0.06),
              blurRadius: _hovered ? 20 : 12,
              offset: Offset(0, _hovered ? 8 : 4),
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedScale(
              scale: _hovered ? 1.03 : 1.0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
              child: ColorFiltered(
                colorFilter: _hovered
                    ? const ColorFilter.mode(Colors.transparent, BlendMode.dst)
                    : const ColorFilter.matrix(<double>[
                        0.2126,
                        0.7152,
                        0.0722,
                        0,
                        0,
                        0.2126,
                        0.7152,
                        0.0722,
                        0,
                        0,
                        0.2126,
                        0.7152,
                        0.0722,
                        0,
                        0,
                        0,
                        0,
                        0,
                        1,
                        0,
                      ]),
                child: Image.network(
                  widget.image.url,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: AppColors.neutral100,
                    child: const Center(
                      child: Icon(
                        Icons.image,
                        size: 48,
                        color: AppColors.neutral400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Label badge
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.85),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  widget.image.label.toUpperCase(),
                  style: AppTextStyles.label.copyWith(
                    fontSize: 10,
                    color: AppColors.textPrimary,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
            // Hover overlay with caption
            AnimatedOpacity(
              opacity: _hovered ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [Colors.black54, Colors.transparent],
                  ),
                ),
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(20),
                child: Text(
                  widget.image.caption,
                  style: AppTextStyles.body.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    if (widget.aspectRatio != null) {
      return AspectRatio(aspectRatio: widget.aspectRatio!, child: content);
    }
    return content;
  }
}

class _ProposalCard extends StatefulWidget {
  const _ProposalCard({required this.image});
  final _GalleryImage image;

  @override
  State<_ProposalCard> createState() => _ProposalCardState();
}

class _ProposalCardState extends State<_ProposalCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedScale(
              scale: _hovered ? 1.03 : 1.0,
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOut,
              child: Image.network(
                widget.image.url,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Container(color: AppColors.neutral100),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.black54, Colors.transparent],
                ),
              ),
            ),
            Positioned(
              left: 40,
              top: 0,
              bottom: 0,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.image.label,
                      style: AppTextStyles.heading2.copyWith(
                        color: Colors.white,
                        fontSize: 36,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.image.caption,
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.galleryProposalDate,
                      style: AppTextStyles.label.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
