import 'package:flutter/material.dart';

import '../shared/theme/vinsagh_spacing.dart';

class ScopePanel extends StatelessWidget {
  const ScopePanel({super.key, required this.title, required this.lines});

  final String title;
  final List<String> lines;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest.withAlpha(110),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(VinsaghSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleMedium),
            const SizedBox(height: VinsaghSpacing.md),
            for (final line in lines) ...[
              _ScopeLine(theme: theme, label: line),
              const SizedBox(height: VinsaghSpacing.sm),
            ],
          ],
        ),
      ),
    );
  }
}

class _ScopeLine extends StatelessWidget {
  const _ScopeLine({required this.theme, required this.label});

  final ThemeData theme;
  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: VinsaghSpacing.sm),
          child: Icon(
            Icons.check_circle_outline,
            size: VinsaghSpacing.md,
            color: scheme.primary,
          ),
        ),
        const SizedBox(width: VinsaghSpacing.md),
        Expanded(child: Text(label, style: theme.textTheme.bodyMedium)),
      ],
    );
  }
}
