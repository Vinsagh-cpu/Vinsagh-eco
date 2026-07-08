import 'package:flutter/material.dart';

import 'widgets/footer_badge.dart';
import 'widgets/scope_panel.dart';
import 'widgets/technical_status_card.dart';

class TechnicalDashboardScreen extends StatelessWidget {
  const TechnicalDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: scheme.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 920;

            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _DashboardHeader(),
                      const SizedBox(height: 24),
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
                            SizedBox(width: 24),
                            Expanded(
                              child: ScopePanel(
                                title: 'Panel de alcance',
                                lines: <String>[
                                  'PACKAGE-002',
                                  'Entorno controlado',
                                  'Widgets t\u00E9cnicos separados',
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
                        const SizedBox(height: 24),
                        const ScopePanel(
                          title: 'Panel de alcance',
                          lines: <String>[
                            'PACKAGE-002',
                            'Entorno controlado',
                            'Widgets t\u00E9cnicos separados',
                          ],
                        ),
                      ],
                      const SizedBox(height: 24),
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
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vinsagh Eco Studios',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'APP-003 \u00B7 Widgets t\u00E9cnicos separados',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Text(
              'Base t\u00E9cnica m\u00EDnima para PACKAGE-002.',
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pie tecnico',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: const <Widget>[
                FooterBadge(
                  icon: Icons.layers_outlined,
                  label: 'PACKAGE-002',
                ),
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
