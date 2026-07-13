import 'package:flutter/material.dart';

import '../../../theme/vinsagh_colors.dart';
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
            Text('Mi Impacto', style: theme.textTheme.titleMedium),
            const SizedBox(height: VinsaghSpacing.sm),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 620),
              child: Text(
                'Métricas iniciales para observar cómo crece tu Huella sostenible.',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: VinsaghSpacing.lg),
            LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth >= 720
                    ? 3
                    : constraints.maxWidth >= 500
                    ? 2
                    : 1;
                final gap = VinsaghSpacing.md;
                final metricWidth =
                    (constraints.maxWidth - (gap * (columns - 1))) / columns;

                return Wrap(
                  spacing: gap,
                  runSpacing: gap,
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

    return Container(
      padding: const EdgeInsets.all(VinsaghSpacing.md),
      decoration: BoxDecoration(
        color: VinsaghColors.primaryContainer.withAlpha(145),
        borderRadius: BorderRadius.circular(VinsaghRadii.md),
        border: Border.all(color: VinsaghColors.primary.withAlpha(42)),
      ),
      child: Row(
        children: [
          Icon(metric.icon, color: VinsaghColors.primary, size: 24),
          const SizedBox(width: VinsaghSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  metric.value,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: VinsaghColors.primary,
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
