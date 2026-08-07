import 'package:flutter/material.dart';

import '../../application/first_encounter_controller.dart';
import '../../domain/first_encounter_phase.dart';

class FocusLayer extends StatelessWidget {
  const FocusLayer({super.key, required this.state});

  final FirstEncounterState state;

  @override
  Widget build(BuildContext context) {
    final bool isVisible =
        state.phase.index >= FirstEncounterPhase.recognition.index &&
        !state.phase.isTerminal;

    return IgnorePointer(
      key: const Key('focusLayer'),
      child: Opacity(
        opacity: isVisible ? state.totalProgress.clamp(0.18, 0.72) : 0,
        child: Container(
          width: 230,
          height: 116,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(140),
            border: Border.all(
              color: const Color(0xFF8DA8C8).withValues(alpha: 0.42),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
