import 'package:flutter/material.dart';

import '../../theme/vinsagh_colors.dart';
import '../../theme/vinsagh_spacing.dart';
import 'widgets/atelier_card.dart';
import 'widgets/companion_panel.dart';
import 'widgets/guardian_header.dart';
import 'widgets/impact_card.dart';
import 'widgets/lumea_sidebar.dart';
import 'widgets/reconnection_available_card.dart';
import 'widgets/samara_collections_card.dart';
import 'widgets/wallet_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const double _desktopBreakpoint = 1080;
  static const double _tabletBreakpoint = 720;
  static const double _sidebarWidth = 244;
  static const double _contentMaxWidth = 1220;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VinsaghColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth >= _desktopBreakpoint;
            final isTablet = constraints.maxWidth >= _tabletBreakpoint;

            if (isDesktop) {
              return const Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      VinsaghSpacing.xl,
                      VinsaghSpacing.xl,
                      0,
                      VinsaghSpacing.xl,
                    ),
                    child: SizedBox(
                      width: _sidebarWidth,
                      child: LumeaSidebar(isCompact: false),
                    ),
                  ),
                  Expanded(
                    child: _HomeContent(
                      showCompactNavigation: false,
                      horizontalPadding: VinsaghSpacing.xl,
                      maxWidth: _contentMaxWidth,
                    ),
                  ),
                ],
              );
            }

            return _HomeContent(
              showCompactNavigation: true,
              horizontalPadding: isTablet
                  ? VinsaghSpacing.lg
                  : VinsaghSpacing.md,
              maxWidth: isTablet ? 900 : 720,
            );
          },
        ),
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({
    required this.showCompactNavigation,
    required this.horizontalPadding,
    required this.maxWidth,
  });

  final bool showCompactNavigation;
  final double horizontalPadding;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        VinsaghSpacing.xl,
        horizontalPadding,
        VinsaghSpacing.xl,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showCompactNavigation) ...[
                const LumeaSidebar(isCompact: true),
                const SizedBox(height: VinsaghSpacing.lg),
              ],
              const GuardianHeader(),
              const SizedBox(height: VinsaghSpacing.lg),
              const _ResponsiveFeatureGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResponsiveFeatureGrid extends StatelessWidget {
  const _ResponsiveFeatureGrid();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 1040
            ? 3
            : constraints.maxWidth >= 680
            ? 2
            : 1;
        final gap = columns == 1 ? VinsaghSpacing.md : VinsaghSpacing.lg;
        final columnWidth =
            (constraints.maxWidth - (gap * (columns - 1))) / columns;

        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            _FeatureGridItem(
              columns: columns,
              columnWidth: columnWidth,
              gap: gap,
              desktopSpan: 2,
              tabletSpan: 2,
              child: const ReconnectionAvailableCard(),
            ),
            _FeatureGridItem(
              columns: columns,
              columnWidth: columnWidth,
              gap: gap,
              child: const WalletCard(),
            ),
            _FeatureGridItem(
              columns: columns,
              columnWidth: columnWidth,
              gap: gap,
              desktopSpan: 2,
              tabletSpan: 2,
              child: const SamaraCollectionsCard(),
            ),
            _FeatureGridItem(
              columns: columns,
              columnWidth: columnWidth,
              gap: gap,
              child: const AtelierCard(),
            ),
            _FeatureGridItem(
              columns: columns,
              columnWidth: columnWidth,
              gap: gap,
              desktopSpan: 2,
              tabletSpan: 2,
              child: const ImpactCard(),
            ),
            _FeatureGridItem(
              columns: columns,
              columnWidth: columnWidth,
              gap: gap,
              child: const CompanionPanel(),
            ),
          ],
        );
      },
    );
  }
}

class _FeatureGridItem extends StatelessWidget {
  const _FeatureGridItem({
    required this.columns,
    required this.columnWidth,
    required this.gap,
    required this.child,
    this.desktopSpan = 1,
    this.tabletSpan = 1,
  });

  final int columns;
  final double columnWidth;
  final double gap;
  final int desktopSpan;
  final int tabletSpan;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final span =
        (columns >= 3
                ? desktopSpan.clamp(1, columns)
                : columns == 2
                ? tabletSpan.clamp(1, columns)
                : 1)
            .toInt();
    final itemWidth = (columnWidth * span) + (gap * (span - 1));

    return SizedBox(width: itemWidth, child: child);
  }
}
