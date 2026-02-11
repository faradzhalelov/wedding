import 'package:flutter/material.dart';
import 'package:wedding/utils/extentions.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/fade_in_on_scroll.dart';
import '../widgets/responsive_builder.dart';

/// Event details section matching events_details.html design.
/// Hero date display + timeline + map placeholder.
class EventDetailsSection extends StatelessWidget {
  const EventDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = screenSizeOf(context);
    final isMobile = screen == ScreenSize.mobile;

    return Container(
      width: double.infinity,
      color: AppColors.backgroundLight,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 64 : 100),
      child: Column(
        children: [
          // Date hero
          FadeInOnScroll(child: _DateHero(isMobile: isMobile)),
          SizedBox(height: isMobile ? 48 : 80),
          // Timeline + Map
          ContentContainer(
            maxWidth: 1100,
            child: isMobile ? _MobileLayout() : _DesktopLayout(),
          ),
          //SizedBox(height: isMobile ? 48 : 80),
          // CTA
         // FadeInOnScroll(child: _CtaSection()),
        ],
      ),
    );
  }
}

class _DateHero extends StatelessWidget {
  const _DateHero({required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    return Column(
      children: [
        Text(
          l10n.theCelebration,
          style: AppTextStyles.label.copyWith(letterSpacing: 3),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              l10n.monthJune,
              style: AppTextStyles.heroDisplay.copyWith(
                fontSize: isMobile ? 48 : 80,
                fontWeight: FontWeight.w200,
                letterSpacing: -1,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.day24th,
                  style: AppTextStyles.heading2.copyWith(
                    fontSize: isMobile ? 32 : 48,
                  ),
                ),
                Text(
                  l10n.year2025,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: isMobile ? 16 : 20,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 32),
        Container(
          width: 80,
          height: 1,
          color: AppColors.primary.withValues(alpha: 0.3),
        ),
        const SizedBox(height: 32),
        // Venue cards
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Wrap(
            spacing: 24,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              _InfoCard(
                icon: Icons.location_on_outlined,
                title: l10n.locationAstana,
                subtitle: l10n.locationSubtitle,
              ),
              _InfoCard(
                icon: Icons.storefront_outlined,
                title: l10n.venueGuestHouse,
                subtitle: l10n.venueMainBallroom,
              ),
            ],
          ),
        ),
        // const SizedBox(height: 32),
        // // Add to calendar button
        // _CalendarButton(),
      ],
    );
  }
}

class _InfoCard extends StatefulWidget {
  const _InfoCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  State<_InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<_InfoCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered
                ? AppColors.primary.withValues(alpha: 0.3)
                : AppColors.neutral200,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _hovered ? 0.06 : 0.03),
              blurRadius: _hovered ? 16 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon, size: 28, color: AppColors.textSecondary),
            const SizedBox(height: 12),
            Text(
              widget.title,
              style: AppTextStyles.heading3.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(widget.subtitle, style: AppTextStyles.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _CalendarButton extends StatefulWidget {
  @override
  State<_CalendarButton> createState() => _CalendarButtonState();
}

class _CalendarButtonState extends State<_CalendarButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.primaryLight.withValues(alpha: 0.3)
                : Colors.white,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: _hovered
                  ? AppColors.primary.withValues(alpha: 0.5)
                  : AppColors.neutral200,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 18,
                color: AppColors.primary,
              ),
              const SizedBox(width: 10),
              Text(
                l10n.addToCalendar,
                style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left: Map + directions
        Expanded(flex: 5, child: FadeInOnScroll(child: _MapCard())),
        // const SizedBox(width: 64),
        // // Right: Timeline
        // Expanded(flex: 7, child: _Timeline()),
      ],
    );
  }
}

class _MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInOnScroll(child: _MapCard()),
        //const SizedBox(height: 48),
       // _Timeline(),
      ],
    );
  }
}

class _MapCard extends StatefulWidget {
  @override
  State<_MapCard> createState() => _MapCardState();
}

class _MapCardState extends State<_MapCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.gettingThere, style: AppTextStyles.heading2),
        const SizedBox(height: 12),
        Text(
          l10n.gettingThereDesc,
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 24),
        MouseRegion(
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.neutral200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AnimatedScale(
                    scale: _hovered ? 1.05 : 1.0,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeInOut,
                    child: Image.network(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuBHDjq9kyLvZjCURbw8i2dXQgI28PweKGLFmPRvMUqxZ8j8x_UO3UW7BwCaSK8supC4I1CVMd7uOnXfr3beRvmfNpqZZACtBKjDkAi_DlS62SNnMZwXJMnwa6DrJW4ufgRPhRgrGad0PT88DkrYAb9lV-mZaKydaR6IfYH_HZvzQmLcT-abWzbUNj_imzC_btG8yMDZ6dlnqsGFEtW4PUugOlAwSK9jdFXJGeeHJMbumJCZsoJicMqEW1bmeswrzB09cyEUZdNcxzE',
                      fit: BoxFit.cover,
                      color: Colors.black.withValues(alpha: 0.15),
                      colorBlendMode: BlendMode.darken,
                      errorBuilder: (_, __, ___) => Container(
                        color: AppColors.neutral100,
                        child: const Center(
                          child: Icon(
                            Icons.map,
                            size: 64,
                            color: AppColors.neutral400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Gradient
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black45, Colors.transparent],
                      ),
                    ),
                  ),
                  // Pin
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.4),
                                blurRadius: 16,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.9),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            l10n.venue,
                            style: AppTextStyles.label.copyWith(fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Directions button
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.directions,
                            size: 18,
                            color: AppColors.textPrimary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            l10n.getDirections,
                            style: AppTextStyles.body.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final events = [
      _TimelineEvent(
        time: l10n.event1Time,
        icon: Icons.groups_outlined,
        tag: l10n.event1Tag,
        title: l10n.event1Title,
        description: l10n.event1Desc,
      ),
      _TimelineEvent(
        time: l10n.event2Time,
        icon: Icons.favorite_outline,
        tag: l10n.event2Tag,
        title: l10n.event2Title,
        description: l10n.event2Desc,
      ),
      _TimelineEvent(
        time: l10n.event3Time,
        icon: Icons.restaurant_outlined,
        tag: l10n.event3Tag,
        title: l10n.event3Title,
        description: l10n.event3Desc,
      ),
      _TimelineEvent(
        time: l10n.event4Time,
        icon: Icons.queue_music_outlined,
        tag: l10n.event4Tag,
        title: l10n.event4Title,
        description: l10n.event4Desc,
      ),
      _TimelineEvent(
        time: l10n.event5Time,
        icon: Icons.auto_awesome_outlined,
        tag: l10n.event5Tag,
        title: l10n.event5Title,
        description: l10n.event5Desc,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.orderOfEvents, style: AppTextStyles.heading2),
        const SizedBox(height: 8),
        Text(
          l10n.orderOfEventsDesc,
          style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
        ),
        const SizedBox(height: 40),
        for (int i = 0; i < events.length; i++)
          FadeInOnScroll(
            delay: Duration(milliseconds: 100 * i),
            child: _TimelineItem(
              event: events[i],
              isLast: i == events.length - 1,
            ),
          ),
      ],
    );
  }
}

class _TimelineEvent {
  const _TimelineEvent({
    required this.time,
    required this.icon,
    required this.tag,
    required this.title,
    required this.description,
  });

  final String time;
  final IconData icon;
  final String tag;
  final String title;
  final String description;
}

class _TimelineItem extends StatefulWidget {
  const _TimelineItem({required this.event, required this.isLast});
  final _TimelineEvent event;
  final bool isLast;

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time + dot + line
            SizedBox(
              width: 80,
              child: Column(
                children: [
                  Text(
                    widget.event.time,
                    style: AppTextStyles.heading3.copyWith(
                      fontWeight: FontWeight.w300,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            // Dot and line
            Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: _hovered ? 3 : 2,
                      ),
                    ],
                  ),
                ),
                if (!widget.isLast)
                  Expanded(
                    child: Container(width: 1, color: AppColors.neutral200),
                  ),
              ],
            ),
            const SizedBox(width: 20),
            // Card
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: widget.isLast ? 0 : 24),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.neutral200.withValues(alpha: 0.5),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(
                          alpha: _hovered ? 0.06 : 0.02,
                        ),
                        blurRadius: _hovered ? 16 : 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(
                            widget.event.icon,
                            size: 18,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            widget.event.tag.toUpperCase(),
                            style: AppTextStyles.label.copyWith(fontSize: 10),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(widget.event.title, style: AppTextStyles.heading3),
                      const SizedBox(height: 6),
                      Text(
                        widget.event.description,
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
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

class _CtaSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 64),
      child: Column(
        children: [
          Icon(
            Icons.mark_email_read_outlined,
            size: 40,
            color: AppColors.textSecondary.withValues(alpha: 0.4),
          ),
          const SizedBox(height: 20),
          Text(
            l10n.canYouMakeIt,
            style: AppTextStyles.heading2.copyWith(fontSize: 36),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.honoredToHaveYou,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
