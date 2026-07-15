import 'package:flutter/material.dart';

import '../../../../shared/theme/vinsagh_colors.dart';
import '../../../../shared/theme/vinsagh_spacing.dart';

class SamaraCollectionsCard extends StatelessWidget {
  const SamaraCollectionsCard({super.key});

  static const List<_SamaraPiece> _pieces = <_SamaraPiece>[
    _SamaraPiece(
      name: 'Semilla de Ceiba',
      detail: 'Fibra recuperada, borde dorado y textura de bosque.',
      icon: Icons.park_outlined,
    ),
    _SamaraPiece(
      name: 'Río Claro',
      detail: 'Cerámica suave con esmalte mineral y reflejo de agua.',
      icon: Icons.water_drop_outlined,
    ),
    _SamaraPiece(
      name: 'Bosque Naciente',
      detail: 'Madera reimaginada con veta visible y pulido cálido.',
      icon: Icons.forest_outlined,
    ),
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
            Text('Galería de Samara', style: theme.textTheme.titleMedium),
            const SizedBox(height: VinsaghSpacing.sm),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 620),
              child: Text(
                'Colecciones físicas para contemplar, sentir y acompañar cada etapa del Sendero.',
                style: theme.textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: VinsaghSpacing.lg),
            LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth >= 760
                    ? 3
                    : constraints.maxWidth >= 500
                    ? 2
                    : 1;
                final gap = VinsaghSpacing.md;
                final tileWidth =
                    (constraints.maxWidth - (gap * (columns - 1))) / columns;

                return Wrap(
                  spacing: gap,
                  runSpacing: gap,
                  children: [
                    for (final piece in _pieces)
                      SizedBox(
                        width: tileWidth,
                        child: _SamaraPieceTile(piece: piece),
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

class _SamaraPieceTile extends StatelessWidget {
  const _SamaraPieceTile({required this.piece});

  final _SamaraPiece piece;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(VinsaghSpacing.md),
      decoration: BoxDecoration(
        color: VinsaghColors.surfaceContainer.withAlpha(125),
        borderRadius: BorderRadius.circular(VinsaghRadii.md),
        border: Border.all(color: VinsaghColors.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 86,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  VinsaghColors.primaryContainer,
                  VinsaghColors.accentContainer,
                  VinsaghColors.surface,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(VinsaghRadii.sm),
              border: Border.all(color: VinsaghColors.accent.withAlpha(75)),
            ),
            child: Icon(piece.icon, color: VinsaghColors.primary, size: 34),
          ),
          const SizedBox(height: VinsaghSpacing.md),
          Text(piece.name, style: theme.textTheme.labelLarge),
          const SizedBox(height: VinsaghSpacing.xs),
          Text(piece.detail, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _SamaraPiece {
  const _SamaraPiece({
    required this.name,
    required this.detail,
    required this.icon,
  });

  final String name;
  final String detail;
  final IconData icon;
}
