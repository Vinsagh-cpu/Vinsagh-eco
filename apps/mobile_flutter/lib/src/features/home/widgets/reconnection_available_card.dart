import 'package:flutter/material.dart';

import '../../../theme/vinsagh_colors.dart';
import '../../../theme/vinsagh_spacing.dart';

class ReconnectionAvailableCard extends StatelessWidget {
  const ReconnectionAvailableCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 560;

        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                VinsaghColors.primary,
                VinsaghColors.secondary,
                VinsaghColors.canopy,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(VinsaghRadii.lg),
            boxShadow: [
              BoxShadow(
                color: VinsaghColors.primary.withAlpha(34),
                blurRadius: 30,
                offset: const Offset(0, 18),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(
              isWide ? VinsaghSpacing.xl : VinsaghSpacing.lg,
            ),
            child: isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: _ReconnectionCopy(isWide: isWide)),
                      const SizedBox(width: VinsaghSpacing.xl),
                      const _ReconnectionAction(),
                    ],
                  )
                : const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ReconnectionCopy(isWide: false),
                      SizedBox(height: VinsaghSpacing.lg),
                      _ReconnectionAction(),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class _ReconnectionCopy extends StatelessWidget {
  const _ReconnectionCopy({required this.isWide});

  final bool isWide;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: VinsaghColors.accentContainer.withAlpha(235),
            borderRadius: BorderRadius.circular(VinsaghRadii.md),
          ),
          child: const Icon(
            Icons.eco_outlined,
            color: VinsaghColors.primary,
            size: 30,
          ),
        ),
        const SizedBox(height: VinsaghSpacing.lg),
        Text(
          'Reconexión Disponible',
          style:
              (isWide
                      ? theme.textTheme.headlineMedium
                      : theme.textTheme.titleLarge)
                  ?.copyWith(
                    color: VinsaghColors.inverseOnSurface,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0,
                  ),
        ),
        const SizedBox(height: VinsaghSpacing.sm),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Text(
            'Un encuentro breve para bajar el ritmo, reconocer tu primera Huella y volver a elegir desde la calma.',
            style: theme.textTheme.titleMedium?.copyWith(
              color: VinsaghColors.inverseOnSurface.withAlpha(220),
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}

class _ReconnectionAction extends StatelessWidget {
  const _ReconnectionAction();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: FilledButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.spa_outlined, size: 18),
        label: const Text('Iniciar Reconexión'),
        style: FilledButton.styleFrom(
          backgroundColor: VinsaghColors.accentContainer,
          foregroundColor: VinsaghColors.primary,
          padding: const EdgeInsets.symmetric(
            horizontal: VinsaghSpacing.lg,
            vertical: VinsaghSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(VinsaghRadii.pill),
          ),
        ),
      ),
    );
  }
}
