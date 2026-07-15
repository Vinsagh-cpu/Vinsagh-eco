import 'package:flutter/material.dart';

import '../../../../shared/theme/vinsagh_colors.dart';
import '../../../../shared/theme/vinsagh_spacing.dart';

class GuardianHeader extends StatelessWidget {
  const GuardianHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 760;

        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                VinsaghColors.primaryContainer,
                VinsaghColors.surface,
                VinsaghColors.accentContainer,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(VinsaghRadii.xl),
            border: Border.all(color: VinsaghColors.outlineVariant),
            boxShadow: [
              BoxShadow(
                color: VinsaghColors.primary.withAlpha(18),
                blurRadius: 28,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(
              isWide ? VinsaghSpacing.xl : VinsaghSpacing.lg,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: VinsaghSpacing.sm,
                        runSpacing: VinsaghSpacing.sm,
                        children: const [
                          _SignalChip(
                            icon: Icons.auto_awesome_outlined,
                            label: 'Lumea despierta',
                          ),
                          _SignalChip(
                            icon: Icons.fingerprint_outlined,
                            label: 'Primera Huella en curso',
                          ),
                        ],
                      ),
                      const SizedBox(height: VinsaghSpacing.lg),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 720),
                        child: Text(
                          'Bienvenida, Guardián',
                          style:
                              (isWide
                                      ? theme.textTheme.displaySmall
                                      : theme.textTheme.headlineMedium)
                                  ?.copyWith(
                                    color: VinsaghColors.primary,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0,
                                  ),
                        ),
                      ),
                      const SizedBox(height: VinsaghSpacing.sm),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 660),
                        child: Text(
                          'Tu Sendero abre una primera experiencia viva: piezas, rituales y señales de impacto reunidas con calma.',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: VinsaghColors.textPrimary.withAlpha(210),
                            fontWeight: FontWeight.w500,
                            height: 1.35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (isWide) ...[
                  const SizedBox(width: VinsaghSpacing.xl),
                  Container(
                    width: 132,
                    height: 132,
                    decoration: BoxDecoration(
                      color: VinsaghColors.surface.withAlpha(185),
                      borderRadius: BorderRadius.circular(VinsaghRadii.xl),
                      border: Border.all(color: VinsaghColors.outlineVariant),
                    ),
                    child: Icon(
                      Icons.spa_outlined,
                      color: scheme.tertiary,
                      size: 54,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SignalChip extends StatelessWidget {
  const _SignalChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: VinsaghSpacing.md,
        vertical: VinsaghSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: VinsaghColors.surface.withAlpha(180),
        borderRadius: BorderRadius.circular(VinsaghRadii.pill),
        border: Border.all(color: VinsaghColors.outlineVariant),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 17, color: scheme.tertiary),
          const SizedBox(width: VinsaghSpacing.sm),
          Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              color: VinsaghColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
