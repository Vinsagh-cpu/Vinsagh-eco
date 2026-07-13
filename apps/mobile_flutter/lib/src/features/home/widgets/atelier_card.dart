import 'package:flutter/material.dart';

import '../../../theme/vinsagh_spacing.dart';

class AtelierCard extends StatelessWidget {
  const AtelierCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(VinsaghSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.palette_outlined, color: scheme.primary, size: 28),
                const SizedBox(width: VinsaghSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Atelier', style: theme.textTheme.titleMedium),
                      const SizedBox(height: VinsaghSpacing.sm),
                      Text(
                        'Un espacio para ajustar color, textura y símbolo antes de sellar una Huella.',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: VinsaghSpacing.lg),
            Wrap(
              spacing: VinsaghSpacing.sm,
              runSpacing: VinsaghSpacing.sm,
              children: const [
                _AtelierTag(label: 'Color de Huella'),
                _AtelierTag(label: 'Textura natural'),
                _AtelierTag(label: 'Símbolo personal'),
              ],
            ),
            const SizedBox(height: VinsaghSpacing.lg),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.brush_outlined, size: 18),
              label: const Text('Crear en el Atelier'),
              style: OutlinedButton.styleFrom(
                foregroundColor: scheme.primary,
                side: BorderSide(color: scheme.primary),
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

class _AtelierTag extends StatelessWidget {
  const _AtelierTag({required this.label});

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
        color: scheme.secondaryContainer,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelLarge?.copyWith(color: scheme.secondary),
      ),
    );
  }
}
