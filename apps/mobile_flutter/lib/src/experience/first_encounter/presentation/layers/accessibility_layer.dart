import 'package:flutter/material.dart';

class FirstEncounterAccessibilityLayer extends StatelessWidget {
  const FirstEncounterAccessibilityLayer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      key: const Key('firstEncounterAccessibilityLayer'),
      label: 'Primer Encuentro de Lumea',
      explicitChildNodes: true,
      child: child,
    );
  }
}
