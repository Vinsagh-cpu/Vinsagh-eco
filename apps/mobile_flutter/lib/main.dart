import 'package:flutter/material.dart';

void main() {
  runApp(const VinsaghEcoApp());
}

class VinsaghEcoApp extends StatelessWidget {
  const VinsaghEcoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vinsagh Eco Studios',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF225C4A),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const TechnicalLayoutScreen(),
    );
  }
}

class TechnicalLayoutScreen extends StatelessWidget {
  const TechnicalLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final shellColor = scheme.surfaceContainerHighest.withAlpha(140);

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
                      _HeaderBlock(theme: theme),
                      const SizedBox(height: 24),
                      _WireframePreview(
                        theme: theme,
                        shellColor: shellColor,
                        isWide: isWide,
                      ),
                      const SizedBox(height: 24),
                      if (isWide)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _InfoPanel(
                                theme: theme,
                                title: 'Estructura base',
                                lines: const <String>[
                                  'Encabezado tecnico',
                                  'Zona principal tecnica',
                                  'Pie de validacion',
                                ],
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: _InfoPanel(
                                theme: theme,
                                title: 'Estado tecnico',
                                lines: const <String>[
                                  'Flutter Web base activo',
                                  'Sin Firebase',
                                  'Sin Flame',
                                  'Sin assets reales',
                                ],
                              ),
                            ),
                          ],
                        )
                      else ...[
                        _InfoPanel(
                          theme: theme,
                          title: 'Estructura base',
                          lines: const <String>[
                            'Encabezado tecnico',
                            'Zona principal tecnica',
                            'Pie de validacion',
                          ],
                        ),
                        const SizedBox(height: 24),
                        _InfoPanel(
                          theme: theme,
                          title: 'Estado tecnico',
                          lines: const <String>[
                            'Flutter Web base activo',
                            'Sin Firebase',
                            'Sin Flame',
                            'Sin assets reales',
                          ],
                        ),
                      ],
                      const SizedBox(height: 24),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: const <Widget>[
                          _StatusTag(
                            icon: Icons.web_outlined,
                            label: 'Web only',
                          ),
                          _StatusTag(
                            icon: Icons.lock_outline,
                            label: 'Sin Firebase',
                          ),
                          _StatusTag(
                            icon: Icons.bolt_outlined,
                            label: 'Sin Flame',
                          ),
                          _StatusTag(
                            icon: Icons.image_not_supported_outlined,
                            label: 'Sin assets reales',
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Base tecnica minima para continuar con PACKAGE-002.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: scheme.onSurfaceVariant,
                        ),
                      ),
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

class _HeaderBlock extends StatelessWidget {
  const _HeaderBlock({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
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
              'APP-002 - Estructura visual minima / layout tecnico inicial',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: const <Widget>[
                _StatusTag(
                  icon: Icons.view_quilt_outlined,
                  label: 'Layout tecnico',
                ),
                _StatusTag(
                  icon: Icons.web_outlined,
                  label: 'Flutter Web base activo',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _WireframePreview extends StatelessWidget {
  const _WireframePreview({
    required this.theme,
    required this.shellColor,
    required this.isWide,
  });

  final ThemeData theme;
  final Color shellColor;
  final bool isWide;

  @override
  Widget build(BuildContext context) {
    final scheme = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: shellColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _FrameBand(
              theme: theme,
              label: 'HEADER',
              content: 'Vinsagh Eco Studios',
            ),
            const SizedBox(height: 12),
            if (isWide)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _FrameBlock(
                      theme: theme,
                      title: 'MAIN CONTENT',
                      lines: const <String>[
                        'Zona de lectura tecnica',
                        'Bloques visuales minima',
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _FrameBlock(
                      theme: theme,
                      title: 'STATUS / VALIDATION',
                      lines: const <String>[
                        'Flutter Web base activo',
                        'Sin Firebase',
                        'Sin Flame',
                      ],
                    ),
                  ),
                ],
              )
            else ...[
              _FrameBlock(
                theme: theme,
                title: 'MAIN CONTENT',
                lines: const <String>[
                  'Zona de lectura tecnica',
                  'Bloques visuales minima',
                ],
              ),
              const SizedBox(height: 12),
              _FrameBlock(
                theme: theme,
                title: 'STATUS / VALIDATION',
                lines: const <String>[
                  'Flutter Web base activo',
                  'Sin Firebase',
                  'Sin Flame',
                ],
              ),
            ],
            const SizedBox(height: 12),
            _FrameBand(
              theme: theme,
              label: 'FOOTER',
              content: 'Sin assets reales - sin pantallas finales',
            ),
          ],
        ),
      ),
    );
  }
}

class _FrameBand extends StatelessWidget {
  const _FrameBand({
    required this.theme,
    required this.label,
    required this.content,
  });

  final ThemeData theme;
  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    final scheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: scheme.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              content,
              style: theme.textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _FrameBlock extends StatelessWidget {
  const _FrameBlock({
    required this.theme,
    required this.title,
    required this.lines,
  });

  final ThemeData theme;
  final String title;
  final List<String> lines;

  @override
  Widget build(BuildContext context) {
    final scheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: scheme.primary,
            ),
          ),
          const SizedBox(height: 12),
          for (final line in lines) ...[
            _BulletLine(theme: theme, label: line),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

class _InfoPanel extends StatelessWidget {
  const _InfoPanel({
    required this.theme,
    required this.title,
    required this.lines,
  });

  final ThemeData theme;
  final String title;
  final List<String> lines;

  @override
  Widget build(BuildContext context) {
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
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            for (final line in lines) ...[
              _BulletLine(theme: theme, label: line),
              const SizedBox(height: 8),
            ],
          ],
        ),
      ),
    );
  }
}

class _BulletLine extends StatelessWidget {
  const _BulletLine({required this.theme, required this.label});

  final ThemeData theme;
  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 7),
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: scheme.primary,
              shape: BoxShape.circle,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

class _StatusTag extends StatelessWidget {
  const _StatusTag({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: scheme.primary),
          const SizedBox(width: 8),
          Text(
            label,
            style: theme.textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
