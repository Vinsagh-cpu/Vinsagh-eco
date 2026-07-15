import 'package:flutter/material.dart';

import '../shared/theme/vinsagh_spacing.dart';
import '../verticals/vertical_001_stage.dart';

class Vertical001Panel extends StatelessWidget {
  const Vertical001Panel({super.key});

  static const List<Vertical001Stage> stages = <Vertical001Stage>[
    Vertical001Stage(
      title: 'Umbral de entrada',
      description: 'Referencia inicial para ordenar el acceso al vertical.',
      marker: 'Etapa placeholder',
      icon: Icons.login_outlined,
    ),
    Vertical001Stage(
      title: 'Reconocimiento del Guardián',
      description:
          'Espacio técnico para validar identidad futura sin perfil real.',
      marker: 'Etapa placeholder',
      icon: Icons.shield_outlined,
    ),
    Vertical001Stage(
      title: 'Primera Travesía',
      description: 'Centro visual del Vertical 001, sin lógica de experiencia.',
      marker: 'Etapa placeholder',
      icon: Icons.explore_outlined,
    ),
    Vertical001Stage(
      title: 'Registro de intención',
      description:
          'Marcador visual sin formularios, guardado ni servicios externos.',
      marker: 'Etapa placeholder',
      icon: Icons.edit_note_outlined,
    ),
    Vertical001Stage(
      title: 'Validación inicial',
      description:
          'Punto reservado para revisión futura de Guardianes Fundadores.',
      marker: 'Etapa placeholder',
      icon: Icons.verified_outlined,
    ),
    Vertical001Stage(
      title: 'Cierre técnico',
      description: 'Cierre no funcional para comprobar orden y continuidad.',
      marker: 'Etapa placeholder',
      icon: Icons.flag_outlined,
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
              'Vertical 001 · Primera Travesía',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: VinsaghSpacing.md),
            Text(
              'Representación técnica no funcional para validar estructura inicial sin juego, rutas, Firebase, Flame ni assets.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: VinsaghSpacing.md),
            Column(
              children: [
                for (final stage in stages) ...[
                  _Vertical001StageRow(stage: stage),
                  const SizedBox(height: VinsaghSpacing.sm),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Vertical001StageRow extends StatelessWidget {
  const _Vertical001StageRow({required this.stage});

  final Vertical001Stage stage;

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
          Icon(stage.icon, size: 20, color: scheme.primary),
          const SizedBox(width: VinsaghSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(stage.title, style: theme.textTheme.labelLarge),
                const SizedBox(height: 2),
                Text(stage.description, style: theme.textTheme.bodyMedium),
                const SizedBox(height: 6),
                Text(
                  stage.marker,
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
