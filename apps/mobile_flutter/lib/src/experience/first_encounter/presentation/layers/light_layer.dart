import 'package:flutter/material.dart';

import '../../application/first_encounter_controller.dart';
import '../../domain/first_encounter_phase.dart';
import '../light/lumea_light_profile.dart';
import '../light/procedural_light_painter.dart';
import '../light/procedural_light_parameters.dart';

class LightLayer extends StatelessWidget {
  const LightLayer({super.key, required this.state});

  final FirstEncounterState state;

  @override
  Widget build(BuildContext context) {
    final ProceduralLightParameters parameters = _parametersForState(state);

    return IgnorePointer(
      key: const Key('lightLayer'),
      child: CustomPaint(
        key: const Key('proceduralLight'),
        painter: ProceduralLightPainter(
          parameters: parameters,
          seed: state.totalProgress,
        ),
        child: const SizedBox.expand(),
      ),
    );
  }

  ProceduralLightParameters _parametersForState(FirstEncounterState state) {
    if (state.phase.isTerminal) {
      return ProceduralLightParameters.inactive();
    }

    final LumeaLightProfile profile = LumeaLightProfile.preset(
      _profilePresetForPhase(state.phase),
    );

    return profile.toProceduralLightParameters(
      phaseProgress: state.phaseProgress,
    );
  }

  LumeaLightProfilePreset _profilePresetForPhase(FirstEncounterPhase phase) {
    return switch (phase) {
      FirstEncounterPhase.darkness => LumeaLightProfilePreset.presence,
      FirstEncounterPhase.eyelidsClosed ||
      FirstEncounterPhase.earsReact => LumeaLightProfilePreset.observation,
      FirstEncounterPhase.firstBlink ||
      FirstEncounterPhase.openingEyes ||
      FirstEncounterPhase.huntingFocus => LumeaLightProfilePreset.gaze,
      FirstEncounterPhase.recognition => LumeaLightProfilePreset.recognition,
      FirstEncounterPhase.pupilLeafFormation => LumeaLightProfilePreset.trace,
      FirstEncounterPhase.irisLightBreath => LumeaLightProfilePreset.waiting,
      FirstEncounterPhase.silverGlint => LumeaLightProfilePreset.recognition,
      FirstEncounterPhase.lumeaInFocus => LumeaLightProfilePreset.threshold,
      FirstEncounterPhase.invitation => LumeaLightProfilePreset.waiting,
      FirstEncounterPhase.completed => LumeaLightProfilePreset.presence,
    };
  }
}
