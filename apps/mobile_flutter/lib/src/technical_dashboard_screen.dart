import 'package:flutter/material.dart';

import 'theme/vinsagh_spacing.dart';
import 'widgets/footer_badge.dart';
import 'widgets/scope_panel.dart';
import 'widgets/technical_modules_panel.dart';
import 'widgets/technical_navigation_panel.dart';
import 'widgets/technical_status_card.dart';

class TechnicalDashboardScreen extends StatelessWidget {
  const TechnicalDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: scheme.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 920;

            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(VinsaghSpacing.xl),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _DashboardHeader(),
                      const SizedBox(height: VinsaghSpacing.lg),
                      const TechnicalNavigationPanel(),
                      const SizedBox(height: VinsaghSpacing.lg),
                      const TechnicalModulesPanel(),
                      const SizedBox(height: VinsaghSpacing.lg),
                      if (isWide)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(
                              child: TechnicalStatusCard(
                                title: 'Panel de estado',
                                lines: <String>[
                                  'Flutter Web base activo',
                                  'Sin Firebase',
                                  'Sin Flame',
                                  'Sin assets reales',
                                ],
                              ),
                            ),
                            SizedBox(width: VinsaghSpacing.lg),
                            Expanded(
                              child: ScopePanel(
                                title: 'Panel de alcance',
                                lines: <String>[
                                  'PACKAGE-002',
                                  'Entorno controlado',
                                  'Control de tokens',
                                ],
                              ),
                            ),
                          ],
                        )
                      else ...[
                        const TechnicalStatusCard(
                          title: 'Panel de estado',
                          lines: <String>[
                            'Flutter Web base activo',
                            'Sin Firebase',
                            'Sin Flame',
                            'Sin assets reales',
                          ],
                        ),
                        const SizedBox(height: VinsaghSpacing.lg),
                        const ScopePanel(
                          title: 'Panel de alcance',
                          lines: <String>[
                            'PACKAGE-002',
                            'Entorno controlado',
                            'Control de tokens',
                          ],
                        ),
                      ],
                      const SizedBox(height: VinsaghSpacing.lg),
                      const _TechnicalFooter(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader();

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
            Text('Vinsagh Eco Studios', style: theme.textTheme.headlineMedium),
            const SizedBox(height: VinsaghSpacing.sm),
            Text(
              'APP-006 · Módulos técnicos placeholder',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: VinsaghSpacing.md),
            Text(
              'Preparación controlada para validar estructura, orden y crecimiento técnico.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TechnicalFooter extends StatelessWidget {
  const _TechnicalFooter();

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
            Text('Pie tecnico', style: theme.textTheme.titleMedium),
            const SizedBox(height: VinsaghSpacing.md),
            Text(
              'Módulos visibles solo como placeholders técnicos; sin navegación funcional real.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: VinsaghSpacing.md),
            Wrap(
              spacing: VinsaghSpacing.sm,
              runSpacing: VinsaghSpacing.sm,
              children: const <Widget>[
                FooterBadge(icon: Icons.layers_outlined, label: 'PACKAGE-002'),
                FooterBadge(
                  icon: Icons.verified_outlined,
                  label: 'Entorno controlado',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
