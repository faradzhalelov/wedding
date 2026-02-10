import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding/utils/extentions.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Minimal footer with R&F branding, matching the HTML designs.
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.neutralBorder)),
        color: AppColors.backgroundLight,
      ),
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: [
          // Logo
          Text(
            'F & R',
            style: GoogleFonts.playfairDisplay(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '${l10n.astanaCity} \u2022 2025',
            style: AppTextStyles.bodySmall.copyWith(
              letterSpacing: 3,
              color: AppColors.neutral500,
            ),
          ),
          const SizedBox(height: 24),
          // Social icons
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _FooterIcon(Icons.favorite_outline),
              const SizedBox(width: 24),
              _FooterIcon(Icons.share_outlined),
              const SizedBox(width: 24),
              _FooterIcon(Icons.mail_outline),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            l10n.designedWithLove,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.neutral400,
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterIcon extends StatefulWidget {
  const _FooterIcon(this.icon);
  final IconData icon;

  @override
  State<_FooterIcon> createState() => _FooterIconState();
}

class _FooterIconState extends State<_FooterIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 200),
        style: TextStyle(
          color: _hovered ? AppColors.primary : AppColors.neutral400,
        ),
        child: Icon(
          widget.icon,
          size: 22,
          color: _hovered ? AppColors.primary : AppColors.neutral400,
        ),
      ),
    );
  }
}
