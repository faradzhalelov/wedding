import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../utils/extentions.dart';
import '../widgets/fade_in_on_scroll.dart';
import '../widgets/responsive_builder.dart';

/// RSVP form section matching form.html design.
/// Uses plain setState — adding Riverpod/Bloc for a single form
/// with 5 fields would be over-engineering.
class RsvpSection extends StatefulWidget {
  const RsvpSection({super.key});

  @override
  State<RsvpSection> createState() => _RsvpSectionState();
}

class _RsvpSectionState extends State<RsvpSection> {
  final _formKey = GlobalKey<FormState>();
  bool _attending = true;
  int _guestCount = 1;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dietaryController = TextEditingController();
  bool _submitted = false;
  bool _submitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _dietaryController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _submitting = true);

    // Mock submission — swap with real API call when backend exists.
    await Future.delayed(const Duration(milliseconds: 1200));

    if (mounted) {
      setState(() {
        _submitting = false;
        _submitted = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = screenSizeOf(context) == ScreenSize.mobile;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColors.backgroundLight),
      padding: EdgeInsets.symmetric(vertical: isMobile ? 64 : 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FadeInOnScroll(
              child: _submitted
                  ? _SuccessState()
                  : _buildForm(context, isMobile),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context, bool isMobile) {
    final l10n = context.localization;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.08),
            blurRadius: 60,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header image
          _HeaderImage(),
          // Form
          Padding(
            padding: EdgeInsets.all(isMobile ? 24 : 40),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Name field
                  _FormLabel(l10n.rsvpYourName),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: l10n.rsvpEnterFullName,
                    ),
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? l10n.rsvpPleaseEnterName
                        : null,
                  ),
                  const SizedBox(height: 28),
                  // Attendance toggle
                  _FormLabel(l10n.rsvpWillAttend),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _AttendanceOption(
                          selected: _attending,
                          title: l10n.rsvpJoyfullyAccept,
                          subtitle: l10n.rsvpCantWait,
                          color: AppColors.primary,
                          onTap: () => setState(() => _attending = true),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _AttendanceOption(
                          selected: !_attending,
                          title: l10n.rsvpRegretfullyDecline,
                          subtitle: l10n.rsvpInSpirit,
                          color: AppColors.neutral500,
                          onTap: () => setState(() => _attending = false),
                        ),
                      ),
                    ],
                  ),
                  // Conditional fields (only when attending)
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: _attending
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 28),
                              // Guest counter
                              _FormLabel(l10n.rsvpNumberOfGuests),
                              const SizedBox(height: 12),
                              _GuestCounter(
                                context: context,
                                count: _guestCount,
                                onChanged: (v) =>
                                    setState(() => _guestCount = v),
                              ),
                              //const SizedBox(height: 14),
                              // // Dietary
                              // _FormLabel(l10n.rsvpDietaryRequirements),
                              // const SizedBox(height: 8),
                              // TextFormField(
                              //   controller: _dietaryController,
                              //   maxLines: 3,
                              //   decoration: InputDecoration(
                              //     hintText: l10n.rsvpAllergies,
                              //   ),
                              // ),
                              // const SizedBox(height: 4),
                              // Text(
                              //   l10n.rsvpAccommodate,
                              //   style: AppTextStyles.bodySmall.copyWith(
                              //     color: AppColors.neutral400,
                              //   ),
                              // ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 28),
                  // Email
                  // _FormLabel(l10n.rsvpYourEmail),
                  // const SizedBox(height: 8),
                  // TextFormField(
                  //   controller: _emailController,
                  //   keyboardType: TextInputType.emailAddress,
                  //   decoration: InputDecoration(
                  //     hintText: l10n.rsvpEmailPlaceholder,
                  //     prefixIcon: const Icon(Icons.mail_outline, size: 20),
                  //   ),
                  //   validator: (v) {
                  //     if (v == null || v.trim().isEmpty) {
                  //       return l10n.rsvpPleaseEnterEmail;
                  //     }
                  //     if (!v.contains('@') || !v.contains('.')) {
                  //       return l10n.rsvpValidEmail;
                  //     }
                  //     return null;
                  //   },
                  // ),
                  //const SizedBox(height: 32),
                  // Divider
                  Container(height: 1, color: AppColors.neutral200),
                  const SizedBox(height: 24),
                  // Deadline note
                  // Text(
                  //   l10n.rsvpRespondBy,
                  //   style: AppTextStyles.bodySmall.copyWith(
                  //     color: AppColors.neutral500,
                  //   ),
                  //   textAlign: TextAlign.center,
                  // ),
                  // const SizedBox(height: 16),
                  // Submit
                  _SubmitButton(
                    context: context,
                    onTap: _submit,
                    loading: _submitting,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAbT5dHsN_3W8kITc8IqpF1sjKKZ-aEzC4viG6XOlkoGUDfZdMN3DwLF_KtRWx4ZDRJ454PmfJCtJgMj4ZU89dJIvTTf6NzB8r6Lhkd96duP00y3Ndp6uyeuChuBh3glfWPfE6TAJFhOBroLo3SO2LswiTW-dQlEa9f9B6PA10cylZaBwIVKfwLod8ojQmaiyEn8BGaKkth0sWTvUH0GLlwCfuKep6m3REZ5sKMtiEqfIiqQnbL92hRd1gFVrfC1jqp4Id6yJcgB9w',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                Container(color: AppColors.primaryLight),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black54, Colors.transparent],
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.rsvpPleaseJoinUs,
                  style: AppTextStyles.label.copyWith(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 10,
                    letterSpacing: 3,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Farkhat & Riza',
                  style: AppTextStyles.heading2.copyWith(
                    color: Colors.white,
                    fontSize: 36,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      l10n.rsvpLocation,
                      style: AppTextStyles.body.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FormLabel extends StatelessWidget {
  const _FormLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppTextStyles.heading3.copyWith(fontSize: 16));
  }
}

class _AttendanceOption extends StatefulWidget {
  const _AttendanceOption({
    required this.selected,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  final bool selected;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  @override
  State<_AttendanceOption> createState() => _AttendanceOptionState();
}

class _AttendanceOptionState extends State<_AttendanceOption> {
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
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: widget.selected
                ? Colors.white
                : AppColors.neutral100.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: widget.selected
                  ? widget.color.withValues(alpha: 0.25)
                  : Colors.transparent,
              width: 2,
            ),
            boxShadow: widget.selected
                ? [
                    BoxShadow(
                      color: widget.color.withValues(alpha: 0.12),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            children: [
              // Radio circle
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: widget.selected
                        ? widget.color
                        : AppColors.neutral400,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: widget.selected ? 10 : 0,
                    height: widget.selected ? 10 : 0,
                    decoration: BoxDecoration(
                      color: widget.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.w700,
                        color: _hovered ? widget.color : AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(widget.subtitle, style: AppTextStyles.bodySmall),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GuestCounter extends StatelessWidget {
  const _GuestCounter({
    required this.context,
    required this.count,
    required this.onChanged,
  });
  final BuildContext context;
  final int count;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.neutral100.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          _CounterButton(
            icon: Icons.remove,
            enabled: count > 1,
            onTap: () => onChanged(count - 1),
          ),
          Expanded(
            child: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '$count ',
                      style: AppTextStyles.heading2.copyWith(fontSize: 28),
                    ),
                    TextSpan(
                      text: l10n.rsvpPeople,
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.neutral500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _CounterButton(
            icon: Icons.add,
            enabled: count < 10,
            onTap: () => onChanged(count + 1),
          ),
        ],
      ),
    );
  }
}

class _CounterButton extends StatefulWidget {
  const _CounterButton({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  @override
  State<_CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<_CounterButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: widget.enabled
          ? SystemMouseCursors.click
          : SystemMouseCursors.forbidden,
      child: GestureDetector(
        onTap: widget.enabled ? widget.onTap : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _hovered && widget.enabled
                ? AppColors.primary
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 4,
              ),
            ],
          ),
          child: Icon(
            widget.icon,
            size: 20,
            color: !widget.enabled
                ? AppColors.neutral400
                : _hovered
                ? Colors.white
                : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}

class _SubmitButton extends StatefulWidget {
  const _SubmitButton({
    required this.context,
    required this.onTap,
    required this.loading,
  });
  final BuildContext context;
  final VoidCallback onTap;
  final bool loading;

  @override
  State<_SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<_SubmitButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.loading ? null : widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(
                  alpha: _hovered ? 0.4 : 0.25,
                ),
                blurRadius: _hovered ? 24 : 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          transform: _hovered
              ? (Matrix4.identity()
                  ..setEntry(0, 0, 1.01)
                  ..setEntry(1, 1, 1.01))
              : Matrix4.identity(),
          transformAlignment: Alignment.center,
          child: Center(
            child: widget.loading
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.rsvpConfirmButton,
                        style: AppTextStyles.button.copyWith(
                          fontSize: 15,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.send, size: 18, color: Colors.white),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _SuccessState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.08),
            blurRadius: 60,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_rounded,
              size: 36,
              color: AppColors.success,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            l10n.rsvpThankYou,
            style: AppTextStyles.heading2.copyWith(fontSize: 32),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.rsvpResponseRecorded,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              l10n.rsvpEventDate,
              style: AppTextStyles.body.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
