import 'package:flutter/material.dart';

import '../../../theme/vinsagh_colors.dart';
import '../../../theme/vinsagh_spacing.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 340;

        return DecoratedBox(
          decoration: BoxDecoration(
            color: VinsaghColors.surface,
            borderRadius: BorderRadius.circular(VinsaghRadii.lg),
            border: Border.all(color: VinsaghColors.outlineVariant),
            boxShadow: [
              BoxShadow(
                color: VinsaghColors.primary.withAlpha(12),
                blurRadius: 20,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(VinsaghSpacing.lg),
            child: isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: _WalletIntro(theme: theme)),
                      const SizedBox(width: VinsaghSpacing.lg),
                      _WalletBalance(theme: theme, alignEnd: true),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _WalletIntro(theme: theme),
                      const SizedBox(height: VinsaghSpacing.lg),
                      _WalletBalance(theme: theme, alignEnd: false),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class _WalletIntro extends StatelessWidget {
  const _WalletIntro({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [VinsaghColors.accentContainer, VinsaghColors.surface],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(VinsaghRadii.md),
            border: Border.all(color: VinsaghColors.accent.withAlpha(80)),
          ),
          child: const Icon(
            Icons.monetization_on_outlined,
            color: VinsaghColors.accent,
          ),
        ),
        const SizedBox(width: VinsaghSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mi Cartera', style: theme.textTheme.titleMedium),
              const SizedBox(height: VinsaghSpacing.xs),
              Text(
                'Reserva luminosa para futuras Reconexiones.',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _WalletBalance extends StatelessWidget {
  const _WalletBalance({required this.theme, required this.alignEnd});

  final ThemeData theme;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignEnd
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(
          '1,240',
          style: theme.textTheme.headlineMedium?.copyWith(
            color: VinsaghColors.primary,
            fontWeight: FontWeight.w800,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: VinsaghSpacing.xs),
        Text(
          'V.S. Coins',
          style: theme.textTheme.labelLarge?.copyWith(
            color: VinsaghColors.accent,
          ),
        ),
      ],
    );
  }
}
