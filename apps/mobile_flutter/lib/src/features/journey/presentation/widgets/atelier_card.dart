import 'package:flutter/material.dart';

import '../../../../shared/theme/vinsagh_colors.dart';
import '../../../../shared/theme/vinsagh_spacing.dart';

class AtelierCard extends StatelessWidget {
  const AtelierCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: VinsaghColors.surface,
        borderRadius: BorderRadius.circular(VinsaghRadii.lg),
        border: Border.all(color: VinsaghColors.outlineVariant),
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
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: VinsaghColors.primaryContainer,
                    borderRadius: BorderRadius.circular(VinsaghRadii.sm),
                  ),
                  child: const Icon(
                    Icons.palette_outlined,
                    color: VinsaghColors.primary,
                    size: 26,
                  ),
                ),
                const SizedBox(width: VinsaghSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Atelier', style: theme.textTheme.titleMedium),
                      const SizedBox(height: VinsaghSpacing.sm),
                      Text(
                        'Ajusta color, textura y símbolo antes de sellar una Huella.',
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
                foregroundColor: VinsaghColors.primary,
                side: const BorderSide(color: VinsaghColors.primary),
                padding: const EdgeInsets.symmetric(
                  horizontal: VinsaghSpacing.lg,
                  vertical: VinsaghSpacing.md,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(VinsaghRadii.pill),
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

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: VinsaghSpacing.md,
        vertical: VinsaghSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: VinsaghColors.secondaryContainer,
        borderRadius: BorderRadius.circular(VinsaghRadii.pill),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelLarge?.copyWith(
          color: VinsaghColors.secondary,
        ),
      ),
    );
  }
}
