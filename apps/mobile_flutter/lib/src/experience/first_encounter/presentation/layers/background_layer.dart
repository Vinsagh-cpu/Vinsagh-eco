import 'package:flutter/material.dart';

import '../../domain/first_encounter_phase.dart';

class BackgroundLayer extends StatelessWidget {
  const BackgroundLayer({super.key, required this.phase});

  final FirstEncounterPhase phase;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      key: const Key('backgroundLayer'),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: _radiusForPhase(phase),
          colors: _colorsForPhase(phase),
        ),
      ),
    );
  }

  double _radiusForPhase(FirstEncounterPhase phase) {
    return switch (phase) {
      FirstEncounterPhase.darkness => 0.45,
      FirstEncounterPhase.eyelidsClosed => 0.48,
      FirstEncounterPhase.earsReact => 0.5,
      FirstEncounterPhase.firstBlink => 0.52,
      FirstEncounterPhase.openingEyes => 0.58,
      FirstEncounterPhase.huntingFocus => 0.62,
      FirstEncounterPhase.recognition => 0.68,
      FirstEncounterPhase.pupilLeafFormation => 0.72,
      FirstEncounterPhase.irisLightBreath => 0.78,
      FirstEncounterPhase.silverGlint => 0.82,
      FirstEncounterPhase.lumeaInFocus => 0.9,
      FirstEncounterPhase.invitation => 1,
      FirstEncounterPhase.completed => 1,
    };
  }

  List<Color> _colorsForPhase(FirstEncounterPhase phase) {
    return switch (phase) {
      FirstEncounterPhase.darkness => const <Color>[
        Color(0xFF050403),
        Color(0xFF000000),
      ],
      FirstEncounterPhase.eyelidsClosed ||
      FirstEncounterPhase.earsReact ||
      FirstEncounterPhase.firstBlink => const <Color>[
        Color(0xFF110E0A),
        Color(0xFF020201),
      ],
      FirstEncounterPhase.openingEyes || FirstEncounterPhase.huntingFocus =>
        const <Color>[Color(0xFF2B2110), Color(0xFF050403)],
      FirstEncounterPhase.recognition ||
      FirstEncounterPhase.pupilLeafFormation => const <Color>[
        Color(0xFF4B3916),
        Color(0xFF0A0805),
      ],
      FirstEncounterPhase.irisLightBreath || FirstEncounterPhase.silverGlint =>
        const <Color>[Color(0xFF7A5B21), Color(0xFF111827)],
      FirstEncounterPhase.lumeaInFocus ||
      FirstEncounterPhase.invitation ||
      FirstEncounterPhase.completed => const <Color>[
        Color(0xFF9B7A2A),
        Color(0xFF10291F),
      ],
    };
  }
}
