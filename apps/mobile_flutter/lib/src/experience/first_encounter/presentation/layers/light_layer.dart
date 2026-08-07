import 'package:flutter/material.dart';

import '../../application/first_encounter_controller.dart';
import '../../domain/first_encounter_phase.dart';

class LightLayer extends StatelessWidget {
  const LightLayer({super.key, required this.state});

  final FirstEncounterState state;

  @override
  Widget build(BuildContext context) {
    final bool isVisible =
        state.phase.index >= FirstEncounterPhase.pupilLeafFormation.index &&
        !state.phase.isTerminal;

    return IgnorePointer(
      key: const Key('lightLayer'),
      child: Opacity(
        opacity: isVisible ? state.phaseProgress.clamp(0.2, 1).toDouble() : 0,
        child: Container(
          key: const Key('lightBreathCue'),
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: <Color>[
                Color(0xFFE5C766),
                Color(0xFF8DA8C8),
                Color(0x00000000),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
