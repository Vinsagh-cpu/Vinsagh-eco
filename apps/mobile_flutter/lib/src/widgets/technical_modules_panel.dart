import 'package:flutter/material.dart';

import '../modules/technical_module.dart';
import '../shared/theme/vinsagh_spacing.dart';

class TechnicalModulesPanel extends StatelessWidget {
  const TechnicalModulesPanel({super.key});

  static const List<TechnicalModule> modules = <TechnicalModule>[
    TechnicalModule(
      title: 'Umbral inicial',
      description: 'Entrada prevista para ordenar el primer contacto.',
      status: 'Placeholder técnico',
      icon: Icons.door_front_door_outlined,
    ),
    TechnicalModule(
      title: 'Perfil del Guardián',
      description: 'Espacio futuro para identidad narrativa controlada.',
      status: 'Placeholder técnico',
      icon: Icons.shield_outlined,
    ),
    TechnicalModule(
      title: 'Primera Travesía',
      description: 'Referencia visual para una experiencia inicial futura.',
      status: 'Placeholder técnico',
      icon: Icons.explore_outlined,
    ),
    TechnicalModule(
      title: 'Estado ambiental',
      description: 'Módulo reservado para señales ambientales posteriores.',
      status: 'Placeholder técnico',
      icon: Icons.eco_outlined,
    ),
    TechnicalModule(
      title: 'Validaciones',
      description: 'Bloque previsto para controles técnicos de crecimiento.',
      status: 'Placeholder técnico',
      icon: Icons.fact_check_outlined,
    ),
    TechnicalModule(
      title: 'Módulos futuros',
      description: 'Reserva estructural para nuevas piezas no funcionales.',
      status: 'Placeholder técnico',
      icon: Icons.view_module_outlined,
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
              'Módulos técnicos placeholder',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: VinsaghSpacing.md),
            Text(
              'Preparación visual de módulos futuros, sin rutas, datos, Firebase, Flame ni assets.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: VinsaghSpacing.md),
            LayoutBuilder(
              builder: (context, constraints) {
                final tileWidth = constraints.maxWidth >= 900
                    ? 316.0
                    : double.infinity;

                return Wrap(
                  spacing: VinsaghSpacing.sm,
                  runSpacing: VinsaghSpacing.sm,
                  children: modules
                      .map(
                        (module) => SizedBox(
                          width: tileWidth,
                          child: _TechnicalModuleTile(module: module),
                        ),
                      )
                      .toList(growable: false),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TechnicalModuleTile extends StatelessWidget {
  const _TechnicalModuleTile({required this.module});

  final TechnicalModule module;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(VinsaghSpacing.md),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(module.icon, size: 20, color: scheme.primary),
          const SizedBox(width: VinsaghSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(module.title, style: theme.textTheme.labelLarge),
                const SizedBox(height: 2),
                Text(module.description, style: theme.textTheme.bodyMedium),
                const SizedBox(height: 6),
                Text(
                  module.status,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: scheme.onSurfaceVariant,
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
