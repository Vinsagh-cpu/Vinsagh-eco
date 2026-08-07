import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/presentation/light/procedural_light_parameters.dart';

void main() {
  group('ProceduralLightParameters', () {
    test('clamps numeric parameters to a safe range', () {
      final ProceduralLightParameters parameters =
          ProceduralLightParameters.clamped(
            intensity: 1.8,
            pulse: -0.4,
            spread: 2,
            noise: double.nan,
            trail: 0.5,
            focus: 1.2,
            silverGlint: -1,
          );

      expect(parameters.intensity, 1);
      expect(parameters.pulse, 0);
      expect(parameters.spread, 1);
      expect(parameters.noise, 0);
      expect(parameters.trail, 0.5);
      expect(parameters.focus, 1);
      expect(parameters.silverGlint, 0);
    });

    test('keeps ancient gold as the dominant base color mix', () {
      final LumeaLightColorMix colorMix = LumeaLightColorMix.ancientGold(
        mistGrey: 0.2,
        skyBlue: 0.18,
        violet: 0.1,
        silver: 0.04,
      );

      expect(colorMix.ancientGold, 1);
      expect(colorMix.silverPresence, lessThan(0.1));
      expect(colorMix.coolDepth, lessThan(0.25));
    });

    test('derives deterministic rendering factors', () {
      final ProceduralLightParameters parameters =
          ProceduralLightParameters.clamped(
            intensity: 0.7,
            pulse: 0.3,
            spread: 0.5,
            noise: 0.6,
            trail: 0.2,
            focus: 0.4,
            silverGlint: 0.1,
          );

      expect(parameters.isVisible, isTrue);
      expect(parameters.coreRadiusFactor, greaterThan(0.08));
      expect(parameters.spreadRadiusFactor, greaterThan(0.22));
      expect(parameters.glintOpacity, closeTo(0.0504, 0.0001));
    });

    test('can represent an inactive procedural light', () {
      final ProceduralLightParameters parameters =
          ProceduralLightParameters.inactive();

      expect(parameters.isVisible, isFalse);
      expect(parameters.intensity, 0);
      expect(parameters.glintOpacity, 0);
    });
  });
}
