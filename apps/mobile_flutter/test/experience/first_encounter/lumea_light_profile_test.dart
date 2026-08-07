import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/experience/first_encounter/presentation/light/lumea_light_profile.dart';

void main() {
  group('LumeaLightProfile', () {
    test('contains all approved FX-002 presets', () {
      final List<LumeaLightProfilePreset> presets = LumeaLightProfilePreset
          .values
          .where((LumeaLightProfilePreset preset) {
            return preset != LumeaLightProfilePreset.custom;
          })
          .toList();

      expect(presets, hasLength(10));
      expect(
        presets.map((LumeaLightProfilePreset preset) {
          return LumeaLightProfile.preset(preset).code;
        }),
        containsAll(<String>[
          'PRESENCIA',
          'OBSERVACION',
          'MIRADA',
          'RECONOCIMIENTO',
          'REVERENCIA',
          'HUELLA',
          'ESPERA',
          'CONTACTO',
          'VINCULO',
          'UMBRAL',
        ]),
      );
    });

    test('keeps all normalized parameters inside safe ranges', () {
      for (final LumeaLightProfilePreset preset
          in LumeaLightProfilePreset.values) {
        if (preset == LumeaLightProfilePreset.custom) {
          continue;
        }

        final LumeaLightProfile profile = LumeaLightProfile.preset(preset);

        expect(profile.intensity, inInclusiveRange(0, 1));
        expect(profile.radiusScale, inInclusiveRange(0, 1));
        expect(profile.opacity, inInclusiveRange(0, 1));
        expect(profile.warmthGold, inInclusiveRange(0, 1));
        expect(profile.coolDepth, inInclusiveRange(0, 1));
        expect(profile.silverGlint, inInclusiveRange(0, 1));
        expect(profile.breathAmplitude, inInclusiveRange(0, 1));
        expect(profile.pulseAmplitude, inInclusiveRange(0, 1));
        expect(profile.organicVariation, inInclusiveRange(0, 1));
        expect(profile.focus, inInclusiveRange(0, 1));
        expect(profile.softness, inInclusiveRange(0, 1));
        expect(profile.breathPeriod, greaterThan(0));
        expect(profile.pulsePeriod, greaterThan(0));
        expect(
          profile.transitionDuration.inMilliseconds,
          greaterThanOrEqualTo(0),
        );
      }
    });

    test('interpolates between presets without parameter jumps', () {
      final LumeaLightProfile begin = LumeaLightProfile.preset(
        LumeaLightProfilePreset.presence,
      );
      final LumeaLightProfile end = LumeaLightProfile.preset(
        LumeaLightProfilePreset.threshold,
      );

      final LumeaLightProfile midpoint = LumeaLightProfile.lerp(
        begin,
        end,
        0.5,
      );

      expect(midpoint.intensity, greaterThan(begin.intensity));
      expect(midpoint.intensity, lessThan(end.intensity));
      expect(midpoint.radiusScale, greaterThan(begin.radiusScale));
      expect(midpoint.radiusScale, lessThan(end.radiusScale));
      expect(midpoint.opacity, greaterThan(begin.opacity));
      expect(midpoint.opacity, lessThan(end.opacity));
    });

    test('keeps ESPERA alive without reaching full extinction', () {
      final LumeaLightProfile waiting = LumeaLightProfile.preset(
        LumeaLightProfilePreset.waiting,
      );

      expect(waiting.minimumBreathingIntensity, greaterThan(0));
      expect(waiting.toProceduralLightParameters().isVisible, isTrue);
    });

    test('allows CONTACTO to suspend breath and pulse temporarily', () {
      final LumeaLightProfile contact = LumeaLightProfile.preset(
        LumeaLightProfilePreset.contact,
      );

      final parameters = contact.toProceduralLightParameters();

      expect(contact.suspendsBreathAndPulse, isTrue);
      expect(parameters.pulse, 0);
    });

    test('keeps silver glint optional and never dominant', () {
      for (final LumeaLightProfilePreset preset
          in LumeaLightProfilePreset.values) {
        if (preset == LumeaLightProfilePreset.custom) {
          continue;
        }

        final LumeaLightProfile profile = LumeaLightProfile.preset(preset);

        expect(profile.keepsSilverAsAccent, isTrue);
      }
    });

    test('allows controlled tuning overrides without assets', () {
      final LumeaLightProfile tuned = LumeaLightProfile.preset(
        LumeaLightProfilePreset.reverence,
      ).copyWith(intensity: 0.24, organicVariation: 0.26);

      expect(tuned.preset, LumeaLightProfilePreset.custom);
      expect(tuned.intensity, 0.24);
      expect(tuned.organicVariation, 0.26);
      expect(tuned.toProceduralLightParameters().isVisible, isTrue);
    });
  });
}
