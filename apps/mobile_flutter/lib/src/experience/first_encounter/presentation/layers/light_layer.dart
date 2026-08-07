import 'package:flutter/material.dart';

import '../../application/first_encounter_controller.dart';
import '../../domain/first_encounter_phase.dart';
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
    return switch (state.phase) {
      FirstEncounterPhase.darkness ||
      FirstEncounterPhase.eyelidsClosed ||
      FirstEncounterPhase.earsReact ||
      FirstEncounterPhase.firstBlink ||
      FirstEncounterPhase.openingEyes ||
      FirstEncounterPhase.huntingFocus ||
      FirstEncounterPhase.recognition => ProceduralLightParameters.inactive(),
      FirstEncounterPhase.pupilLeafFormation =>
        ProceduralLightParameters.clamped(
          intensity: 0.36 + (state.phaseProgress * 0.24),
          colorMix: LumeaLightColorMix.ancientGold(
            mistGrey: 0.16,
            skyBlue: 0.1,
            violet: 0.08,
            silver: 0.02,
          ),
          pulse: 0.24,
          spread: 0.34,
          noise: 0.44,
          trail: 0.08,
          focus: 0.46,
          silverGlint: 0.02,
        ),
      FirstEncounterPhase.irisLightBreath => ProceduralLightParameters.clamped(
        intensity: 0.58 + (state.phaseProgress * 0.16),
        colorMix: LumeaLightColorMix.ancientGold(
          mistGrey: 0.24,
          skyBlue: 0.18,
          violet: 0.12,
          silver: 0.04,
        ),
        pulse: 0.58,
        spread: 0.52,
        noise: 0.56,
        trail: 0.12,
        focus: 0.58,
        silverGlint: 0.04,
      ),
      FirstEncounterPhase.silverGlint => ProceduralLightParameters.clamped(
        intensity: 0.72,
        colorMix: LumeaLightColorMix.ancientGold(
          mistGrey: 0.22,
          skyBlue: 0.2,
          violet: 0.12,
          silver: 0.42,
        ),
        pulse: 0.34,
        spread: 0.48,
        noise: 0.5,
        trail: 0.1,
        focus: 0.66,
        silverGlint: 0.64,
      ),
      FirstEncounterPhase.lumeaInFocus => ProceduralLightParameters.clamped(
        intensity: 0.64,
        colorMix: LumeaLightColorMix.ancientGold(
          mistGrey: 0.2,
          skyBlue: 0.18,
          violet: 0.1,
          silver: 0.08,
        ),
        pulse: 0.22,
        spread: 0.68,
        noise: 0.48,
        trail: 0.16,
        focus: 0.42,
        silverGlint: 0.04,
      ),
      FirstEncounterPhase.invitation => ProceduralLightParameters.clamped(
        intensity: 0.42,
        colorMix: LumeaLightColorMix.ancientGold(
          mistGrey: 0.16,
          skyBlue: 0.12,
          violet: 0.08,
          silver: 0.03,
        ),
        pulse: 0.16,
        spread: 0.62,
        noise: 0.42,
        trail: 0.28,
        focus: 0.32,
        silverGlint: 0.02,
      ),
      FirstEncounterPhase.completed => ProceduralLightParameters.inactive(),
    };
  }
}
