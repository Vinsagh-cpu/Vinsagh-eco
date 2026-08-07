import 'package:flutter/material.dart';

import '../../application/first_encounter_controller.dart';
import '../../domain/first_encounter_phase.dart';

class EyelidLayer extends StatelessWidget {
  const EyelidLayer({super.key, required this.state});

  final FirstEncounterState state;

  @override
  Widget build(BuildContext context) {
    final double aperture = switch (state.phase) {
      FirstEncounterPhase.darkness => 0,
      FirstEncounterPhase.eyelidsClosed => 0.04,
      FirstEncounterPhase.earsReact => 0.06,
      FirstEncounterPhase.firstBlink => 0.12,
      FirstEncounterPhase.openingEyes => 0.36,
      FirstEncounterPhase.huntingFocus => 0.28,
      FirstEncounterPhase.recognition => 0.42,
      FirstEncounterPhase.pupilLeafFormation => 0.5,
      FirstEncounterPhase.irisLightBreath => 0.58,
      FirstEncounterPhase.silverGlint => 0.64,
      FirstEncounterPhase.lumeaInFocus => 0.7,
      FirstEncounterPhase.invitation => 0.48,
      FirstEncounterPhase.completed => 0,
    };

    return IgnorePointer(
      key: const Key('eyelidLayer'),
      child: Opacity(
        opacity: state.phase == FirstEncounterPhase.darkness ? 0 : 1,
        child: Container(
          width: 188,
          height: 34 + (aperture * 60),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(120),
            border: Border.all(color: const Color(0xFF594628), width: 2),
          ),
        ),
      ),
    );
  }
}
