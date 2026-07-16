import 'package:flutter/material.dart';

import '../../../../shared/theme/vinsagh_colors.dart';
import '../../../../shared/theme/vinsagh_spacing.dart';

class CompanionPanel extends StatelessWidget {
  const CompanionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: VinsaghColors.surfaceContainer,
        borderRadius: BorderRadius.circular(VinsaghRadii.lg),
        border: Border.all(color: VinsaghColors.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(VinsaghSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: VinsaghColors.accentContainer,
                    borderRadius: BorderRadius.circular(VinsaghRadii.sm),
                  ),
                  child: const Icon(
                    Icons.lightbulb_outline,
                    color: VinsaghColors.accent,
                    size: 26,
                  ),
                ),
                const SizedBox(width: VinsaghSpacing.md),
                Expanded(
                  child: Text('Compi/Lumi', style: theme.textTheme.titleMedium),
                ),
              ],
            ),
            const SizedBox(height: VinsaghSpacing.lg),
            const _CompanionNote(
              name: 'Compi',
              message:
                  'Propone la siguiente acción, celebra el avance y abre caminos de exploración.',
              icon: Icons.explore_outlined,
            ),
            const SizedBox(height: VinsaghSpacing.md),
            const _CompanionNote(
              name: 'Lumi',
              message:
                  'Enciende curiosidad, reflexión y sensibilización para mirar mejor cada Huella.',
              icon: Icons.wb_sunny_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

class _CompanionNote extends StatelessWidget {
  const _CompanionNote({
    required this.name,
    required this.message,
    required this.icon,
  });

  final String name;
  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(VinsaghSpacing.md),
      decoration: BoxDecoration(
        color: VinsaghColors.surface.withAlpha(195),
        borderRadius: BorderRadius.circular(VinsaghRadii.md),
        border: Border.all(color: VinsaghColors.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: VinsaghColors.primary, size: 22),
          const SizedBox(width: VinsaghSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: theme.textTheme.labelLarge),
                const SizedBox(height: VinsaghSpacing.xs),
                Text(message, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
