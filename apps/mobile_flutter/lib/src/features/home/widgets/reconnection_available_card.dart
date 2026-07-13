import 'package:flutter/material.dart';

import '../../../theme/vinsagh_spacing.dart';

class ReconnectionAvailableCard extends StatelessWidget {
  const ReconnectionAvailableCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [scheme.primary, scheme.secondary],
          begin: Alignment.topLeft,
          end: const Alignment(1, 1),
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: scheme.primary.withAlpha(36),
            blurRadius: 28,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(VinsaghSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.eco_outlined, color: scheme.tertiaryContainer, size: 30),
            const SizedBox(height: VinsaghSpacing.md),
            Text(
              'Reconexión Disponible',
              style: theme.textTheme.titleMedium?.copyWith(
                color: scheme.onInverseSurface,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: VinsaghSpacing.sm),
            Text(
              'Un nuevo encuentro está listo para abrir tu Primera Huella con calma y propósito.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: scheme.onInverseSurface.withAlpha(210),
              ),
            ),
            const SizedBox(height: VinsaghSpacing.lg),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.spa_outlined, size: 18),
              label: const Text('Iniciar Reconexión'),
              style: FilledButton.styleFrom(
                backgroundColor: scheme.tertiaryContainer,
                foregroundColor: scheme.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: VinsaghSpacing.lg,
                  vertical: VinsaghSpacing.md,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
