import 'package:flutter/material.dart';

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

  static const double _desktopBreakpoint = 1040;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: scheme.surface,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth >= _desktopBreakpoint;

            if (isDesktop) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      VinsaghSpacing.xl,
                      VinsaghSpacing.xl,
                      0,
                      VinsaghSpacing.xl,
                    ),
                    child: SizedBox(
                      width: 264,
                      child: LumeaSidebar(isCompact: false),
                    ),
                  ),
                  Expanded(child: _DesktopHomeContent()),
                ],
              );
            }

            return const _CompactHomeContent();
          },
        ),
      ),
    );
  }
}

class _DesktopHomeContent extends StatelessWidget {
  const _DesktopHomeContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(VinsaghSpacing.xl),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GuardianHeader(),
              const SizedBox(height: VinsaghSpacing.lg),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(child: WalletCard()),
                  SizedBox(width: VinsaghSpacing.lg),
                  Expanded(child: ReconnectionAvailableCard()),
                ],
              ),
              const SizedBox(height: VinsaghSpacing.lg),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        SamaraCollectionsCard(),
                        SizedBox(height: VinsaghSpacing.lg),
                        AtelierCard(),
                        SizedBox(height: VinsaghSpacing.lg),
                        ImpactCard(),
                      ],
                    ),
                  ),
                  SizedBox(width: VinsaghSpacing.lg),
                  SizedBox(width: 336, child: CompanionPanel()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CompactHomeContent extends StatelessWidget {
  const _CompactHomeContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(VinsaghSpacing.md),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LumeaSidebar(isCompact: true),
              SizedBox(height: VinsaghSpacing.md),
              GuardianHeader(),
              SizedBox(height: VinsaghSpacing.md),
              WalletCard(),
              SizedBox(height: VinsaghSpacing.md),
              ReconnectionAvailableCard(),
              SizedBox(height: VinsaghSpacing.md),
              SamaraCollectionsCard(),
              SizedBox(height: VinsaghSpacing.md),
              AtelierCard(),
              SizedBox(height: VinsaghSpacing.md),
              ImpactCard(),
              SizedBox(height: VinsaghSpacing.md),
              CompanionPanel(),
            ],
          ),
        ),
      ),
    );
  }
}
