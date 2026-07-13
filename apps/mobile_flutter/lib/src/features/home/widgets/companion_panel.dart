import 'package:flutter/material.dart';

import '../../../theme/vinsagh_spacing.dart';

class CompanionPanel extends StatelessWidget {
  const CompanionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.surfaceContainer,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(VinsaghSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.lightbulb_outline, color: scheme.tertiary, size: 28),
                const SizedBox(width: VinsaghSpacing.md),
                Expanded(
                  child: Text(
                    'Compi / Lumi',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: VinsaghSpacing.md),
            _CompanionNote(
              name: 'Compi',
              message:
                  'Te propone la siguiente acción, celebra el avance y abre caminos de exploración.',
              icon: Icons.explore_outlined,
            ),
            const SizedBox(height: VinsaghSpacing.md),
            _CompanionNote(
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
    final scheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(VinsaghSpacing.md),
      decoration: BoxDecoration(
        color: scheme.surface.withAlpha(190),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: scheme.primary, size: 22),
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
