import 'package:flutter/material.dart';

import '../../../../shared/theme/vinsagh_colors.dart';
import '../../../../shared/theme/vinsagh_spacing.dart';

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
    final isDark = !isCompact;
    final foreground = isDark
        ? VinsaghColors.inverseOnSurface
        : VinsaghColors.textPrimary;
    final secondaryForeground = isDark
        ? foreground.withAlpha(180)
        : VinsaghColors.textSecondary;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: isDark ? VinsaghColors.inverseSurface : VinsaghColors.surface,
        borderRadius: BorderRadius.circular(VinsaghRadii.lg),
        border: Border.all(
          color: isDark
              ? VinsaghColors.accent.withAlpha(90)
              : VinsaghColors.outlineVariant,
        ),
        boxShadow: [
          BoxShadow(
            color: VinsaghColors.primary.withAlpha(isDark ? 24 : 12),
            blurRadius: isDark ? 28 : 18,
            offset: Offset(0, isDark ? 18 : 10),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(
          isCompact ? VinsaghSpacing.md : VinsaghSpacing.lg,
        ),
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
                    color: VinsaghColors.accentContainer,
                    borderRadius: BorderRadius.circular(VinsaghRadii.sm),
                  ),
                  child: const Icon(
                    Icons.shield_outlined,
                    color: VinsaghColors.primary,
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
                          color: foreground,
                        ),
                      ),
                      const SizedBox(height: VinsaghSpacing.xs),
                      Text(
                        'Mi Sendero',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: secondaryForeground,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: isCompact ? VinsaghSpacing.md : VinsaghSpacing.xl),
            if (isCompact)
              _CompactNavigation(items: _items, isDark: isDark)
            else
              _SideList(items: _items, isDark: isDark),
          ],
        ),
      ),
    );
  }
}

class _SideList extends StatelessWidget {
  const _SideList({required this.items, required this.isDark});

  final List<_LumeaNavItem> items;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var index = 0; index < items.length; index++)
          Padding(
            padding: EdgeInsets.only(
              bottom: index == items.length - 1 ? 0 : VinsaghSpacing.sm,
            ),
            child: _NavigationTile(item: items[index], isDark: isDark),
          ),
      ],
    );
  }
}

class _CompactNavigation extends StatelessWidget {
  const _CompactNavigation({required this.items, required this.isDark});

  final List<_LumeaNavItem> items;
  final bool isDark;

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
                child: _NavigationTile(item: item, isDark: isDark),
              ),
          ],
        );
      },
    );
  }
}

class _NavigationTile extends StatelessWidget {
  const _NavigationTile({required this.item, required this.isDark});

  final _LumeaNavItem item;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final background = item.isActive
        ? VinsaghColors.accentContainer
        : isDark
        ? VinsaghColors.inverseOnSurface.withAlpha(18)
        : VinsaghColors.surfaceContainer.withAlpha(150);
    final foreground = item.isActive
        ? VinsaghColors.primary
        : isDark
        ? VinsaghColors.inverseOnSurface.withAlpha(225)
        : VinsaghColors.textPrimary;
    final borderColor = item.isActive
        ? VinsaghColors.accent.withAlpha(130)
        : isDark
        ? VinsaghColors.inverseOnSurface.withAlpha(35)
        : VinsaghColors.outlineVariant;

    return Container(
      constraints: const BoxConstraints(minHeight: 48),
      padding: const EdgeInsets.symmetric(
        horizontal: VinsaghSpacing.md,
        vertical: VinsaghSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(VinsaghRadii.sm),
        border: Border.all(color: borderColor),
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
