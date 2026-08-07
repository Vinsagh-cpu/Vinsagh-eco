import 'package:flutter/material.dart';

import '../../domain/first_encounter_phase.dart';

class GuardianSilhouetteLayer extends StatelessWidget {
  const GuardianSilhouetteLayer({super.key, required this.phase});

  final FirstEncounterPhase phase;

  @override
  Widget build(BuildContext context) {
    final double opacity = switch (phase) {
      FirstEncounterPhase.darkness => 0,
      FirstEncounterPhase.eyelidsClosed => 0.16,
      FirstEncounterPhase.earsReact => 0.22,
      FirstEncounterPhase.firstBlink => 0.28,
      FirstEncounterPhase.openingEyes => 0.34,
      FirstEncounterPhase.huntingFocus => 0.4,
      FirstEncounterPhase.recognition => 0.46,
      FirstEncounterPhase.pupilLeafFormation => 0.52,
      FirstEncounterPhase.irisLightBreath => 0.58,
      FirstEncounterPhase.silverGlint => 0.64,
      FirstEncounterPhase.lumeaInFocus => 0.5,
      FirstEncounterPhase.invitation => 0.44,
      FirstEncounterPhase.completed => 0,
    };

    return IgnorePointer(
      key: const Key('guardianSilhouetteLayer'),
      child: Opacity(
        opacity: opacity,
        child: Container(
          key: const Key('guardianPresenceCue'),
          width: 250,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(96),
            border: Border.all(color: const Color(0xFFBCA05A), width: 1.2),
          ),
        ),
      ),
    );
  }
}
