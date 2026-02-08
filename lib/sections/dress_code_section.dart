import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/fade_in_on_scroll.dart';
import '../widgets/responsive_builder.dart';

/// Dress code section matching dress_code_inspiration.html design.
/// Guidelines cards + color palette + do/don't lists + inspiration grid.
class DressCodeSection extends StatelessWidget {
  const DressCodeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = screenSizeOf(context) == ScreenSize.mobile;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 64 : 100),
      child: ContentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero heading + palette
            FadeInOnScroll(
              child: _DressCodeHero(isMobile: isMobile),
            ),
            SizedBox(height: isMobile ? 40 : 64),
            // Guidelines grid
            FadeInOnScroll(
              delay: const Duration(milliseconds: 150),
              child: _GuidelinesGrid(isMobile: isMobile),
            ),
            SizedBox(height: isMobile ? 40 : 64),
            // Inspiration images
            FadeInOnScroll(
              delay: const Duration(milliseconds: 250),
              child: _InspirationGrid(isMobile: isMobile),
            ),
            SizedBox(height: isMobile ? 40 : 64),
            // Do's and Don'ts
            FadeInOnScroll(
              delay: const Duration(milliseconds: 350),
              child: _DosAndDonts(isMobile: isMobile),
            ),
          ],
        ),
      ),
    );
  }
}

class _DressCodeHero extends StatelessWidget {
  const _DressCodeHero({required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Label(),
          const SizedBox(height: 20),
          _Title(isMobile: true),
          const SizedBox(height: 16),
          _Description(),
          const SizedBox(height: 24),
          _ColorPalette(),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Label(),
              const SizedBox(height: 20),
              _Title(isMobile: false),
              const SizedBox(height: 16),
              _Description(),
            ],
          ),
        ),
        const SizedBox(width: 48),
        _ColorPalette(),
      ],
    );
  }
}

class _Label extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 48, height: 1, color: AppColors.primary),
        const SizedBox(width: 12),
        Text(
          'DRESS CODE',
          style: AppTextStyles.label.copyWith(letterSpacing: 3),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Smart Casual',
          style: AppTextStyles.heading1.copyWith(
            fontSize: isMobile ? 40 : 64,
            letterSpacing: -1.5,
          ),
        ),
        Text(
          'Free Classic Style',
          style: AppTextStyles.heading1.copyWith(
            fontSize: isMobile ? 40 : 64,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
            color: AppColors.neutral400,
            letterSpacing: -1.5,
          ),
        ),
      ],
    );
  }
}

class _Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Text(
        'We invite you to join us in an atmosphere of modern elegance. '
        'Think clean lines, monochrome palettes, and sophisticated comfort '
        'suitable for our urban Astana celebration.',
        style: AppTextStyles.bodyLarge,
      ),
    );
  }
}

class _ColorPalette extends StatelessWidget {
  static const _colors = [
    ('Black', Colors.black),
    ('Grey', Color(0xFF6B7280)),
    ('White', Colors.white),
    ('Red Accent', AppColors.primary),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.neutral200.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PALETTE',
            style: AppTextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              color: AppColors.neutral500,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final (name, color) in _colors) ...[
                Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.neutral200,
                          width: color == Colors.white ? 1 : 0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      name,
                      style: AppTextStyles.bodySmall.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                if (name != 'Red Accent') const SizedBox(width: 20),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _GuidelinesGrid extends StatelessWidget {
  const _GuidelinesGrid({required this.isMobile});
  final bool isMobile;

  static const _guidelines = [
    (Icons.palette_outlined, 'Monochrome',
        'Stick to black, white, grey, or muted earth tones. We are aiming for a cohesive, editorial vibe for our wedding photos.'),
    (Icons.checkroom_outlined, 'Modern Silhouettes',
        'Opt for tailored suits, slip dresses, and structured blazers. Clean lines over complex patterns.'),
    (Icons.accessibility_new_outlined, 'Comfortable Elegance',
        'Look sharp but feel free to move. No stiff tuxedos required. Smart casual means polished but relaxed.'),
  ];

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Column(
        children: [
          for (int i = 0; i < _guidelines.length; i++) ...[
            _GuidelineCard(
              icon: _guidelines[i].$1,
              title: _guidelines[i].$2,
              description: _guidelines[i].$3,
            ),
            if (i < _guidelines.length - 1) const SizedBox(height: 16),
          ],
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < _guidelines.length; i++) ...[
          Expanded(
            child: _GuidelineCard(
              icon: _guidelines[i].$1,
              title: _guidelines[i].$2,
              description: _guidelines[i].$3,
            ),
          ),
          if (i < _guidelines.length - 1) const SizedBox(width: 20),
        ],
      ],
    );
  }
}

class _GuidelineCard extends StatefulWidget {
  const _GuidelineCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  State<_GuidelineCard> createState() => _GuidelineCardState();
}

class _GuidelineCardState extends State<_GuidelineCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.neutral200.withValues(alpha: 0.5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _hovered ? 0.08 : 0.03),
              blurRadius: _hovered ? 20 : 8,
              offset: Offset(0, _hovered ? 8 : 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                shape: BoxShape.circle,
              ),
              child: Icon(widget.icon, size: 20, color: AppColors.primary),
            ),
            const SizedBox(height: 16),
            Text(widget.title, style: AppTextStyles.heading3),
            const SizedBox(height: 8),
            Text(
              widget.description,
              style: AppTextStyles.body.copyWith(
                color: AppColors.neutral600,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InspirationGrid extends StatelessWidget {
  const _InspirationGrid({required this.isMobile});
  final bool isMobile;

  static const _items = [
    ('https://lh3.googleusercontent.com/aida-public/AB6AXuDAhr5coY5thTSoytSWKCJ3iXG8pBJljncofYyk2c0uQqulM5H3OVls8e0T48IoHUhxGQG8xkWomzHF1_EAejQUX7xl3EX_pS1JznMd7aRwu1kw_TK8H7I6H111dNZnH9wss8rZsnB3wYy-x3uTPTeCuLHqTT5MDQS33YyIgg28kxwLTjE6LE4WVP5c1wQ-9TB82RchfiWlMoLts530DAmp8e-3bvRApdVnnCInfoDeY3X8M2M9aaKch6ryQShvF8qJzIGL3zem5OU', "Men's Tailoring"),
    ('https://lh3.googleusercontent.com/aida-public/AB6AXuCUJZTwURCY81YRcgIH46Jt0xlddT1MUVY30qQL749ozcpUIfthGfQib1VsrZzoFQwC5Q2BuWPW7Cy5VRLfHbO1J742QMk-pheD5M30xcooe1pETrQhbjh53jBgHfN8jjBm2s34X9T4hELI1kDlRYA1Emlxmzc92Eclsx9XMsmyZZwtVci-y_F7VjJtpIR58qyqr5HqY5KrK6oOPA0OU_DDncJrS0iIHom-UT2FOQ8RsT29QRQ54LC0LLeBKnjAyqLUGh3dfaV92EU', 'Minimalist Silhouettes'),
    ('https://lh3.googleusercontent.com/aida-public/AB6AXuCkgtXhZg8p3TAtr68UzPPd7XXRfkghvzJrUxlmC2u-Ki7Rp-THq3iafiBiJMo1oQd3Jl4utweH_CjVYep1qq4JgBaKIX_e2dOMvfHXN0lvsm3-73Fh8qXRutthjoVFU3nNzN69tSSg2ivzREBa1tUCamUF1ooZNhRn4wioe1mcwqQ-q44hpWR2HrFhAFvLeegrw-cZCZhbLXj84G8B46n84vAE4n_06nR7uUfZwi7g9hucS1DqHI7tCaaGFQakZQoAeNn5ATfn9I4', 'Polished Footwear'),
    ('https://lh3.googleusercontent.com/aida-public/AB6AXuAWSEwf5FfAwg33NUG31KaChH5K1xVbXSfBK6sXGhCrqByOUsVhQkYKVBch2Z9ygsRC5Q5gc8LjUs9_Wm3PG-rZpALnSIf19OMCKb12Uc7TfBz86ntwxHy6y9UBsO9nmmEXz_KhvzPETXs096nT5m9JzanmnTKFyEJemyTgSs4NmFlwZIqFAqg19OkkYdQlnzq-J-bCnz17KkDwVtS_NRc-pv8MYsyFFwy_b5ZFPUPgKV3_WXTfRtiKOQhAvA0KFbZgKF6qpMfXy6U', 'Modern Elegance'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('The Aesthetic', style: AppTextStyles.heading2),
            const Spacer(),
            if (!isMobile)
              Text(
                'Curated Inspiration',
                style: AppTextStyles.bodySmall.copyWith(color: AppColors.neutral500),
              ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.neutral200,
          margin: const EdgeInsets.only(top: 16, bottom: 24),
        ),
        if (isMobile)
          _MobileInspirationList()
        else
          _DesktopInspirationGrid(),
      ],
    );
  }
}

class _DesktopInspirationGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Row(
        children: [
          for (int i = 0; i < _InspirationGrid._items.length; i++) ...[
            Expanded(
              child: _InspirationCard(
                url: _InspirationGrid._items[i].$1,
                label: _InspirationGrid._items[i].$2,
              ),
            ),
            if (i < _InspirationGrid._items.length - 1) const SizedBox(width: 16),
          ],
        ],
      ),
    );
  }
}

class _MobileInspirationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _InspirationGrid._items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, i) {
          return SizedBox(
            width: 200,
            child: _InspirationCard(
              url: _InspirationGrid._items[i].$1,
              label: _InspirationGrid._items[i].$2,
            ),
          );
        },
      ),
    );
  }
}

class _InspirationCard extends StatefulWidget {
  const _InspirationCard({required this.url, required this.label});
  final String url;
  final String label;

  @override
  State<_InspirationCard> createState() => _InspirationCardState();
}

class _InspirationCardState extends State<_InspirationCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedScale(
              scale: _hovered ? 1.05 : 1.0,
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOut,
              child: ColorFiltered(
                colorFilter: _hovered
                    ? const ColorFilter.mode(Colors.transparent, BlendMode.dst)
                    : const ColorFilter.matrix(<double>[
                        0.2126, 0.7152, 0.0722, 0, 0,
                        0.2126, 0.7152, 0.0722, 0, 0,
                        0.2126, 0.7152, 0.0722, 0, 0,
                        0,      0,      0,      1, 0,
                      ]),
                child: Image.network(
                  widget.url,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: AppColors.neutral100,
                  ),
                ),
              ),
            ),
            // Hover label
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
                padding: const EdgeInsets.all(16),
                child: Text(
                  widget.label,
                  style: AppTextStyles.body.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
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

class _DosAndDonts extends StatelessWidget {
  const _DosAndDonts({required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 24 : 48),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.neutral200.withValues(alpha: 0.5)),
      ),
      child: isMobile
          ? Column(
              children: [
                _DoList(),
                const SizedBox(height: 32),
                _DontList(),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _DoList()),
                const SizedBox(width: 48),
                Expanded(child: _DontList()),
              ],
            ),
    );
  }
}

class _DoList extends StatelessWidget {
  static const _items = [
    'Wear Blazers, Loafers, Slip Dresses, and Jumpsuits.',
    'Choose monochrome palettes (Black, White, Grey).',
    'Opt for midi lengths, silk fabrics, and minimal jewelry.',
    'Feel comfortable. Relaxed tailoring is encouraged.',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.check_circle, size: 20, color: AppColors.success),
            const SizedBox(width: 10),
            Text(
              'PLEASE DO',
              style: AppTextStyles.heading3.copyWith(
                letterSpacing: 1.5,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.neutral200,
          margin: const EdgeInsets.symmetric(vertical: 16),
        ),
        for (final item in _items)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  margin: const EdgeInsets.only(top: 6),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item,
                    style: AppTextStyles.body.copyWith(color: AppColors.neutral600),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _DontList extends StatelessWidget {
  static const _items = [
    'Wear Jeans, T-shirts, or Athletic Sneakers.',
    'Wear Neon or overly bright colors.',
    'Wear heavily patterned or branded clothing.',
    'Feel pressured to wear a full tuxedo.',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.cancel, size: 20, color: AppColors.primary),
            const SizedBox(width: 10),
            Text(
              "PLEASE DON'T",
              style: AppTextStyles.heading3.copyWith(
                letterSpacing: 1.5,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.neutral200,
          margin: const EdgeInsets.symmetric(vertical: 16),
        ),
        for (final item in _items)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  margin: const EdgeInsets.only(top: 6),
                  decoration: const BoxDecoration(
                    color: AppColors.neutral400,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item,
                    style: AppTextStyles.body.copyWith(color: AppColors.neutral600),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
