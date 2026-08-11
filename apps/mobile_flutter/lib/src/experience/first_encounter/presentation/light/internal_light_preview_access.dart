import 'package:flutter/material.dart';

import 'light_preview_harness.dart';

class InternalLightPreviewAccess extends StatelessWidget {
  const InternalLightPreviewAccess({
    super.key,
    required this.child,
    this.enabled = const bool.fromEnvironment('LUMEA_ENABLE_INTERNAL_PREVIEW'),
  });

  final Widget child;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    if (!enabled) {
      return child;
    }

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        child,
        Positioned(
          right: 16,
          bottom: 16,
          child: SafeArea(
            child: FloatingActionButton.small(
              key: const Key('internalLightPreviewAccessButton'),
              heroTag: 'internalLightPreviewAccessButton',
              tooltip: 'Internal Light Preview',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    settings: const RouteSettings(
                      name: '/internal/light-preview',
                    ),
                    builder: (BuildContext context) {
                      return const Scaffold(body: LightPreviewHarness());
                    },
                  ),
                );
              },
              child: const Icon(Icons.tune_rounded),
            ),
          ),
        ),
      ],
    );
  }
}
