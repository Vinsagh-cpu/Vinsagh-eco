import 'package:flutter/material.dart';

import '../../../theme/vinsagh_spacing.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: scheme.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: scheme.primary.withAlpha(14),
            blurRadius: 20,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(VinsaghSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [scheme.tertiaryContainer, scheme.surface],
                      begin: Alignment.topLeft,
                      end: const Alignment(1, 1),
                    ),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: scheme.tertiary.withAlpha(80)),
                  ),
                  child: Icon(
                    Icons.monetization_on_outlined,
                    color: scheme.tertiary,
                  ),
                ),
                const SizedBox(width: VinsaghSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mi Cartera', style: theme.textTheme.titleMedium),
                      const SizedBox(height: VinsaghSpacing.xs),
                      Text(
                        'Estado luminoso y reservado para nuevas Reconexiones.',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: VinsaghSpacing.lg),
            Text(
              '1,240',
              style: theme.textTheme.headlineMedium?.copyWith(
                color: scheme.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: VinsaghSpacing.xs),
            Text(
              'V.S. Coins',
              style: theme.textTheme.labelLarge?.copyWith(
                color: scheme.tertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
