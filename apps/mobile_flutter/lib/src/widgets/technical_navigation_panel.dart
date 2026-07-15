import 'package:flutter/material.dart';

import '../navigation/technical_navigation_item.dart';
import '../shared/theme/vinsagh_spacing.dart';

class TechnicalNavigationPanel extends StatelessWidget {
  const TechnicalNavigationPanel({super.key});

  static const List<TechnicalNavigationItem> items = <TechnicalNavigationItem>[
    TechnicalNavigationItem(
      label: 'Inicio técnico',
      icon: Icons.home_outlined,
      description: 'Entrada inicial del sistema.',
      isActive: true,
    ),
    TechnicalNavigationItem(
      label: 'Estado del entorno',
      icon: Icons.monitor_heart_outlined,
      description: 'Resumen del contexto operativo.',
    ),
    TechnicalNavigationItem(
      label: 'Módulos futuros',
      icon: Icons.view_module_outlined,
      description: 'Secciones previstas para crecimiento.',
    ),
    TechnicalNavigationItem(
      label: 'Experiencia',
      icon: Icons.auto_awesome_outlined,
      description: 'Capa narrativa y visual por venir.',
    ),
    TechnicalNavigationItem(
      label: 'Validaciones',
      icon: Icons.verified_outlined,
      description: 'Controles técnicos y checks de base.',
    ),
  ];

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
            Text(
              'Navegación técnica no funcional',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: VinsaghSpacing.md),
            Text(
              'Representación visual de futuras secciones, sin rutas reales ni cambio de pantalla.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: VinsaghSpacing.md),
            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth >= 900;

                if (isWide) {
                  return Wrap(
                    spacing: VinsaghSpacing.sm,
                    runSpacing: VinsaghSpacing.sm,
                    children: items
                        .map(
                          (item) => SizedBox(
                            width: 196,
                            child: _TechnicalNavigationTile(item: item),
                          ),
                        )
                        .toList(growable: false),
                  );
                }

                return Column(
                  children: [
                    for (final item in items) ...[
                      _TechnicalNavigationTile(item: item),
                      const SizedBox(height: VinsaghSpacing.sm),
                    ],
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

class _TechnicalNavigationTile extends StatelessWidget {
  const _TechnicalNavigationTile({required this.item});

  final TechnicalNavigationItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final background = item.isActive ? scheme.primaryContainer : scheme.surface;
    final foreground = item.isActive
        ? scheme.onPrimaryContainer
        : scheme.onSurface;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(VinsaghSpacing.md),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: item.isActive ? scheme.primary : scheme.outlineVariant,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(item.icon, size: 20, color: foreground),
          const SizedBox(width: VinsaghSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.label,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: foreground,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: foreground.withAlpha(190),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.isActive ? 'Placeholder activo' : 'Placeholder tecnico',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: foreground.withAlpha(200),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
