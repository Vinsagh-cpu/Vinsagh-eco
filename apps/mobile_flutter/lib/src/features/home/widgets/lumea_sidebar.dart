import 'package:flutter/material.dart';

import '../../../theme/vinsagh_spacing.dart';

class LumeaSidebar extends StatelessWidget {
  const LumeaSidebar({super.key, required this.isCompact});

  final bool isCompact;

  static const List<_LumeaNavItem> _items = <_LumeaNavItem>[
    _LumeaNavItem('Mi Sendero', Icons.route_outlined, true),
    _LumeaNavItem('Galería de Samara', Icons.local_florist_outlined, false),
    _LumeaNavItem('Atelier', Icons.palette_outlined, false),
    _LumeaNavItem('Biblioteca', Icons.menu_book_outlined, false),
    _LumeaNavItem('Las Huellas', Icons.fingerprint_outlined, false),
    _LumeaNavItem('Mi Impacto', Icons.insights_outlined, false),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.inverseSurface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: scheme.tertiary.withAlpha(95)),
        boxShadow: [
          BoxShadow(
            color: scheme.primary.withAlpha(22),
            blurRadius: 28,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(VinsaghSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: scheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.shield_outlined,
                    color: scheme.primary,
                    size: 23,
                  ),
                ),
                const SizedBox(width: VinsaghSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lumea',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: scheme.onInverseSurface,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Mi Sendero',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: scheme.onInverseSurface.withAlpha(180),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: isCompact ? VinsaghSpacing.md : VinsaghSpacing.xl),
            if (isCompact)
              _CompactNavigation(items: _items)
            else
              _SideList(items: _items),
          ],
        ),
      ),
    );
  }
}

class _SideList extends StatelessWidget {
  const _SideList({required this.items});

  final List<_LumeaNavItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final item in items) ...[
          _NavigationTile(item: item),
          const SizedBox(height: VinsaghSpacing.sm),
        ],
      ],
    );
  }
}

class _CompactNavigation extends StatelessWidget {
  const _CompactNavigation({required this.items});

  final List<_LumeaNavItem> items;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth >= 560;
        final itemWidth = isTablet
            ? (constraints.maxWidth - VinsaghSpacing.sm) / 2
            : constraints.maxWidth;

        return Wrap(
          spacing: VinsaghSpacing.sm,
          runSpacing: VinsaghSpacing.sm,
          children: [
            for (final item in items)
              SizedBox(
                width: itemWidth,
                child: _NavigationTile(item: item),
              ),
          ],
        );
      },
    );
  }
}

class _NavigationTile extends StatelessWidget {
  const _NavigationTile({required this.item});

  final _LumeaNavItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final background = item.isActive
        ? scheme.tertiaryContainer
        : scheme.onInverseSurface.withAlpha(18);
    final foreground = item.isActive
        ? scheme.primary
        : scheme.onInverseSurface.withAlpha(225);

    return Container(
      constraints: const BoxConstraints(minHeight: 48),
      padding: const EdgeInsets.symmetric(
        horizontal: VinsaghSpacing.md,
        vertical: VinsaghSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: item.isActive
              ? scheme.tertiary.withAlpha(130)
              : scheme.onInverseSurface.withAlpha(35),
        ),
      ),
      child: Row(
        children: [
          Icon(item.icon, size: 20, color: foreground),
          const SizedBox(width: VinsaghSpacing.sm),
          Expanded(
            child: Text(
              item.label,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelLarge?.copyWith(color: foreground),
            ),
          ),
        ],
      ),
    );
  }
}

class _LumeaNavItem {
  const _LumeaNavItem(this.label, this.icon, this.isActive);

  final String label;
  final IconData icon;
  final bool isActive;
}
