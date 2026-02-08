import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Reusable section header with red accent line + uppercase label.
/// Matches the pattern used across all HTML design files.
class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.label,
    required this.title,
    this.subtitle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String label;
  final String title;
  final String? subtitle;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48,
              height: 1,
              color: AppColors.primary,
            ),
            const SizedBox(width: 12),
            Text(
              label.toUpperCase(),
              style: AppTextStyles.label,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: AppTextStyles.heading2,
          textAlign: crossAxisAlignment == CrossAxisAlignment.center
              ? TextAlign.center
              : TextAlign.start,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          Text(
            subtitle!,
            style: AppTextStyles.bodyLarge,
            textAlign: crossAxisAlignment == CrossAxisAlignment.center
                ? TextAlign.center
                : TextAlign.start,
          ),
        ],
      ],
    );
  }
}
