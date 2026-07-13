import 'package:flutter/material.dart';

import '../../../theme/vinsagh_spacing.dart';

class GuardianHeader extends StatelessWidget {
  const GuardianHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.primaryContainer,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: scheme.primary.withAlpha(45)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(VinsaghSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: VinsaghSpacing.sm,
              runSpacing: VinsaghSpacing.sm,
              children: [
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
            Text(
              'Bienvenida, Guardián',
              style: theme.textTheme.headlineMedium?.copyWith(
                color: scheme.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: VinsaghSpacing.sm),
            Text(
              'Mi Sendero reúne tus piezas, avances y señales de impacto dentro de Lumea.',
              style: theme.textTheme.titleMedium?.copyWith(
                color: scheme.onPrimaryContainer.withAlpha(210),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
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
        color: scheme.surface.withAlpha(165),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 17, color: scheme.tertiary),
          const SizedBox(width: VinsaghSpacing.sm),
          Text(label, style: theme.textTheme.labelLarge),
        ],
      ),
    );
  }
}
