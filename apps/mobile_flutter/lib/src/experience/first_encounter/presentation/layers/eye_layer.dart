import 'package:flutter/material.dart';

import '../../application/first_encounter_controller.dart';
import '../../domain/first_encounter_phase.dart';

class EyeLayer extends StatelessWidget {
  const EyeLayer({super.key, required this.state});

  final FirstEncounterState state;

  @override
  Widget build(BuildContext context) {
    final bool isVisible =
        state.phase.index >= FirstEncounterPhase.eyelidsClosed.index &&
        !state.phase.isTerminal;

    final double opening = switch (state.phase) {
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
      key: const Key('eyeLayer'),
      child: Opacity(
        opacity: isVisible ? 1 : 0,
        child: Container(
          key: const Key('eyeThresholdCue'),
          width: 176,
          height: 28 + (opening * 56),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1208),
            borderRadius: BorderRadius.circular(120),
            border: Border.all(color: const Color(0xFFE0C36A), width: 1.4),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: const Color(0xFFE0C36A).withValues(alpha: 0.22),
                blurRadius: 32 * opening,
                spreadRadius: 4 * opening,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
