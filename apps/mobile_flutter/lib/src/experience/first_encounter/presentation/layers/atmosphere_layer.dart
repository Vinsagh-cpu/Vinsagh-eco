import 'package:flutter/material.dart';

import '../../application/first_encounter_controller.dart';
import '../../domain/first_encounter_phase.dart';

class AtmosphereLayer extends StatelessWidget {
  const AtmosphereLayer({super.key, required this.state});

  final FirstEncounterState state;

  @override
  Widget build(BuildContext context) {
    final double opacity = switch (state.phase) {
      FirstEncounterPhase.darkness => 0.05,
      FirstEncounterPhase.eyelidsClosed => 0.08,
      FirstEncounterPhase.earsReact => 0.1,
      FirstEncounterPhase.firstBlink => 0.12,
      FirstEncounterPhase.openingEyes => 0.16,
      FirstEncounterPhase.huntingFocus => 0.18,
      FirstEncounterPhase.recognition => 0.22,
      FirstEncounterPhase.pupilLeafFormation => 0.26,
      FirstEncounterPhase.irisLightBreath => 0.32,
      FirstEncounterPhase.silverGlint => 0.34,
      FirstEncounterPhase.lumeaInFocus => 0.38,
      FirstEncounterPhase.invitation => 0.42,
      FirstEncounterPhase.completed => 0,
    };

    return IgnorePointer(
      key: const Key('atmosphereLayer'),
      child: Opacity(
        opacity: opacity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                const Color(0xFFC7D3DD).withValues(alpha: 0.16),
                const Color(0xFF8F7AA8).withValues(alpha: 0.06),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
