import 'package:flutter/material.dart';

import '../../../theme/vinsagh_spacing.dart';

class ImpactCard extends StatelessWidget {
  const ImpactCard({super.key});

  static const List<_ImpactMetric> _metrics = <_ImpactMetric>[
    _ImpactMetric('CO₂ evitado', '0.0 kg', Icons.cloud_outlined),
    _ImpactMetric('agua ahorrada', '0 L', Icons.water_outlined),
    _ImpactMetric('residuos reducidos', '0 g', Icons.recycling_outlined),
  ];

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
            Text('Mi Impacto', style: theme.textTheme.titleMedium),
            const SizedBox(height: VinsaghSpacing.sm),
            Text(
              'Métricas iniciales para observar cómo crece tu Huella sostenible.',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: VinsaghSpacing.lg),
            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth >= 620;
                final metricWidth = isWide
                    ? (constraints.maxWidth - (VinsaghSpacing.md * 2)) / 3
                    : constraints.maxWidth;

                return Wrap(
                  spacing: VinsaghSpacing.md,
                  runSpacing: VinsaghSpacing.md,
                  children: [
                    for (final metric in _metrics)
                      SizedBox(
                        width: metricWidth,
                        child: _ImpactMetricTile(metric: metric),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ImpactMetricTile extends StatelessWidget {
  const _ImpactMetricTile({required this.metric});

  final _ImpactMetric metric;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(VinsaghSpacing.md),
      decoration: BoxDecoration(
        color: scheme.primaryContainer.withAlpha(145),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: scheme.primary.withAlpha(42)),
      ),
      child: Row(
        children: [
          Icon(metric.icon, color: scheme.primary, size: 24),
          const SizedBox(width: VinsaghSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  metric.value,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: scheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: VinsaghSpacing.xs),
                Text(metric.label, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ImpactMetric {
  const _ImpactMetric(this.label, this.value, this.icon);

  final String label;
  final String value;
  final IconData icon;
}
