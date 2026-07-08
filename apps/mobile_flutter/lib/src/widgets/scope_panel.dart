import 'package:flutter/material.dart';

class ScopePanel extends StatelessWidget {
  const ScopePanel({
    super.key,
    required this.title,
    required this.lines,
  });

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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            for (final line in lines) ...[
              _ScopeLine(theme: theme, label: line),
              const SizedBox(height: 8),
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
          padding: const EdgeInsets.only(top: 7),
          child: Icon(
            Icons.check_circle_outline,
            size: 16,
            color: scheme.primary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
